import Foundation

struct Dua: Identifiable, Codable {
    let id: Int
    let title: String
    let arabic: String
    let transliteration: String
    let translation: String
    let category: DuaCategory
    
    static let morningDuas: [Dua] = [
        Dua(
            id: 1,
            title: "Dou'a du réveil",
            arabic: "الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ",
            transliteration: "Al-ḥamdu lillāhi alladhī aḥyānā ba'da mā amātanā wa ilayhi n-nushūr",
            translation: "Louange à Allah qui nous a fait revivre après nous avoir fait mourir (dormir), c'est vers Lui que se fera le retour",
            category: .morning
        ),
        Dua(
            id: 2,
            title: "Dou'a du matin",
            arabic: "أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ وَالْحَمْدُ لِلَّهِ",
            transliteration: "Aṣbaḥnā wa aṣbaḥa al-mulku lillāh, wa al-ḥamdu lillāh",
            translation: "Nous voici au matin et la souveraineté appartient à Allah, et louange à Allah",
            category: .morning
        )
    ]
    
    static let eveningDuas: [Dua] = [
        Dua(
            id: 3,
            title: "Dou'a du soir",
            arabic: "أَمْسَيْنَا وَأَمْسَى الْمُلْكُ لِلَّهِ وَالْحَمْدُ لِلَّهِ",
            transliteration: "Amsaynā wa amsā al-mulku lillāh, wa al-ḥamdu lillāh",
            translation: "Nous voici au soir et la souveraineté appartient à Allah, et louange à Allah",
            category: .evening
        )
    ]
    
    static let mealDuas: [Dua] = [
        Dua(
            id: 4,
            title: "Avant de manger",
            arabic: "بِسْمِ اللَّهِ وَعَلَى بَرَكَةِ اللَّهِ",
            transliteration: "Bismillāhi wa 'alā barakati l-Lāh",
            translation: "Au nom d'Allah et avec la bénédiction d'Allah",
            category: .meal
        ),
        Dua(
            id: 5,
            title: "Après avoir mangé",
            arabic: "الْحَمْدُ لِلَّهِ الَّذِي أَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مُسْلِمِينَ",
            transliteration: "Al-ḥamdu lillāhi alladhī aṭ'amanā wa saqānā wa ja'alanā muslimīn",
            translation: "Louange à Allah qui nous a nourris, abreuvés et fait de nous des musulmans",
            category: .meal
        )
    ]
    
    static let sleepDuas: [Dua] = [
        Dua(
            id: 6,
            title: "Avant de dormir",
            arabic: "بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا",
            transliteration: "Bismika Allāhumma amūtu wa aḥyā",
            translation: "En Ton nom ô Allah, je meurs et je vis",
            category: .sleep
        )
    ]
    
    static let travelDuas: [Dua] = [
        Dua(
            id: 7,
            title: "Dou'a du voyage",
            arabic: "سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ",
            transliteration: "Subḥāna alladhī sakhkhara lanā hādhā wa mā kunnā lahu muqrinīn",
            translation: "Gloire à Celui qui nous a soumis tout cela, nous n'aurions pas pu y parvenir seuls",
            category: .travel
        )
    ]
}

enum DuaCategory: String, CaseIterable, Codable {
    case morning = "Matin"
    case evening = "Soir"
    case meal = "Repas"
    case sleep = "Sommeil"
    case travel = "Voyage"
    case tasbih = "Tasbih"
}
