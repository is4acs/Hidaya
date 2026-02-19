import Foundation

struct SurahDetail: Identifiable, Codable {
    let id: Int
    let name: String
    let arabicName: String
    let versesCount: Int
    let revelation: String
    let summary: String
    let context: String
    let message: String
    let themes: [String]
    let keyVerses: [KeyVerse]
    let application: String
    
    static let allSurahs: [SurahDetail] = [
        SurahDetail(
            id: 1,
            name: "Al-Fatiha",
            arabicName: "الفاتحة",
            versesCount: 7,
            revelation: "Mecquoise",
            summary: "La sourate d'ouverture, récitée dans chaque prière. Elle est considérée comme la 'Mère du Coran' et résume tout le message islamique.",
            context: "Al-Fatiha fut révélée à La Mecque au début de la prophétie. C'est l'une des premières sourates révélées et elle établit le fondement de la relation entre le croyant et Allah.",
            message: "Cette sourate nous enseigne que toute prière doit commencer par la louange d'Allah. Elle nous rappelle Sa miséricorde infinie, Sa maîtrise du Jour du Jugement, et notre dépendance totale envers Lui. C'est une conversation directe avec Allah.",
            themes: ["Tawhid (Unicité d'Allah)", "Miséricorde divine", "Guide vers le droit chemin", "Supplication"],
            keyVerses: [
                KeyVerse(
                    verse: "إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ",
                    transliteration: "Iyyāka na'budu wa iyyāka nasta'īn",
                    translation: "C'est Toi que nous adorons, et c'est Toi dont nous demandons l'aide",
                    explanation: "Ce verset définit notre relation avec Allah: adoration exclusive et demande d'aide exclusive. Dans un monde où nous sommes tentés de dépendre de tant de choses, ce verset recentre notre dépendance sur Allah seul."
                ),
                KeyVerse(
                    verse: "اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ",
                    transliteration: "Ihdinā ṣ-ṣirāṭa l-mustaqīm",
                    translation: "Guide-nous dans le droit chemin",
                    explanation: "Nous demandons cette guidance 17 fois par jour minimum. C'est la reconnaissance que sans l'aide d'Allah, nous nous égarons."
                )
            ],
            application: "Récite Al-Fatiha avec présence du cœur, pas machinalement. Comprends que c'est un dialogue avec Allah. Il répond à chaque verset. Après 'Iyyāka na'budu', Allah dit: 'C'est entre Moi et Mon serviteur.' Utilise cette sourate pour te reconnecter à Allah quand tu te sens perdu."
        ),
        SurahDetail(
            id: 112,
            name: "Al-Ikhlas",
            arabicName: "الإخلاص",
            versesCount: 4,
            revelation: "Mecquoise",
            summary: "La sourate de la sincérité pure. Elle définit l'unicité d'Allah de manière parfaite. Équivaut à un tiers du Coran.",
            context: "Révélée en réponse aux polythéistes qui demandaient au Prophète ﷺ de décrire l'ascendance d'Allah. Cette sourate coupe court à toute tentative de comparer Allah à Sa création.",
            message: "Allah est UN, dans Son essence, Ses attributs et Ses actions. Il n'a besoin de rien ni personne. Il n'a pas engendré et n'a pas été engendré. Rien ne Lui ressemble. Ces 4 versets détruisent toutes les formes de polythéisme.",
            themes: ["Tawhid", "Transcendance d'Allah", "Rejet de l'anthropomorphisme"],
            keyVerses: [
                KeyVerse(
                    verse: "قُلْ هُوَ اللَّهُ أَحَدٌ",
                    transliteration: "Qul huwa Allāhu aḥad",
                    translation: "Dis: Il est Allah, l'Unique",
                    explanation: "Le mot 'Ahad' est unique dans le Coran - il n'apparaît qu'ici. Il signifie une unicité absolue, sans aucune forme de division ou de pluralité possible."
                ),
                KeyVerse(
                    verse: "لَمْ يَلِدْ وَلَمْ يُولَدْ",
                    transliteration: "Lam yalid wa lam yūlad",
                    translation: "Il n'a pas engendré et n'a pas été engendré",
                    explanation: "Contre les croyances de ceux qui attribuent des enfants à Allah. Il est éternel, sans commencement ni fin."
                )
            ],
            application: "Récite cette sourate dans tes prières surérogatoires, le matin et le soir. Le Prophète ﷺ a dit qu'elle équivaut à un tiers du Coran. Utilise-la pour renforcer ta compréhension du Tawhid. Quand tu doutes ou es confus, ces 4 versets sont un rappel puissant de qui est Allah."
        ),
        SurahDetail(
            id: 113,
            name: "Al-Falaq",
            arabicName: "الفلق",
            versesCount: 5,
            revelation: "Mecquoise",
            summary: "La protection contre les maux de la création. Première des deux sourates de protection (Al-Mu'awwidhatayn).",
            context: "Ces sourates furent révélées après qu'un sorcier eut jeté un sort au Prophète ﷺ. Elles sont une protection contre tout mal, visible et invisible.",
            message: "On cherche refuge auprès d'Allah contre tous les maux: l'obscurité, ceux qui pratiquent le mal, et l'envie. Cette sourate nous enseigne que la protection ultime vient d'Allah seul.",
            themes: ["Protection divine", "Foi en la prédestination", "Rejet de la superstition"],
            keyVerses: [
                KeyVerse(
                    verse: "قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ",
                    transliteration: "Qul a'ūdhu bi-rabbi l-falaq",
                    translation: "Dis: Je cherche refuge auprès du Seigneur de l'aube",
                    explanation: "Le 'Falaq' représente la lumière qui perce les ténèbres. Quand tout semble sombre, la délivrance d'Allah arrive comme l'aube."
                ),
                KeyVerse(
                    verse: "وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ",
                    transliteration: "Wa min sharri ḥāsidin idhā ḥasada",
                    translation: "Et contre le mal de l'envieux quand il envie",
                    explanation: "L'envie est dangereuse car elle peut mener à des actions nuisibles. La protection n'est pas contre l'envie elle-même, mais contre son mal quand elle se manifeste."
                )
            ],
            application: "Récite Al-Falaq et An-Nas 3 fois le matin et le soir. Souffle dans tes mains et passe-les sur ton corps. Récite sur les malades et ceux qui ont peur. C'est ta protection spirituelle quotidienne."
        ),
        SurahDetail(
            id: 114,
            name: "An-Nas",
            arabicName: "الناس",
            versesCount: 6,
            revelation: "Mecquoise",
            summary: "La protection contre les murmures du cœur. Deuxième sourate de protection, elle complète Al-Falaq.",
            context: "Tandis qu'Al-Falaq protège des maux extérieurs, An-Nas protège des maux intérieurs: les pensées négatives, les doutes, les murmures de Shaytan dans notre cœur.",
            message: "Nous cherchons refuge auprès du Seigneur des hommes, du Roi des hommes, du Dieu des hommes, contre le mal du murmure qui se cache, qui souffle dans les poitrines des hommes, qu'il soit djinn ou humain.",
            themes: ["Protection spirituelle", "Combat intérieur", "Foi contre le doute"],
            keyVerses: [
                KeyVerse(
                    verse: "مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ",
                    transliteration: "Min sharri l-waswāsi l-khannās",
                    translation: "Contre le mal du murmure qui se cache",
                    explanation: "'Waswas' désigne les pensées intrusives négatives. 'Khannas' signifie qu'il se retire quand on mentionne Allah. La solution: invoque Allah et ces pensées partiront."
                ),
                KeyVerse(
                    verse: "الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ",
                    transliteration: "Alladhī yuwaswisu fī ṣudūri n-nās",
                    translation: "Qui souffle dans les poitrines des hommes",
                    explanation: "Le combat le plus difficile est intérieur. Shaytan n'a pas de pouvoir sur nous, mais il suggère. À nous de rejeter ces suggestions."
                )
            ],
            application: "Quand tu ressens de l'anxiété, des doutes, des pensées négatives - c'est le moment de réciter An-Nas. Répète-la plusieurs fois. Comprends que ces pensées ne viennent pas de toi, et qu'Allah est ta protection."
        ),
        SurahDetail(
            id: 103,
            name: "Al-Asr",
            arabicName: "العصر",
            versesCount: 3,
            revelation: "Mecquoise",
            summary: "Une sourate courte mais puissante sur le temps et la perte. Les compagnons ne se séparaient pas sans la réciter.",
            context: "Révélée à La Mecque, cette sourate établit les 4 conditions du succès dans cette vie et l'au-delà. Malgré sa brièveté, elle contient des enseignements profonds.",
            message: "Toute l'humanité est en perte, EXCEPTE ceux qui croient, font de bonnes œuvres, s'enjoignent mutuellement la vérité et s'enjoignent la patience. Ces 4 conditions sont inséparables.",
            themes: ["Value du temps", "Conditions du succès", "Communauté", "Patience"],
            keyVerses: [
                KeyVerse(
                    verse: "وَالْعَصْرِ ۝ إِنَّ الْإِنسَانَ لَفِي خُسْرٍ",
                    transliteration: "Wal-'aṣr. Innal-insāna lafī khusr",
                    translation: "Par le temps! L'homme est certes en perte",
                    explanation: "Allah jure par le temps - notre ressource la plus précieuse et la plus négligée. Sans les bonnes actions, chaque seconde passée est une perte."
                ),
                KeyVerse(
                    verse: "إِلَّا الَّذِينَ آمَنُوا وَعَمِلُوا الصَّالِحَاتِ وَتَوَاصَوْا بِالْحَقِّ وَتَوَاصَوْا بِالصَّبْرِ",
                    transliteration: "Illā lladhīna āmanū wa 'amilu ṣ-ṣāliḥāti wa tawāṣaw bi-l-ḥaqqi wa tawāṣaw bi-ṣ-ṣabr",
                    translation: "Sauf ceux qui croient, font de bonnes œuvres, s'enjoignent la vérité et s'enjoignent la patience",
                    explanation: "Les 4 piliers du succès: la foi (pas juste la croyance), les œuvres (la foi sans œuvres est incomplète), la communauté (s'entraider dans la vérité), et la patience (endurance dans les deux cas)."
                )
            ],
            application: "Récite cette sourate chaque fois que tu te sens distrait ou improductif. Évalue-toi: Est-ce que je remplis les 4 conditions? La foi seule suffit-elle sans les œuvres? Partages-tu la vérité avec les autres? Es-tu patient dans les épreuves? Le temps passe - ne le perds pas."
        ),
        SurahDetail(
            id: 108,
            name: "Al-Kawthar",
            arabicName: "الكوثر",
            versesCount: 3,
            revelation: "Mecquoise",
            summary: "La sourate de l'abondance. Réconfort au Prophète ﷺ quand ses ennemis se moquaient de son manque de descendants mâles.",
            context: "Après la mort de son fils Ibrahim, les polythéistes insultaient le Prophète ﷺ en disant qu'il serait oublié car il n'avait pas de fils. Allah répondit avec cette sourate.",
            message: "Allah a accordé au Prophète ﷺ 'Al-Kawthar' - l'abondance infinie. Ses ennemis seront les oubliés, pas lui. Il doit prier et sacrifier pour Allah seul.",
            themes: ["Gratitude", "Promesse divine", "Victoire sur les ennemis"],
            keyVerses: [
                KeyVerse(
                    verse: "إِنَّا أَعْطَيْنَاكَ الْكَوْثَرَ",
                    transliteration: "Innā a'ṭaynāka l-kawthar",
                    translation: "Nous t'avons accordé l'abondance",
                    explanation: "Al-Kawthar est un fleuve au Paradis. Mais c'est aussi l'abondance de tous les bienfaits accordés au Prophète ﷺ: le Coran, l'Islam, des millions de disciples jusqu'à la fin des temps."
                ),
                KeyVerse(
                    verse: "إِنَّ شَانِئَكَ هُوَ الْأَبْتَرُ",
                    transliteration: "Inna shāni'aka huwa l-abtar",
                    translation: "C'est ton ennemi qui sera retranché",
                    explanation: "Ceux qui insultaient le Prophète ﷺ sont aujourd'hui oubliés. Lui, son nom est prononcé des milliards de fois chaque jour. La victoire appartient aux patients."
                )
            ],
            application: "Quand tu te sens rejeté ou méprisé, rappelle-toi cette sourate. Ceux qui t'insultent aujourd'hui peuvent être les oubliés de demain. La vraie réussite n'est pas dans l'approbation des gens mais dans celle d'Allah. Prie et sacrifie pour Lui seul."
        ),
        SurahDetail(
            id: 110,
            name: "An-Nasr",
            arabicName: "النصر",
            versesCount: 3,
            revelation: "Médinoise",
            summary: "La dernière sourate révélée. Elle annonce la victoire et fut comprise par Ibn Abbas comme le signe de la mort prochaine du Prophète ﷺ.",
            context: "Révélée à Médine lors du pèlerinage d'adieu. Cette sourate annonçait la conquête de La Mecque et l'accomplissement de la mission du Prophète ﷺ.",
            message: "Quand viendra le secours d'Allah et la victoire, et que tu verras les gens entrer en masse dans la religion d'Allah, célèbre Sa louange et demande Son pardon, car Il est le Grand Accueillant du repentir.",
            themes: ["Victoire", "Gratitude", "Humilité", "Repentir"],
            keyVerses: [
                KeyVerse(
                    verse: "فَسَبِّحْ بِحَمْدِ رَبِّكَ وَاسْتَغْفِرْهُ",
                    transliteration: "Fa-sabbiḥ bi-ḥamdi rabbika wa-staghfirhu",
                    translation: "Alors célèbre la louange de ton Seigneur et implore Son pardon",
                    explanation: "Au moment du triomphe, au lieu de célébrer soi-même, on célèbre Allah. Au sommet du succès, on demande pardon - signe d'humilité. La réussite ne doit jamais mener à l'orgueil."
                )
            ],
            application: "Quand tu réussis quelque chose, ne t'attribue pas le mérite. Remercie Allah. La gratitude protège de l'orgueil. Demande pardon même quand tout va bien. Le succès est un test comme l'échec."
        ),
        SurahDetail(
            id: 97,
            name: "Al-Qadr",
            arabicName: "القدر",
            versesCount: 5,
            revelation: "Mecquoise",
            summary: "La nuit du destin, meilleure que mille mois. La nuit la plus bénie de l'année.",
            context: "Révélée à La Mecque, elle décrit la grandeur de Laylat al-Qadr, la nuit où le Coran fut révélé, qui survient dans les 10 dernières nuits de Ramadan.",
            message: "Cette nuit vaut mieux que mille mois (83 ans). Les anges descendent avec toutes les décisions d'Allah. Elle dure jusqu'à l'aube. C'est une opportunité incomparable de cultiver le pardon.",
            themes: ["Laylat al-Qadr", "Valeur du culte nocturne", "Coran"],
            keyVerses: [
                KeyVerse(
                    verse: "لَيْلَةُ الْقَدْرِ خَيْرٌ مِّنْ أَلْفِ شَهْرٍ",
                    transliteration: "Laylatu l-qadri khayrun min alfi shahr",
                    translation: "La nuit du Destin vaut mieux que mille mois",
                    explanation: "Une seule nuit = 83 ans d'adoration. C'est une miséricorde incroyable. Le Prophète ﷺ a dit: 'Celui qui prie cette nuit avec foi et espoir de récompense verra ses péchés passés pardonnés.'"
                ),
                KeyVerse(
                    verse: "سَلَامٌ هِيَ حَتَّىٰ مَطْلَعِ الْفَجْرِ",
                    transliteration: "Salāmun hiya ḥattā maṭla'i l-fajr",
                    translation: "Elle est paix jusqu'à l'apparition de l'aube",
                    explanation: "Cette nuit est entièrement bénédiction et paix. Pas de mal, pas de punition ce soir-là. Les anges saluent chaque croyant en adoration."
                )
            ],
            application: "Cherche Laylat al-Qadr dans les nuits impaires des 10 derniers jours de Ramadan (21, 23, 25, 27, 29). Ne dors pas ces nuits. Prie, lis le Coran, fais des dou'as. La meilleure invocation: 'Allāhumma innaka 'afuwwun tuḥibbu l-'afwa fa'fu 'annī' - Ô Allah, Tu es le Pardonneur et Tu aimes le pardon, alors pardonne-moi."
        ),
        SurahDetail(
            id: 36,
            name: "Ya Sin",
            arabicName: "يس",
            versesCount: 83,
            revelation: "Mecquoise",
            summary: "Le 'cœur du Coran'. Une sourate sur la résurrection et le message des prophètes. Récitée pour les malades et les défunts.",
            context: "Révélée à La Mecque au milieu de la période mecquoise, elle utilise l'histoire des prophètes pour rappeler le message central: la résurrection et le jugement.",
            message: "Le Coran est une révélation d'Allah à un prophète envoyé. L'histoire des prophètes passés montre que ceux qui rejettent le message périssent. Allah ressuscitera les morts. La création et la résurrection sont faciles pour Lui.",
            themes: ["Résurrection", "Prophétie", "Création", "Monotheisme"],
            keyVerses: [
                KeyVerse(
                    verse: "يس ۝ وَالْقُرْآنِ الْحَكِيمِ",
                    transliteration: "Yā Sīn. Wal-Qur'āni l-ḥakīm",
                    translation: "Ya Sin. Par le Coran plein de sagesse",
                    explanation: "Ya Sin est l'un des secrets du Coran. Certains disent que c'est un nom honorifique du Prophète ﷺ. 'Ya Sin' = 'Ô homme' en langue syriaque selon certains."
                ),
                KeyVerse(
                    verse: "أَلَيْسَ ذَلِكَ بِقَادِرٍ عَلَىٰ أَن يُحْيِيَ الْمَوْتَىٰ",
                    transliteration: "A-laysa dhālika bi-qādirin 'alā an yuḥyiya l-mawtā",
                    translation: "N'est-Il pas capable de ressusciter les morts?",
                    explanation: "La sourate commence par confirmer la prophétie et finit par la résurrection. Si Allah a créé l'univers, comment ne pourrait-Il pas ressusciter les morts?"
                )
            ],
            application: "Récite Ya Sin chaque matin ou chaque vendredi. Récite-la auprès des malades et des mourants. Le Prophète ﷺ a dit: 'Ya Sin est le cœur du Coran. Que la personne qui désire le bien de ce monde et de l'au-delà la récite.'"
        ),
        SurahDetail(
            id: 67,
            name: "Al-Mulk",
            arabicName: "الملك",
            versesCount: 30,
            revelation: "Mecquoise",
            summary: "La royauté d'Allah. Protège du châtiment de la tombe. Le Prophète ﷺ ne dormait pas sans la réciter.",
            context: "Révélée à La Mecque, cette sourate établit la souveraineté absolue d'Allah sur l'univers et Sa capacité à créer et tester.",
            message: "Béni soit Celui qui détient la royauté et est Omnipotent. Il a créé la mort et la vie pour vous tester. Allah possède la domination absolue. Ceux qui ne croient pas en Lui subiront un châtiment sévère.",
            themes: ["Souveraineté d'Allah", "Création", "Épreuve", "Tombe"],
            keyVerses: [
                KeyVerse(
                    verse: "تَبَارَكَ الَّذِي بِيَدِهِ الْمُلْكُ وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ",
                    transliteration: "Tabāraka lladhī bi-yadihi l-mulk wa huwa 'alā kulli shay'in qadīr",
                    translation: "Béni soit Celui dans la main de Qui est la royauté, et Il est Omnipotent",
                    explanation: "La 'bénédiction' (tabarak) indique l'abondance et la continuité. Tout pouvoir appartient à Allah. Les rois de ce monde sont Ses serviteurs."
                ),
                KeyVerse(
                    verse: "الَّذِي خَلَقَ الْمَوْتَ وَالْحَيَاةَ لِيَبْلُوَكُمْ أَيُّكُمْ أَحْسَنُ عَمَلًا",
                    transliteration: "Alladhī khalaqa l-mawta wa-l-ḥayāta li-yablūkum ayyukum aḥsanu 'amalā",
                    translation: "Qui a créé la mort et la vie pour vous éprouver et savoir qui de vous a la meilleure conduite",
                    explanation: "La mort n'est pas la fin mais une création d'Allah. Cette vie est un test. Pas 'qui fait le plus' mais 'qui fait le mieux' avec sincérité."
                )
            ],
            application: "Récite Al-Mulk chaque nuit avant de dormir. Le Prophète ﷺ a dit: 'Il y a une sourate dans le Coran qui a 30 versets et qui intercédera pour son réciteur jusqu'à ce qu'il soit pardonné: Tabarak alladhi bi-yadihi l-mulk.' C'est une protection dans la tombe."
        ),
        SurahDetail(
            id: 2,
            name: "Al-Baqara",
            arabicName: "البقرة",
            versesCount: 286,
            revelation: "Médinoise",
            summary: "La plus longue sourate du Coran. Guide complet pour la communauté musulmane avec des lois, des histoires et des principes fondamentaux.",
            context: "Révélée à Médine sur plusieurs années, elle traite des défis de la nouvelle communauté musulmane: les hypocrites, les juifs, les lois sociales, le Hajj, le jeûne, et le Jihad.",
            message: "Cette sourate établit les fondements de la foi, les obligations légales, et les leçons de l'histoire. Les croyants sont appelés à suivre la guidance complète d'Allah. Elle contient le plus grand verset du Coran (Ayat al-Kursi).",
            themes: ["Lois islamiques", "Hypocrisie", "Histoires des prophètes", "Ramadan", "Jihad", "Piété"],
            keyVerses: [
                KeyVerse(
                    verse: "اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ",
                    transliteration: "Allāhu lā ilāha illā huwa l-ḥayyu l-qayyūm",
                    translation: "Allah! Point de divinité que Lui, le Vivant, Celui qui subsiste par Lui-même",
                    explanation: "Début d'Ayat al-Kursi (2:255), le plus grand verset du Coran. Il décrit la transcendance et la connaissance infinies d'Allah. Le Trône d'Allah comprend les cieux et la terre."
                ),
                KeyVerse(
                    verse: "وَاتَّقُوا اللَّهَ وَيُعَلِّمُكُمُ اللَّهُ",
                    transliteration: "Wa-ttaqū Allāh wa yu'allimukumu Allāh",
                    translation: "Craignez Allah et Allah vous enseignera",
                    explanation: "La piété est la clé de la connaissance. Celui qui applique ce qu'il sait recevra plus de connaissance d'Allah."
                )
            ],
            application: "Récite les 2 derniers versets d'Al-Baqara chaque nuit - ils suffisent comme protection. Le Prophète ﷺ a dit: 'Celui qui récite les deux derniers versets de la sourate Al-Baqara la nuit, ils lui suffiront.' Apprends Ayat al-Kursi et récite-le après chaque prière."
        )
    ]
}

struct KeyVerse: Codable {
    let verse: String
    let transliteration: String
    let translation: String
    let explanation: String
}
