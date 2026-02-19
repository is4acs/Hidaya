import Foundation

struct PrayerTime {
    let name: String
    let arabicName: String
    let time: Date
    let isNext: Bool
    
    static func getTodayPrayers() -> [PrayerTime] {
        let calendar = Calendar.current
        let now = Date()
        
        let fixedTimes: [(String, String, Int, Int)] = [
            ("Fajr", "الفجر", 6, 0),
            ("Dhuhr", "الظهر", 13, 0),
            ("Asr", "العصر", 16, 30),
            ("Maghrib", "المغرب", 19, 0),
            ("Isha", "العشاء", 21, 0)
        ]
        
        var prayers: [PrayerTime] = []
        var nextPrayerFound = false
        
        for (name, arabic, hour, minute) in fixedTimes {
            var components = calendar.dateComponents([.year, .month, .day], from: now)
            components.hour = hour
            components.minute = minute
            
            if let prayerTime = calendar.date(from: components) {
                let isNext = !nextPrayerFound && prayerTime > now
                if isNext { nextPrayerFound = true }
                
                prayers.append(PrayerTime(name: name, arabicName: arabic, time: prayerTime, isNext: isNext))
            }
        }
        
        return prayers
    }
    
    static func getNextPrayer() -> PrayerTime? {
        getTodayPrayers().first { $0.isNext }
    }
    
    static func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

struct PrayerTimeHelper {
    static func getGreeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        if hour < 12 {
            return "Sabah al-khayr ☀️"
        } else if hour < 18 {
            return "Bonjour"
        } else {
            return "Masa al-khayr 🌙"
        }
    }
    
    static func getTimeIcon() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        if hour < 6 {
            return "moon.stars.fill"
        } else if hour < 12 {
            return "sunrise.fill"
        } else if hour < 18 {
            return "sun.max.fill"
        } else {
            return "sunset.fill"
        }
    }
}
