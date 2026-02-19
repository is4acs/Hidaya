import Foundation

struct WuduStep: Identifiable, Codable {
    let id: Int
    let title: String
    let description: String
    let arabicDua: String
    let transliteration: String
    let translation: String
    let repetitions: Int
    let sfSymbol: String
    
    static let allSteps: [WuduStep] = [
        WuduStep(
            id: 1,
            title: "Niyya - L'Intention",
            description: "Formuler l'intention dans son cœur de faire les ablutions pour Allah.",
            arabicDua: "نَوَيْتُ الوُضُوءَ لِلَّهِ تَعَالَى",
            transliteration: "Nawaytu al-wuḍū'a lillāhi ta'ālā",
            translation: "J'ai l'intention de faire les ablutions pour Allah le Très-Haut",
            repetitions: 1,
            sfSymbol: "brain"
        ),
        WuduStep(
            id: 2,
            title: "Bismillah",
            description: "Dire au nom d'Allah avant de commencer.",
            arabicDua: "بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ",
            transliteration: "Bismillāhi r-raḥmāni r-raḥīm",
            translation: "Au nom d'Allah, le Tout Miséricordieux, le Très Miséricordieux",
            repetitions: 1,
            sfSymbol: "text.bubble"
        ),
        WuduStep(
            id: 3,
            title: "Laver les mains",
            description: "Laver les deux mains jusqu'aux poignets trois fois.",
            arabicDua: "بِسْمِ اللَّهِ",
            transliteration: "Bismillāh",
            translation: "Au nom d'Allah",
            repetitions: 3,
            sfSymbol: "hand.raised.fill"
        ),
        WuduStep(
            id: 4,
            title: "Rincer la bouche",
            description: "Rincer la bouche trois fois avec de l'eau.",
            arabicDua: "",
            transliteration: "",
            translation: "",
            repetitions: 3,
            sfSymbol: "drop.fill"
        ),
        WuduStep(
            id: 5,
            title: "Rincer le nez",
            description: "Rincer le nez trois fois en aspirant et rejetant l'eau.",
            arabicDua: "",
            transliteration: "",
            translation: "",
            repetitions: 3,
            sfSymbol: "wind"
        ),
        WuduStep(
            id: 6,
            title: "Laver le visage",
            description: "Laver le visage entièrement du front au menton et d'une oreille à l'autre.",
            arabicDua: "",
            transliteration: "",
            translation: "",
            repetitions: 3,
            sfSymbol: "person.crop.circle"
        ),
        WuduStep(
            id: 7,
            title: "Laver les bras",
            description: "Laver le bras droit puis le gauche jusqu'aux coudes inclus.",
            arabicDua: "",
            transliteration: "",
            translation: "",
            repetitions: 3,
            sfSymbol: "hand.draw.fill"
        ),
        WuduStep(
            id: 8,
            title: "Masah - Passer les mains sur la tête",
            description: "Passer les mains mouillées sur toute la tête une fois.",
            arabicDua: "",
            transliteration: "",
            translation: "",
            repetitions: 1,
            sfSymbol: "hand.point.right.fill"
        ),
        WuduStep(
            id: 9,
            title: "Nettoyer les oreilles",
            description: "Nettoyer l'intérieur des oreilles avec les index et le dos avec les pouces.",
            arabicDua: "",
            transliteration: "",
            translation: "",
            repetitions: 1,
            sfSymbol: "ear"
        ),
        WuduStep(
            id: 10,
            title: "Laver les pieds",
            description: "Laver le pied droit puis le gauche jusqu'aux chevilles inclus, frotter entre les orteils.",
            arabicDua: "",
            transliteration: "",
            translation: "",
            repetitions: 3,
            sfSymbol: "figure.walk"
        ),
        WuduStep(
            id: 11,
            title: "Dou'a de fin",
            description: "Invoquer Allah après avoir terminé les ablutions.",
            arabicDua: "أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ",
            transliteration: "Ash-hadu an lā ilāha illallāhu waḥdahū lā sharīka lah, wa ash-hadu anna Muḥammadan 'abduhū wa rasūluh",
            translation: "J'atteste qu'il n'y a de divinité qu'Allah, Unique sans associé, et j'atteste que Muhammad est Son serviteur et Messager",
            repetitions: 1,
            sfSymbol: "sparkles"
        )
    ]
}
