import Foundation
import Combine
import CoreLocation

struct PrayerDayTimings: Codable {
    let Fajr: String
    let Sunrise: String
    let Dhuhr: String
    let Asr: String
    let Maghrib: String
    let Isha: String
}

struct PrayerDayData: Decodable {
    let timings: PrayerDayTimings
}

struct PrayerAPIResponse: Decodable {
    let code: Int
    let status: String
    let timings: PrayerDayTimings?

    private enum CodingKeys: String, CodingKey {
        case code
        case status
        case data
    }

    private enum DataKeys: String, CodingKey {
        case timings
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decodeIfPresent(Int.self, forKey: .code) ?? -1
        status = try container.decodeIfPresent(String.self, forKey: .status) ?? "Unknown status"

        if let dataContainer = try? container.nestedContainer(keyedBy: DataKeys.self, forKey: .data) {
            timings = try dataContainer.decodeIfPresent(PrayerDayTimings.self, forKey: .timings)
        } else {
            timings = nil
        }
    }
}

struct RamadanInfo {
    let startDate: Date
    let endDate: Date
    let currentDayOfRamadan: Int?
    let totalDays: Int

    var isRamadan: Bool {
        currentDayOfRamadan != nil
    }

    static func current(for referenceDate: Date = Date()) -> RamadanInfo {
        let hijriCalendar = Calendar(identifier: .islamicUmmAlQura)
        let currentHijriYear = hijriCalendar.component(.year, from: referenceDate)
        let currentRange = ramadanRange(for: currentHijriYear, calendar: hijriCalendar)

        if referenceDate >= currentRange.startDate && referenceDate <= currentRange.endDate {
            let gregorianCalendar = Calendar.current
            let today = gregorianCalendar.startOfDay(for: referenceDate)
            let startDay = gregorianCalendar.startOfDay(for: currentRange.startDate)
            let dayNumber = (gregorianCalendar.dateComponents([.day], from: startDay, to: today).day ?? 0) + 1

            return RamadanInfo(
                startDate: currentRange.startDate,
                endDate: currentRange.endDate,
                currentDayOfRamadan: min(dayNumber, currentRange.totalDays),
                totalDays: currentRange.totalDays
            )
        }

        let nextRange = referenceDate < currentRange.startDate
            ? currentRange
            : ramadanRange(for: currentHijriYear + 1, calendar: hijriCalendar)

        return RamadanInfo(
            startDate: nextRange.startDate,
            endDate: nextRange.endDate,
            currentDayOfRamadan: nil,
            totalDays: nextRange.totalDays
        )
    }

    private static func ramadanRange(for hijriYear: Int, calendar: Calendar) -> (startDate: Date, endDate: Date, totalDays: Int) {
        var startComponents = DateComponents()
        startComponents.calendar = calendar
        startComponents.year = hijriYear
        startComponents.month = 9
        startComponents.day = 1

        var shawwalComponents = DateComponents()
        shawwalComponents.calendar = calendar
        shawwalComponents.year = hijriYear
        shawwalComponents.month = 10
        shawwalComponents.day = 1

        let startDate = calendar.date(from: startComponents) ?? Date()
        let shawwalStart = calendar.date(from: shawwalComponents) ?? startDate
        let totalDays = calendar.dateComponents([.day], from: startDate, to: shawwalStart).day ?? 30
        let endDate = Calendar.current.date(byAdding: .second, value: -1, to: shawwalStart) ?? shawwalStart

        return (startDate, endDate, totalDays)
    }
}

enum PrayerAPIError: LocalizedError {
    case invalidURL
    case httpStatus(Int)
    case invalidAPIResponse(status: String, code: Int)
    case emptyResponse

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL de l'API invalide."
        case .httpStatus(let statusCode):
            return "Réponse HTTP invalide (\(statusCode))."
        case .invalidAPIResponse(let status, let code):
            return "Réponse API invalide (\(status), code \(code))."
        case .emptyResponse:
            return "Réponse vide de l'API des horaires."
        }
    }
}

final class PrayerAPIService {
    static let shared = PrayerAPIService()

    private let baseURL = "https://api.aladhan.com/v1/timings"
    private let cachePrefix = "cachedPrayerTimings"
    private let latestCachePrefix = "latestPrayerTimings"
    private let transientHTTPCodes: Set<Int> = [408, 429, 500, 502, 503, 504]

    private init() {}

    func fetchPrayerTimes(
        latitude: Double,
        longitude: Double,
        method: Int,
        date: Date,
        completion: @escaping (Result<PrayerDayTimings, Error>) -> Void
    ) {
        if let cachedTimings = getCachedTimings(latitude: latitude, longitude: longitude, method: method, date: date) {
            DispatchQueue.main.async {
                completion(.success(cachedTimings))
            }
            return
        }

        let requestDate = Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: date) ?? date
        let timestamp = Int(requestDate.timeIntervalSince1970)
        let urlString = "\(baseURL)/\(timestamp)?latitude=\(latitude)&longitude=\(longitude)&method=\(method)"

        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async {
                completion(.failure(PrayerAPIError.invalidURL))
            }
            return
        }

        var request = URLRequest(url: url)
        request.timeoutInterval = 20

        performRequest(
            request: request,
            latitude: latitude,
            longitude: longitude,
            method: method,
            date: date,
            retryCount: 1,
            completion: completion
        )
    }

    func getLatestCachedTimings(latitude: Double, longitude: Double, method: Int) -> PrayerDayTimings? {
        let key = latestCacheKey(latitude: latitude, longitude: longitude, method: method)
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(PrayerDayTimings.self, from: data)
    }

    private func performRequest(
        request: URLRequest,
        latitude: Double,
        longitude: Double,
        method: Int,
        date: Date,
        retryCount: Int,
        completion: @escaping (Result<PrayerDayTimings, Error>) -> Void
    ) {
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            let httpStatusCode = (response as? HTTPURLResponse)?.statusCode

            if let error {
                if retryCount > 0 {
                    self?.performRequest(
                        request: request,
                        latitude: latitude,
                        longitude: longitude,
                        method: method,
                        date: date,
                        retryCount: retryCount - 1,
                        completion: completion
                    )
                    return
                }

                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }

            guard let data else {
                DispatchQueue.main.async {
                    completion(.failure(PrayerAPIError.emptyResponse))
                }
                return
            }

            if let httpStatusCode, !(200 ... 299).contains(httpStatusCode) {
                if retryCount > 0, self?.transientHTTPCodes.contains(httpStatusCode) == true {
                    self?.performRequest(
                        request: request,
                        latitude: latitude,
                        longitude: longitude,
                        method: method,
                        date: date,
                        retryCount: retryCount - 1,
                        completion: completion
                    )
                    return
                }

                DispatchQueue.main.async {
                    completion(.failure(PrayerAPIError.httpStatus(httpStatusCode)))
                }
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(PrayerAPIResponse.self, from: data)
                guard decodedResponse.code == 200, let timings = decodedResponse.timings else {
                    DispatchQueue.main.async {
                        completion(.failure(PrayerAPIError.invalidAPIResponse(status: decodedResponse.status, code: decodedResponse.code)))
                    }
                    return
                }

                self?.cacheTimings(timings, latitude: latitude, longitude: longitude, method: method, date: date)
                DispatchQueue.main.async {
                    completion(.success(timings))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }

    private func getCachedTimings(latitude: Double, longitude: Double, method: Int, date: Date) -> PrayerDayTimings? {
        let key = cacheKey(latitude: latitude, longitude: longitude, method: method, date: date)
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(PrayerDayTimings.self, from: data)
    }

    private func cacheTimings(_ timings: PrayerDayTimings, latitude: Double, longitude: Double, method: Int, date: Date) {
        if let data = try? JSONEncoder().encode(timings) {
            let key = cacheKey(latitude: latitude, longitude: longitude, method: method, date: date)
            UserDefaults.standard.set(data, forKey: key)

            let latestKey = latestCacheKey(latitude: latitude, longitude: longitude, method: method)
            UserDefaults.standard.set(data, forKey: latestKey)
        }
    }

    private func cacheKey(latitude: Double, longitude: Double, method: Int, date: Date) -> String {
        "\(cachePrefix)_\(formattedDate(date))_\(roundedCoordinate(latitude))_\(roundedCoordinate(longitude))_\(method)"
    }

    private func latestCacheKey(latitude: Double, longitude: Double, method: Int) -> String {
        "\(latestCachePrefix)_\(roundedCoordinate(latitude))_\(roundedCoordinate(longitude))_\(method)"
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }

    private func roundedCoordinate(_ value: Double) -> String {
        let roundedValue = (value * 100).rounded() / 100
        return String(format: "%.2f", roundedValue)
    }
}

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()

    @Published var location: CLLocation?
    @Published var cityName: String = ""
    @Published var countryCode: String = Locale.current.region?.identifier ?? "FR"
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var errorMessage: String?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
    }

    func requestLocation() {
        authorizationStatus = locationManager.authorizationStatus

        switch authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.requestLocation()
        case .denied, .restricted:
            errorMessage = "Accès à la localisation refusé."
        @unknown default:
            break
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.last else { return }
        location = latestLocation
        fetchCityDetails(from: latestLocation)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        errorMessage = error.localizedDescription
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus

        if authorizationStatus == .authorizedWhenInUse || authorizationStatus == .authorizedAlways {
            locationManager.requestLocation()
        }
    }

    private func fetchCityDetails(from location: CLLocation) {
        CLGeocoder().reverseGeocodeLocation(location) { [weak self] placemarks, error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                return
            }

            if let placemark = placemarks?.first {
                self?.cityName = placemark.locality ?? placemark.administrativeArea ?? ""
                self?.countryCode = placemark.isoCountryCode ?? Locale.current.region?.identifier ?? "FR"
            }
        }
    }
}

@MainActor
final class HomeViewModel: ObservableObject {
    private let locationManager = LocationManager()
    private let prayerService = PrayerAPIService.shared
    private let calendar = Calendar.current

    @Published var prayers: [PrayerTime] = []
    @Published var nextFtourTime: Date?
    @Published var timeUntilFtour: String = "--:--:--"
    @Published var cityName: String = ""
    @Published var isLoadingPrayers = false
    @Published var ramadanInfo: RamadanInfo = RamadanInfo.current()
    @Published var prayerErrorMessage: String?

    private var todayMaghrib: Date?
    private var tomorrowMaghrib: Date?
    private var currentLocation: CLLocation?
    private var lastPrayerFetchDate: Date?
    private var lastPrayerFetchLocation: CLLocation?
    private var lastObservedDay = Calendar.current.startOfDay(for: Date())

    private var timer: Timer?
    private var cancellables = Set<AnyCancellable>()

    init() {
        loadDefaultPrayers()
        setupLocationObserver()
        startTimer()
    }

    deinit {
        timer?.invalidate()
    }

    func refreshData() {
        ramadanInfo = RamadanInfo.current()
        locationManager.requestLocation()

        if let currentLocation {
            fetchPrayerTimes(location: currentLocation, force: true)
        }
    }

    private func setupLocationObserver() {
        locationManager.$location
            .compactMap { $0 }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] location in
                self?.currentLocation = location
                self?.fetchPrayerTimes(location: location)
            }
            .store(in: &cancellables)

        locationManager.$cityName
            .receive(on: DispatchQueue.main)
            .assign(to: &$cityName)

        locationManager.$countryCode
            .removeDuplicates()
            .dropFirst()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self, let location = self.currentLocation else { return }
                self.fetchPrayerTimes(location: location, force: true)
            }
            .store(in: &cancellables)

        locationManager.$errorMessage
            .compactMap { $0 }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] message in
                self?.prayerErrorMessage = message
            }
            .store(in: &cancellables)

        locationManager.requestLocation()
    }

    private func fetchPrayerTimes(location: CLLocation, force: Bool = false) {
        if shouldSkipFetch(for: location, force: force) {
            return
        }

        isLoadingPrayers = true
        prayerErrorMessage = nil

        let today = calendar.startOfDay(for: Date())
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: today) ?? today.addingTimeInterval(86_400)
        let method = prayerCalculationMethod(for: locationManager.countryCode)

        var todayTimings: PrayerDayTimings?
        var tomorrowTimings: PrayerDayTimings?
        var requestError: Error?

        let group = DispatchGroup()

        group.enter()
        prayerService.fetchPrayerTimes(
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude,
            method: method,
            date: today
        ) { result in
            switch result {
            case .success(let timings):
                todayTimings = timings
            case .failure(let error):
                requestError = requestError ?? error
            }
            group.leave()
        }

        group.enter()
        prayerService.fetchPrayerTimes(
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude,
            method: method,
            date: tomorrow
        ) { result in
            switch result {
            case .success(let timings):
                tomorrowTimings = timings
            case .failure(let error):
                requestError = requestError ?? error
            }
            group.leave()
        }

        group.notify(queue: .main) { [weak self] in
            guard let self else { return }
            self.isLoadingPrayers = false
            self.lastPrayerFetchDate = Date()
            self.lastPrayerFetchLocation = location

            if let todayTimings {
                self.updatePrayers(with: todayTimings, for: today)
            } else if let latestCachedTimings = self.prayerService.getLatestCachedTimings(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude,
                method: method
            ) {
                self.updatePrayers(with: latestCachedTimings, for: today)
            } else {
                self.loadDefaultPrayers()
            }

            if let tomorrowTimings {
                self.tomorrowMaghrib = Self.parseAPITime(tomorrowTimings.Maghrib, on: tomorrow)
            } else {
                self.tomorrowMaghrib = self.estimateTomorrowMaghrib()
            }

            self.updateFtourTime()

            if todayTimings == nil, let requestError {
                self.prayerErrorMessage = requestError.localizedDescription
            }
        }
    }

    private func shouldSkipFetch(for location: CLLocation, force: Bool) -> Bool {
        guard !force else { return false }

        if let lastPrayerFetchDate,
           calendar.isDate(lastPrayerFetchDate, inSameDayAs: Date()),
           let lastPrayerFetchLocation,
           lastPrayerFetchLocation.distance(from: location) < 1_000 {
            return true
        }

        return false
    }

    private func loadDefaultPrayers() {
        prayers = PrayerTime.getTodayPrayers()
        todayMaghrib = prayers.first(where: { $0.name == "Maghrib" })?.time
        tomorrowMaghrib = estimateTomorrowMaghrib()
        updateFtourTime()
    }

    private func updatePrayers(with timings: PrayerDayTimings, for day: Date) {
        let prayerData: [(name: String, arabicName: String, rawTime: String)] = [
            ("Fajr", "الفجر", timings.Fajr),
            ("Dhuhr", "الظهر", timings.Dhuhr),
            ("Asr", "العصر", timings.Asr),
            ("Maghrib", "المغرب", timings.Maghrib),
            ("Isha", "العشاء", timings.Isha)
        ]

        let parsedPrayers = prayerData.compactMap { prayer -> PrayerTime? in
            guard let parsedDate = Self.parseAPITime(prayer.rawTime, on: day) else { return nil }
            return PrayerTime(name: prayer.name, arabicName: prayer.arabicName, time: parsedDate, isNext: false)
        }

        guard !parsedPrayers.isEmpty else {
            loadDefaultPrayers()
            return
        }

        let nextIndex = parsedPrayers.firstIndex(where: { $0.time > Date() })
        prayers = parsedPrayers.enumerated().map { index, prayer in
            PrayerTime(
                name: prayer.name,
                arabicName: prayer.arabicName,
                time: prayer.time,
                isNext: index == nextIndex
            )
        }

        todayMaghrib = prayers.first(where: { $0.name == "Maghrib" })?.time
    }

    private func updateFtourTime() {
        let now = Date()

        if let todayMaghrib, todayMaghrib > now {
            nextFtourTime = todayMaghrib
        } else if let tomorrowMaghrib, tomorrowMaghrib > now {
            nextFtourTime = tomorrowMaghrib
        } else {
            nextFtourTime = estimateTomorrowMaghrib()
        }

        updateTimeUntilFtour()
    }

    private func estimateTomorrowMaghrib() -> Date? {
        guard let todayMaghrib else { return nil }
        return calendar.date(byAdding: .day, value: 1, to: todayMaghrib)
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            Task { @MainActor in
                self?.tick()
            }
        }
    }

    private func tick() {
        updateTimeUntilFtour()
        refreshNextPrayerIfNeeded()
        refreshForDayChangeIfNeeded()
    }

    private func refreshNextPrayerIfNeeded() {
        guard !prayers.isEmpty else { return }

        let nextIndex = prayers.firstIndex(where: { $0.time > Date() })
        var didChange = false

        let updatedPrayers = prayers.enumerated().map { index, prayer in
            let shouldBeNext = (index == nextIndex)
            if shouldBeNext != prayer.isNext {
                didChange = true
            }
            return PrayerTime(
                name: prayer.name,
                arabicName: prayer.arabicName,
                time: prayer.time,
                isNext: shouldBeNext
            )
        }

        if didChange {
            prayers = updatedPrayers
        }
    }

    private func refreshForDayChangeIfNeeded() {
        let today = calendar.startOfDay(for: Date())
        guard today != lastObservedDay else { return }

        lastObservedDay = today
        ramadanInfo = RamadanInfo.current()

        if let currentLocation {
            fetchPrayerTimes(location: currentLocation, force: true)
        } else {
            loadDefaultPrayers()
        }
    }

    private func updateTimeUntilFtour() {
        guard let ftourTime = nextFtourTime else {
            timeUntilFtour = "--:--:--"
            return
        }

        let remainingSeconds = Int(ftourTime.timeIntervalSinceNow)
        guard remainingSeconds > 0 else {
            timeUntilFtour = "00:00:00"
            return
        }

        let hours = remainingSeconds / 3_600
        let minutes = (remainingSeconds % 3_600) / 60
        let seconds = remainingSeconds % 60
        timeUntilFtour = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    private func prayerCalculationMethod(for countryCode: String) -> Int {
        switch countryCode.uppercased() {
        case "US", "CA":
            return 2
        case "FR", "BE", "MC", "LU":
            return 12
        case "SA":
            return 4
        default:
            return 3
        }
    }

    private static func parseAPITime(_ rawValue: String, on date: Date) -> Date? {
        let rawTime = rawValue.trimmingCharacters(in: .whitespacesAndNewlines)
        let timeToken = rawTime.split(separator: " ").first.map(String.init) ?? rawTime
        let parts = timeToken.split(separator: ":")

        guard parts.count >= 2 else { return nil }

        let hourDigits = parts[0].filter(\.isNumber)
        let minuteDigits = parts[1].filter(\.isNumber)

        guard var hour = Int(hourDigits),
              let minute = Int(minuteDigits),
              (0...24).contains(hour),
              (0...59).contains(minute) else {
            return nil
        }

        var dayOffset = 0
        if hour == 24 {
            hour = 0
            dayOffset = 1
        }

        var components = Calendar.current.dateComponents([.year, .month, .day], from: date)
        components.hour = hour
        components.minute = minute
        components.second = 0
        guard let parsedDate = Calendar.current.date(from: components) else { return nil }
        return Calendar.current.date(byAdding: .day, value: dayOffset, to: parsedDate)
    }

    var isRamadan: Bool {
        ramadanInfo.isRamadan
    }

    var ramadanProgress: Double {
        guard isRamadan,
              let currentDay = ramadanInfo.currentDayOfRamadan,
              ramadanInfo.totalDays > 0 else {
            return 0
        }
        return min(Double(currentDay) / Double(ramadanInfo.totalDays), 1)
    }

    var ramadanDayText: String {
        guard isRamadan, let currentDay = ramadanInfo.currentDayOfRamadan else {
            return ""
        }
        return "Jour \(currentDay)/\(ramadanInfo.totalDays)"
    }
}
