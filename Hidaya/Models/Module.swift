import Foundation

struct Module: Identifiable, Codable {
    let id: String
    let title: String
    let description: String
    let iconName: String
    let lessons: [Lesson]
    
    static let allModules: [Module] = [
        Module(
            id: "pillars",
            title: "Les 5 Piliers",
            description: "Les fondements de l'Islam",
            iconName: "building.columns",
            lessons: [
                Lesson(
                    id: "shahada",
                    title: "1. La Shahada - Le Témoignage",
                    content: """
**La Shahada** est la déclaration de foi, le premier et le plus important pilier de l'Islam.

📋 **Ce que c'est:**
La profession de foi qui affirme l'unicité d'Allah et la prophétie de Muhammad ﷺ.

**En arabe:** أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللَّهِ

**Translittération:** Ash-hadu an lā ilāha illallāh, wa ash-hadu anna Muḥammadan rasūlullāh

**Traduction:** "J'atteste qu'il n'y a de divinité qu'Allah, et j'atteste que Muhammad est le Messager d'Allah."

💡 **Pourquoi c'est important:**
- C'est la porte d'entrée dans l'Islam
- Elle résume toute la croyance musulmane
- Elle est récitée dans la prière quotidienne

🎯 **Application pratique:**
- Récite-la chaque matin au réveil
- Comprends sa signification profonde
- Vis selon ses principes quotidiennement
"""
                ),
                Lesson(
                    id: "salat",
                    title: "2. La Salat - La Prière",
                    content: """
**La Salat** est la prière rituelle, le deuxième pilier. C'est le lien direct entre le croyant et Allah.

📋 **Ce que c'est:**
Cinq prières quotidiennes effectuées à des moments précis, en direction de la Mecque.

**Les 5 prières:**
1. **Fajr** (الفجر) - Aube, avant le lever du soleil
2. **Dhuhr** (الظهر) - Midi, après le zénith
3. **Asr** (العصر) - Après-midi
4. **Maghrib** (المغرب) - Coucher du soleil
5. **Isha** (العشاء) - Nuit

💡 **Pourquoi c'est important:**
- Rappel constant d'Allah tout au long de la journée
- Discipline spirituelle et mentale
- Purification des péchés mineurs
- Moment de pause et de réflexion

🎯 **Pour débuter:**
- Apprends d'abord Al-Fatiha
- Commence par 2 unités de prière (raka'at)
- Utilise des applications pour les horaires
- Demande l'aide d'un enseignant
"""
                ),
                Lesson(
                    id: "zakat",
                    title: "3. La Zakat - L'Aumône",
                    content: """
**La Zakat** est l'aumône obligatoire, le troisième pilier. Elle purifie les richesses et aide les nécessiteux.

📋 **Ce que c'est:**
Un prélèvement de 2.5% sur l'épargne annuelle, distribué aux pauvres et nécessiteux.

**Qui doit la payer?**
- Tout musulman dont l'épargne dépasse un seuil (nisab)
- Possédant cette somme depuis un an lunaire

**Les bénéficiaires (Coran 9:60):**
- Les pauvres
- Les nécessiteux
- Ceux qui collectent la zakat
- Ceux dont on veut gagner les cœurs
- Pour l'affranchissement des captifs
- Les endettés
- Dans le chemin d'Allah
- Les voyageurs dans le besoin

💡 **Pourquoi c'est important:**
- Purifie l'âme de l'avarice
- Réduit les inégalités sociales
- Crée la solidarité dans la communauté

🎯 **Application pratique:**
- Calcule ta zakat annuellement
- Donne de manière discrète
- On peut donner à des organisations de confiance
"""
                ),
                Lesson(
                    id: "sawm",
                    title: "4. Le Sawm - Le Jeûne",
                    content: """
**Le Sawm** est le jeûne du Ramadan, le quatrième pilier. Un mois de discipline spirituelle.

📋 **Ce que c'est:**
S'abstenir de manger, boire et avoir des relations conjugales de l'aube au coucher du soleil pendant Ramadan.

**Les conditions du jeûne:**
- L'intention (niyya) la veille ou avant l'aube
- S'abstenir de tout ce qui rompt le jeûne
- Du Fajr au Maghrib

**Ce qui rompt le jeûne:**
- Manger ou boire intentionnellement
- Vomir volontairement
- Relations conjugales

**Ce qui est recommandé:**
- Le Sahur (repas avant l'aube)
- Rompre le jeûne rapidement au Maghrib
- Les bonnes actions et la charité

💡 **Pourquoi c'est important:**
- Développe la maîtrise de soi
- Augmente l'empathie pour les pauvres
- Purifie l'âme et le corps
- Mois du Coran

🎯 **Pour débuter:**
- Commence par jeûner quelques jours
- Prépare ton corps graduellement
- Beaucoup d'eau avant l'aube
- Surveille ta nutrition au Sahur
"""
                ),
                Lesson(
                    id: "hajj",
                    title: "5. Le Hajj - Le Pèlerinage",
                    content: """
**Le Hajj** est le pèlerinage à la Mecque, le cinquième pilier. Obligatoire une fois dans la vie pour ceux qui le peuvent.

📋 **Ce que c'est:**
Un voyage spirituel vers la Maison d'Allah (Kaaba) à la Mecque, pendant le mois de Dhul Hijjah.

**Les conditions:**
- Être musulman
- Avoir les moyens financiers
- Être en bonne santé
- La sécurité du voyage

**Les rites principaux:**
1. **Ihram** - État de sacralisation
2. **Tawaf** - Circumambulation autour de la Kaaba
3. **Sa'i** - Marche entre Safa et Marwa
4. **Wuquf** - Station à Arafat (le plus important)
5. **Ramy al-Jamarat** - Lapidation des stèles

💡 **Pourquoi c'est important:**
- Pèlerinage uni avec des millions de musulmans
- Égalité devant Allah (tous en ihram)
- Pardon de tous les péchés passés
- Symbole de l'unité islamique

🎯 **À savoir:**
- Ce n'est obligatoire qu'une fois
- Prépare-toi financièrement et spirituellement
- Apprends les rites avant de partir
- Le Umrah peut être fait anytime
"""
                )
            ]
        ),
        Module(
            id: "faith",
            title: "Les 6 Piliers de la Foi",
            description: "Les croyances fondamentales",
            iconName: "star.circle",
            lessons: [
                Lesson(
                    id: "allah",
                    title: "1. La Foi en Allah",
                    content: """
**Croire en Allah** - Le premier et plus important pilier de la foi (Iman).

📋 **Ce que cela signifie:**
Croire en l'existence d'Allah, Son unicité, et Ses attributs parfaits.

**Les 3 catégories de l'unicité (Tawhid):**

1. **Tawhid ar-Rububiyya** - Unicité de la Seigneurie
   - Allah est le seul Créateur
   - Le seul qui gère l'univers
   - Le seul qui donne la vie et la mort

2. **Tawhid al-Uluhiyya** - Unicité de l'adoration
   - Allah seul mérite l'adoration
   - Toute prière, invocation, sacrifice Lui est dédié

3. **Tawhid al-Asma wa as-Sifat** - Unicité des Noms et Attributs
   - Les 99 noms d'Allah
   - Ses attributs parfaits sans comparaison

💡 **Les 99 Noms d'Allah:**
- Ar-Rahman (Le Tout Miséricordieux)
- Ar-Rahim (Le Très Miséricordieux)
- Al-Malik (Le Roi)
- Al-Quddus (Le Saint)
- As-Salam (La Paix)
- Al-Mu'min (Le Gardien de la foi)
- Et 93 autres...

🎯 **Application pratique:**
- Apprends les 99 noms progressivement
- Invoque Allah par Ses noms
- Médite sur Ses attributs
- Renforce ta relation avec Lui
"""
                ),
                Lesson(
                    id: "angels",
                    title: "2. La Foi aux Anges",
                    content: """
**Croire aux Anges** - Le deuxième pilier de la foi.

📋 **Ce que cela signifie:**
Les anges sont des créatures d'Allah, créés de lumière, qui L'adorent et exécutent Ses ordres.

**Caractéristiques des anges:**
- Créés de lumière (nur)
- N'ont pas de libre arbitre
- N'ont pas de genre
- Peuvent prendre forme humaine
- Innombrables

**Les anges principaux:**

**Jibril (Gabriel) جبريل**
- Le messager d'Allah aux prophètes
- A transmis le Coran à Muhammad ﷺ

**Mika'il (Michel) ميكائيل**
- Gère la pluie, la végétation, la nature

**Israfil إسرافيل**
- Sonnera la trompette pour la fin des temps

**Azra'il عزرائيل**
- L'ange de la mort

**Munkar et Nakir منكر ونكير**
- Questionnent dans la tombe

**Raqib et Atid راقب وعتيد**
- Notent nos bonnes et mauvaises actions

**Malak al-Janna مالك**
- Gardien du Paradis

**Malak an-Nar مالك**
- Gardien de l'Enfer

💡 **Les anges avec nous:**
- Chaque personne a 2 anges qui l'accompagnent
- Ils enregistrent toutes nos actions
- "Quand deux personnes discutent, un ange les bénit si elles ne médissent pas."

🎯 **Application pratique:**
- Sois conscient de leur présence
- Rappelle-toi qu'ils notent tes actions
- Respecte leur sainteté par ton comportement
"""
                ),
                Lesson(
                    id: "books",
                    title: "3. La Foi aux Livres Sacrés",
                    content: """
**Croire aux Livres Sacrés** - Le troisième pilier de la foi.

📋 **Ce que cela signifie:**
Allah a révélé des livres à Ses prophètes pour guider l'humanité.

**Les 4 livres majeurs:**

1. **La Torah (At-Tawrat)** 📜
   - Révélée à Moussa (Moïse) عليه السلام
   - Guide pour les Bani Isra'il
   - Le Zabour (Psaumes) à Dawoud (David)

2. **L'Évangile (Al-Injil)** ✝️
   - Révélé à 'Isa (Jésus) عليه السلام
   - Confirmation de la Torah
   - Guide pour son peuple

3. **Les Psaumes (Az-Zabour)** 🎵
   - Révélés à Dawoud (David) عليه السلام
   - Invocations et louanges

4. **Le Coran (Al-Quran)** 📖
   - Révélé à Muhammad ﷺ
   - Le dernier et préservé
   - Pour toute l'humanité
   - Miracle éternel

**Pourquoi le Coran est spécial:**
- Le seul préservé intégralement
- Valide pour tous les temps
- En langue arabe, inchangé
- Mémorisé par des millions

💡 **Notre relation avec les livres:**
- Respect de tous les livres révélés
- Le Coran est notre guide final
- Il confirme et corrige les précédents

🎯 **Application pratique:**
- Lis le Coran quotidiennement
- Apprends l'arabe pour mieux le comprendre
- Applique ses enseignements
- Partage son message
"""
                ),
                Lesson(
                    id: "prophets",
                    title: "4. La Foi aux Prophètes",
                    content: """
**Croire aux Prophètes** - Le quatrième pilier de la foi.

📋 **Ce que cela signifie:**
Allah a envoyé des prophètes à chaque nation pour les guider vers la vérité.

**Les caractéristiques des prophètes:**
- Véridiques dans leur message
- Fidèles à leur mission
- Patients face aux épreuves
- Modèles de comportement

**Les 25 prophètes mentionnés dans le Coran:**

**Les Ulul 'Azm (les 5 les plus grands):**
1. **Nuh (Noé)** نوح - Le déluge
2. **Ibrahim (Abraham)** إبراهيم - L'ami d'Allah
3. **Moussa (Moïse)** موسى - Parlé par Allah
4. **'Isa (Jésus)** عيسى - Né sans père
5. **Muhammad** محمد - Le dernier prophète ﷺ

**Autres prophètes importants:**
- Adam (le premier)
- Idris, Hud, Salih
- Isma'il, Ishaq, Ya'qub
- Yusuf, Ayyub, Dhul-Kifl
- Haroun, Dawoud, Sulayman
- Ilyas, Al-Yasa', Yunus
- Zakariyya, Yahya

**Muhammad ﷺ - Le Sceau des Prophètes:**
- Le dernier messager
- Message universel
- Modèle parfait à suivre
- "J'ai été envoyé pour parfaire les nobles caractères"

💡 **Pourquoi les prophètes?**
- Transmettre la guidance d'Allah
- Être des exemples vivants
- Rappeler le message quand il est oublié
- Montrer le chemin vers le Paradis

🎯 **Application pratique:**
- Apprends la vie des prophètes
- Suis l'exemple de Muhammad ﷺ
- Prie sur lui régulièrement
- Étudie sa biographie (Sira)
"""
                ),
                Lesson(
                    id: "hereafter",
                    title: "5. La Foi au Jour Dernier",
                    content: """
**Croire au Jour Dernier** - Le cinquième pilier de la foi.

📋 **Ce que cela signifie:**
La vie présente est temporaire. Un jour, tous seront ressuscités et jugés par Allah.

**Les étapes du voyage vers l'au-delà:**

1. **La mort** 💀
   - Le début du voyage éternel
   - L'âme quitte le corps

2. **La tombe** ⚰️
   - Questionnement par Munkar et Nakir
   - Qui est ton Seigneur? Quelle est ta religion? Qui est ton prophète?
   - Première étape de récompense ou punition

3. **La fin des temps** 🌍
   - Signes majeurs et mineurs
   - Le soleil se lèvera à l'ouest
   - 'Isa (Jésus) reviendra
   - Apparition du Dajjal

4. **La Résurrection (Al-Ba'th)** 🧍
   - Israfil soufflera dans la trompette
   - Tous ressuscités en un instant

5. **Le Rassemblement (Al-Hashr)** 👥
   - Toute l'humanité réunie
   - Attente sous le soleil
   - Intercession des prophètes

6. **Le Jugement (Al-Hisab)** ⚖️
   - Chacun rend compte de ses actes
   - Le livre des actions
   - La balance des bonnes et mauvaises actions

7. **Le Passage (As-Sirat)** 🌉
   - Pont au-dessus de l'Enfer
   - Certains passent vite, d'autres lentement

8. **La destination finale** 🏠
   - Le Paradis (Jannah) - éternel
   - L'Enfer (Jahannam) - pour les mécréants

💡 **Le Paradis et l'Enfer:**
- Le Paradis: ce qu'aucun œil n'a vu
- L'Enfer: punition pour les mécréants
- Certains musulmans entreront en Enfer temporairement
- L'intercession de Muhammad ﷺ

🎯 **Application pratique:**
- Vis chaque jour comme le dernier
- Prépare-toi pour le voyage éternel
- Fais de bonnes actions maintenant
- Rappelle-toi souvent de la mort
"""
                ),
                Lesson(
                    id: "qadar",
                    title: "6. La Foi au Destin",
                    content: """
**Croire au Destin (Al-Qadar)** - Le sixième pilier de la foi.

📋 **Ce que cela signifie:**
Tout ce qui arrive, bon ou mauvais, arrive par la volonté et la prédestination d'Allah.

**Les 4 niveaux de la foi au destin:**

1. **La Science (Al-'Ilm)**
   - Allah sait tout de toute éternité
   - Il sait ce qui était, est, et sera
   - Rien ne L'échappe

2. **L'Écriture (Al-Kitabah)**
   - Tout est écrit dans la Table Gardée (Al-Lawh al-Mahfuz)
   - Avant la création, 50,000 ans

3. **La Volonté (Al-Mashi'ah)**
   - Rien n'arrive sans Sa volonté
   - Il veut ce qui arrive
   - Mais Il n'aime pas tout ce qui arrive

4. **La Création (Al-Khalq)**
   - Allah est le Créateur de tout
   - Nos actions existent par Sa création

**La liberté humaine (important!):**
- Nous avons un libre arbitre
- Nous choisissons nos actions
- Mais Allah sait ce qu'on va choisir
- La prédestination n'est pas une excuse

**Comment réagir face au destin:**
- **Dans le bonheur:** Dis "Alhamdulillah"
- **Dans le malheur:** Dis "Inna lillahi wa inna ilayhi raji'un"

💡 **Le secret du destin:**
- Le "pourquoi" est le secret d'Allah
- Fais ton devoir, confie-toi à Allah
- "Tie ta chamelle, puis fais confiance à Allah"

🎯 **Application pratique:**
- Fais ton maximum dans tout
- Accepte ce que tu ne peux pas changer
- Ne regrette pas le passé
- Fais confiance au plan d'Allah
"""
                )
            ]
        ),
        Module(
            id: "salat",
            title: "La Prière - Salat",
            description: "Apprendre à prier correctement",
            iconName: "hands.sparkles",
            lessons: [
                Lesson(
                    id: "salat-intro",
                    title: "Introduction à la Salat",
                    content: """
**La Salat** - Le pilier central de l'Islam et le lien direct avec Allah.

📋 **Pourquoi la prière?**
- Le Prophète ﷺ a dit: "La première chose sur laquelle on sera interrogé est la prière"
- Cinq moments par jour pour se reconnecter à Allah
- Pause spirituelle dans la course du quotidien

**Les 5 prières quotidiennes:**

| Prière | Arabe | Moment | Unités (Raka'at) |
|--------|-------|--------|------------------|
| Fajr | الفجر | Aube | 2 |
| Dhuhr | الظهر | Midi | 4 |
| Asr | العصر | Après-midi | 4 |
| Maghrib | المغرب | Coucher du soleil | 3 |
| Isha | العشاء | Nuit | 4 |

**Les conditions avant de prier:**
1. Être en état de pureté (Wudu)
2. Propreté du corps, vêtements, lieu
3. Couverture de la 'awra (parties intimes)
4. Direction vers la Qibla (Mecque)
5. L'intention dans le cœur

💡 **Pour les débutants:**
- Commence par apprendre les mouvements
- Al-Fatiha est essentielle
- Utilise des applications pour les horaires
- Prie avec quelqu'un d'expérimenté

🎯 **Plan d'apprentissage:**
1. Maîtrise le Wudu
2. Apprends Al-Fatiha
3. Apprends les mouvements
4. Commence par Fajr (2 unités)
5. Ajoute progressivement les autres
"""
                ),
                Lesson(
                    id: "salat-steps",
                    title: "Les Étapes de la Prière",
                    content: """
**Comment prier** - Guide étape par étape.

📋 **La prière en 12 étapes:**

**1. L'Intention (Niyya)** 💭
- Dans le cœur, pas à voix haute
- Intention de prier telle ou telle prière

**2. Takbirat al-Ihram** 🙋
- Dire "Allahu Akbar" en levant les mains
- Entre dans l'état de prière

**3. Dou'a d'ouverture** 🤲
- "Subhanaka Allahumma..."
- Ou autre invocation

**4. Al-Fatiha** 📖
- Lecture obligatoire à chaque unité
- "Bismillah..." jusqu'à "...walad-dallin"
- Dire "Amin" à la fin

**5. Récitation supplémentaire** 📜
- Une sourate ou versets après Al-Fatiha
- Pour les débutants: Al-Ikhlas, Al-Falaq, An-Nas

**6. Le Rouku' (inclinaison)** 🙇
- Dire "Allahu Akbar" et s'incliner
- Dire 3x: "Subhana Rabbi al-'Adhim"
- Se relever: "Sami'allahu liman hamidah, Rabbana laka al-hamd"

**7. La Sujud (prosternation)** 🙏
- Dire "Allahu Akbar" et se prosterner
- Dire 3x: "Subhana Rabbi al-A'la"

**8. Asseyez-vous (Jalsa)** 💺
- Dire "Allahu Akbar"
- S'asseoir brièvement

**9. Deuxième Sujud** 🙏
- Répète l'étape 7

**10. Tashahhud** ✋
- Assis après 2 unités
- "At-tahiyyatu lillah..."
- La prière sur le Prophète ﷺ

**11. Salam final** 👋
- "As-salamu 'alaykum wa rahmatullah"
- À droite puis à gauche

**12. Dou'a finale** 🤲
- Invocations personnelles
- Remercie Allah

💡 **Points importants:**
- La concentration (khushu') est essentielle
- Ne pas se précipiter
- Imite les mouvements si tu ne connais pas encore
"""
                ),
                Lesson(
                    id: "salat-fatihah",
                    title: "Al-Fatiha - La Sourate Clé",
                    content: """
**Al-Fatiha** - La sourate d'ouverture, récitée dans chaque unité de prière.

📖 **Le texte complet:**

**1. بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ**
*Bismillāhi r-raḥmāni r-raḥīm*
"Au nom d'Allah, le Tout Miséricordieux, le Très Miséricordieux"

**2. الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ**
*Al-ḥamdu lillāhi rabbi l-'ālamīn*
"Louange à Allah, Seigneur des mondes"

**3. الرَّحْمَنِ الرَّحِيمِ**
*Ar-raḥmāni r-raḥīm*
"Le Tout Miséricordieux, le Très Miséricordieux"

**4. مَالِكِ يَوْمِ الدِّينِ**
*Māliki yawmi d-dīn*
"Maître du Jour du Jugement"

**5. إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ**
*Iyyāka na'budu wa iyyāka nasta'īn*
"C'est Toi [Seul] que nous adorons, et c'est Toi [Seul] dont nous implorons le secours"

**6. اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ**
*Ihdinā ṣ-ṣirāṭa l-mustaqīm*
"Guide-nous dans le droit chemin"

**7. صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ**
*Ṣirāṭa lladhīna an'amta 'alayhim ghayri l-maghḍūbi 'alayhim wa laḍ-ḍāllīn*
"Le chemin de ceux que Tu as comblés de faveurs, non pas de ceux qui ont encouru Ta colère, ni des égarés"

💡 **Pourquoi Al-Fatiha est si importante:**
- Le Prophète ﷺ a dit: "Pas de prière pour celui qui ne récite pas Al-Fatiha"
- Elle résume tout le Coran
- Dialogue direct avec Allah
- Récitée minimum 17 fois par jour

🎯 **Comment l'apprendre:**
- Écoute des récitants
- Répète verset par verset
- Comprends le sens
- Pratique dans la prière
"""
                )
            ]
        ),
        Module(
            id: "wudu",
            title: "Le Wudu",
            description: "Les ablutions rituelles",
            iconName: "drop.fill",
            lessons: [
                Lesson(
                    id: "wudu-intro",
                    title: "Introduction au Wudu",
                    content: """
**Le Wudu** - Les ablutions rituelles, condition pour la prière.

📋 **Qu'est-ce que le Wudu?**
Une purification rituelle avec de l'eau propre, obligatoire avant la prière.

**Verset du Coran (5:6):**
"Ô vous qui croyez! Quand vous vous levez pour la prière, lavez vos visages et vos mains jusqu'aux coudes; passez les mains mouillées sur vos têtes et lavez vos pieds jusqu'aux chevilles."

**Les obligations (Fard) du Wudu:**
1. Laver le visage
2. Laver les bras jusqu'aux coudes
3. Passer les mains sur la tête (Masah)
4. Laver les pieds jusqu'aux chevilles

**Les recommandations (Sunnah):**
- L'intention
- Bismillah au début
- Laver les mains 3x
- Rincer la bouche 3x
- Rincer le nez 3x
- Tout faire 3 fois
- L'ordre des actions
- La continuité
- Frotter entre les doigts et orteils

💡 **Le mérite du Wudu:**
- "Quand le musulman fait ses ablutions, ses péchés sortent avec l'eau"
- Les anges prient pour celui qui reste en état de Wudu
- Le Wudu est une lumière le Jour du Jugement

🎯 **Conseils pratiques:**
- Fais le Wudu correctement, pas vite
- Apprends les dou'as associées
- Reste en état de Wudu autant que possible
"""
                )
            ]
        ),
        Module(
            id: "quran",
            title: "Le Coran pour Débutants",
            description: "Introduction au Coran",
            iconName: "book.fill",
            lessons: [
                Lesson(
                    id: "quran-intro",
                    title: "Introduction au Coran",
                    content: """
**Le Coran** - La parole d'Allah, révélée à Muhammad ﷺ sur 23 ans.

📋 **Ce qu'est le Coran:**
- La parole littérale d'Allah
- Révélé en arabe
- 114 sourates, 6236 versets
- Préservé inchangé depuis 1400 ans

**La révélation:**
- Première révélation: Sourate Al-'Alaq (96:1-5)
- Lieu: Grotte de Hira
- Dernière révélation: Sourate An-Nasr (110)
- Durée: 23 ans (13 à La Mecque, 10 à Médine)

**Division du Coran:**
- **30 Juz (parties)** - pour la récitation mensuelle
- **60 Hizb** - pour la récitation bi-mensuelle
- **114 Sourates** - de la plus longue à la plus courte

**Sourates Mecquoises vs Médinoises:**
- Mecquoises: Foi, monothéisme, au-delà, histoires des prophètes
- Médinoises: Lois, société, relations, communauté

💡 **Pourquoi le Coran est unique:**
- Le seul livre révélé préservé intégralement
- Mémorisé par des millions
- Défi linguistique incomparable
- Guidance pour tous les temps

🎯 **Comment approcher le Coran:**
- Avec respect et pureté
- Lis avec compréhension
- Mémorise progressivement
- Applique ses enseignements
"""
                ),
                Lesson(
                    id: "quran-reading",
                    title: "Comment Lire le Coran",
                    content: """
**Lecture du Coran** - Adab (étiquette) et méthode.

📋 **L'étiquette de la lecture:**

**Avant de lire:**
1. Être en état de pureté (Wudu)
2. Propreté du lieu et du corps
3. Se tourner vers la Qibla
4. Chercher protection (Ta'awwudh): "A'udhu billahi min ash-shaytan ar-rajim"
5. Dire Bismillah

**Pendant la lecture:**
- Lire lentement et avec méditation
- Pleurer si le cœur est touché
- Ne pas couper la récitation inutilement
- Mettre une belle voix (sans excès)

**Les formules à dire:**
- **Ta'awwudh:** أَعُوذُ بِاللَّهِ مِنَ الشَّيْطَانِ الرَّجِيمِ
- **Basmalah:** بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ

**Quand tu lis un verset de:**
- **Miséricorde:** Demande à Allah
- **Châtiment:** Cherche protection
- **Tasbih:** Dis "SubhanAllah"

💡 **Les meilleurs moments:**
- Après Fajr
- Pendant la nuit (Tahajjud)
- Vendredi
- Ramadan

🎯 **Plan de lecture pour débutants:**
1. Commence par Juz 'Amma (partie 30)
2. 1 page par jour
3. Comprends ce que tu lis
4. Écoute des récitants qualifiés
"""
                )
            ]
        ),
        Module(
            id: "ramadan",
            title: "Le Ramadan",
            description: "Le mois sacré du jeûne",
            iconName: "moon.fill",
            lessons: [
                Lesson(
                    id: "ramadan-why",
                    title: "Pourquoi le Ramadan?",
                    content: """
**Le Ramadan** - Le mois le plus béni de l'année, 4ème pilier de l'Islam.

📋 **Qu'est-ce que le Ramadan?**
Le 9ème mois du calendrier lunaire islamique, pendant lequel les musulmans jeûnent de l'aube au coucher du soleil.

**Verset du Coran (2:183):**
"Ô vous qui croyez! Le jeûne vous a été prescrit comme il a été prescrit à ceux avant vous, ainsi vous atteindrez la piété."

🌙 **Pourquoi jeûner?**

**1. La piété (Taqwa)**
- Le jeûne nous rapproche d'Allah
- On apprend à se contrôler
- On devient conscient de Sa présence

**2. La discipline spirituelle**
- Maîtrise des désirs
- Patience et persévérance
- Renforcement de la volonté

**3. L'empathie pour les pauvres**
- Ressentir la faim des nécessiteux
- Développer la compassion
- Encourager la charité

**4. La purification**
- Purification de l'âme
- Pardon des péchés
- Renouveau spirituel

**5. Le mois du Coran**
- Le Coran a été révélé pendant Ramadan
- Moment privilégié pour la récitation
- Nuit du Destin (Laylat al-Qadr)

💡 **Les bienfaits du Ramadan:**
- Pardon de tous les péchés passés
- Récompenses multipliées (x10 à x700)
- La nuit du Destin vaut 1000 mois
- Intercession le Jour du Jugement
- Entrée par la porte Ar-Rayyan

🎯 **Ce qu'Allah dit:**
"Je n'ai créé les djinns et les hommes que pour qu'ils M'adorent." (51:56)

Le Ramadan est l'occasion de remplir ce but ultime avec intensité et dévotion.
"""
                ),
                Lesson(
                    id: "ramadan-rules",
                    title: "Les Règles du Jeûne",
                    content: """
**Les règles du jeûne** - Ce qu'il faut savoir pour un jeûne valide.

📋 **Les conditions du jeûne:**

**Qui doit jeûner?**
- Musulman
- Pubère
- En bonne santé
- Présent (pas en voyage)*

*Le voyageur peut reporter le jeûne

**Les piliers du jeûne:**
1. **L'intention (Niyya)** - La veille ou avant l'aube
2. **L'abstinence** - De Fajr à Maghrib

⏰ **Les horaires:**

| Moment | Arabe | Action |
|--------|-------|--------|
| Sahur | السحور | Dernier repas avant l'aube |
| Début du jeûne | Fajr | الصبح | Cesser de manger/boire |
| Fin du jeûne | Maghrib | المغرب | Rompre le jeûne (Iftar) |

❌ **Ce qui rompt le jeûne:**
- Manger ou boire intentionnellement
- Vomir volontairement
- Relations conjugales
- Mensonge, calomnie (affaiblit le jeûne)

✅ **Ce qui n'affecte pas le jeûne:**
- Oublier et manger/boire (continuer le jeûne)
- Goûter sans avaler
- Se brosser les dents (sans avaler)
- Bailler
- Se laver

💊 **Les exemptions:**
- Maladie temporaire → Reporter
- Maladie chronique → Fidya (nourrir un pauvre par jour)
- Voyage → Reporter
- Femmes enceintes/allaitantes → Reporter ou Fidya
- Menstrues/lochies → Reporter

💡 **Sunna du Sahur:**
- Manger même peu
- Dattes sont idéales
- Beaucoup d'eau
- Bénédiction dans cette heure

🎯 **Pour un jeûne accepté:**
- Intention sincère
- Éviter les péchés
- Beaucoup de prières et dou'as
- Bon comportement
"""
                ),
                Lesson(
                    id: "ramadan-nights",
                    title: "Les Nuits Bénies",
                    content: """
**Les nuits de Ramadan** - Trésors spirituels à ne pas manquer.

🌙 **Laylat al-Qadr - La Nuit du Destin**

**Verset (97:1-3):**
"Nous l'avons certes fait descendre pendant la Nuit du Destin. Et qui te dira ce qu'est la Nuit du Destin? La Nuit du Destin vaut mieux que mille mois."

**Quand?**
- Une des 10 dernières nuits impaires
- Probablement la 27ème nuit
- À chercher dans les nuits 21, 23, 25, 27, 29

**Pourquoi est-elle si spéciale?**
- Mille mois = 83 ans et 4 mois!
- Meilleure qu'une vie entière d'adoration
- Les anges descendent
- Paix jusqu'à l'aube

**Que faire cette nuit?**
- Qiyam (prière de nuit)
- Récitation du Coran
- Dou'as sincères
- Istighfar (demande de pardon)

💎 **Dou'a de Laylat al-Qadr:**
"اللَّهُمَّ إِنَّكَ عَفُوٌّ تُحِبُّ الْعَفْوَ فَاعْفُ عَنِّي"
"Allahumma innaka 'afuwwun tuhibbul-'afwa fa'fu 'anni"
"Ô Allah, Tu es Celui qui pardonne, Tu aimes le pardon, alors pardonne-moi."

🕌 **Tarawih - Prières nocturnes**
- Après la prière Isha
- 8 à 20 raka'at
- Récitation prolongée du Coran
- À la mosquée si possible

⭐ **Qiyam al-Layl**
- Prières volontaires de nuit
- Spécialement les 10 derniers jours
- Le Prophète ﷺ intensifiait ces nuits
- Le meilleur moment pour les dou'as

💡 **Les 10 derniers jours:**
- Le Prophète ﷺ resserrait sa ceinture
- Restait éveillé la nuit
- Réveillait sa famille
- I'tikaf (retraite à la mosquée)

🎯 **Conseils pratiques:**
- Prépare-toi physiquement et spirituellement
- Fais une dou'a list
- Évite les distractions
- Coupe les réseaux sociaux
- Planifie tes nuits à l'avance
"""
                ),
                Lesson(
                    id: "ramadan-iftar",
                    title: "L'Iftar et les Dou'as",
                    content: """
**L'Iftar** - Le moment béni de la rupture du jeûne.

🌅 **La Sunna de la rupture:**

**1. La rapidité**
- "Les gens continueront à être dans le bien tant qu'ils rompront le jeûne rapidement"
- Dès l'appel du Maghrib

**2. Les dattes**
- Commencer par 1, 3 ou 5 dattes
- Si pas de dattes: de l'eau
- Le Prophète ﷺ le faisait toujours

**3. L'eau**
- Boire de l'eau fraîche
- Pas trop vite
- Hydratation progressive

🤲 **Les dou'as de l'iftar:**

**Dou'a principale:**
"ذَهَبَ الظَّمَأُ وَابْتَلَّتِ الْعُرُوقُ وَثَبَتَ الْأَجْرُ إِنْ شَاءَ اللَّهُ"
"Dhahaba az-zama'u wabtallatil-'urūqu wa thabatal-ajru in shā'allah"
"La soif est partie, les veines sont hydratées, et la récompense est confirmée, si Allah le veut."

**Dou'a à tout moment:**
"اللَّهُمَّ لَكَ صُمْتُ وَعَلَى رِزْقِكَ أَفْطَرْتُ"
"Allāhumma laka sumtu wa 'alā rizqika aftartu"
"Ô Allah, pour Toi j'ai jeûné et avec Ta subsistance je romps le jeûne."

**Dou'a exaucée:**
"لِلصَّائِمِ عِنْدَ فِطْرِهِ دَعْوَةٌ مَا تُرَدُّ"
"Le jeûneur a une dou'a exaucée à la rupture."
- Fais tes demandes les plus chères
- Pour toi, ta famille, la Oumma

🍽️ **Conseils nutritionnels:**

**À éviter:**
- Trop manger d'un coup
- Aliments trop gras/sucrés
- Boissons gazeuses
- Aliments trop salés

**À privilégier:**
- Dattes + eau
- Soupes (harira, lentilles)
- Fruits et légumes
- Protéines modérées
- Hydratation progressive

💧 **Entre Iftar et Sahur:**
- Boire régulièrement
- Éviter le café/thé (déshydratant)
- Aliments riches en eau
- Ne pas sauter le Sahur

🎯 **L'esprit de l'iftar:**
- Ne pas faire un festin
- Partager avec les autres
- Inviter les voisins
- Penser à ceux qui n'ont pas
- Charité et générosité
"""
                ),
                Lesson(
                    id: "ramadan-charity",
                    title: "La Charité et Zakat al-Fitr",
                    content: """
**La charité pendant Ramadan** - Le mois de la générosité.

💰 **Le Prophète ﷺ le plus généreux:**
"Le Messager d'Allah était le plus généreux des gens, et il l'était encore plus pendant Ramadan."

🌟 **Pourquoi donner pendant Ramadan?**

**1. Récompenses multipliées**
- Chaque bonne action = x10 à x700
- Charité pendant Ramadan = immense

**2. Les pauvres ont besoin**
- Tous jeûnent, pas tous peuvent manger
- Solidarité de la Oumma

**3. Purification de l'âme**
- L'avarice disparaît
- Le cœur s'attendrit

**4. La voie du Prophète**
- Il donnait sans compter
- Son exemple à suivre

zakat **Zakat al-Fitr - L'aumône de fin de Ramadan:**

**Qu'est-ce que c'est?**
- Obligatoire pour chaque musulman
- À donner avant la prière de l'Aïd
- Purifie le jeûne des imperfections

**Qui doit la donner?**
- Chaque musulman
- Pour soi et ses dépendants
- Si on a de quoi pour la journée

**Combien?**
- Environ 2.5 kg de nourriture
- Ou valeur équivalente en argent
- Par personne du foyer

**À qui?**
- Les pauvres et nécessiteux
- Les mêmes catégories que la Zakat

**Quand?**
- Derniers jours de Ramadan
- Avant la prière de l'Aïd
- Si donné après: simple charité

🎁 **Autres formes de charité:**

**Sadaqah (charité volontaire)**
- Ce que tu peux
- Régulièrement
- Même un sourire

**Partager la nourriture**
- Inviter à l'iftar
- "Celui qui nourrit un jeûneur a la même récompense"
- Voisins, famille, pauvres

**Bon comportement**
- Éviter de blesser
- Aider les autres
- Sourire = charité

💡 **Idées de charité:**
- Préparer des iftars pour les démunis
- Donner à des orphelinats
- Soutenir des mosquées
- Aider des familles en difficulté
- Financer des puits d'eau

🎯 **Objectif:**
"Donne ne serait-ce qu'une datte"
Même un petit don compte énormément auprès d'Allah.
"""
                ),
                Lesson(
                    id: "ramadan-eid",
                    title: "L'Aïd al-Fitr",
                    content: """
**L'Aïd al-Fitr** - La fête de la rupture du jeûne.

🎉 **Qu'est-ce que l'Aïd?**
La fête qui marque la fin du Ramadan, jour de célébration et de gratitude.

**La signification:**
- "Fitr" = rupture/ouverture
- Célébration de l'accomplissement
- Jour de récompense
- Gratitude envers Allah

📅 **Le jour de l'Aïd:**

**La veille:**
- Donner Zakat al-Fitr
- Préparer les vêtements
- Nettoyer la maison

**Le matin:**
1. **Se réveiller tôt**
2. **Ghusl (grandes ablutions)**
3. **Porter ses meilleurs vêtements**
4. **Manger quelque chose de sucré** (dattes)
5. **Aller à la mosquée tôt**
6. **Prière de l'Aïd** (après le lever du soleil)

🕌 **La prière de l'Aïd:**
- 2 raka'at
- Pas d'adhan ni iqama
- Takbir supplémentaires
- Khutba (sermon) après
- Écouter attentivement

🙋 **Les Takbirat:**
"Allāhu akbar, Allāhu akbar, Allāhu akbar, lā ilāha illallāhu wallāhu akbar, Allāhu akbar wa lillāhil-ḥamd"
"Allah est le Plus Grand... Il n'y a de divinité qu'Allah..."

- Du coucher du soleil la veille
- Jusqu'à la prière
- À voix haute (hommes)
- En allant à la mosquée

🤝 **La Sunna de l'Aïd:**

**Avant la prière:**
- Manger des dattes (nombre impair)
- Prendre un chemin différent au retour
- Se féliciter: "Taqabbalallāhu minnā wa minkum"
- "Qu'Allah accepte de nous et de vous"

**Après la prière:**
- Visiter la famille
- Échanger des cadeaux
- Bien manger
- Se réjouir licitement

- Visiter les cimetières
- Prier pour les défunts

🎁 **Célébrer ensemble:**

**En famille:**
- Repas spécial
- Cadeaux aux enfants (Eidiya)
- Joie et bonheur
- Photos souvenirs

**Dans la communauté:**
- Saluer tout le monde
- Réconciliations
- Oublier les rancunes
- Solidarité

💡 **Attention à éviter:**
- Les excès alimentaires
- Les dépenses excessives
- Les festivités interdites
- Négliger les prières

🎯 **Le vrai sens de l'Aïd:**
- Gratitude pour le Ramadan accompli
- Continuer les bonnes habitudes
- Ne pas retourner aux péchés
- L'Aïd est pour celui qui a jeûné et prié

**Dou'a:**
"Taqabbalallāhu minnā wa minkum wa ākharahū 'alaynā wa 'alaykum bi kulli khayr"
"Qu'Allah accepte de nous et de vous, et qu'Il nous le fasse revenir avec tout le bien."
"""
                )
            ]
        ),
        Module(
            id: "seerah",
            title: "La vie du Prophète ﷺ",
            description: "Biographie du Prophète Muhammad",
            iconName: "heart.text.square",
            lessons: [
                Lesson(
                    id: "seerah-intro",
                    title: "Introduction à la Sira",
                    content: """
**La Sira** - La biographie du Prophète Muhammad ﷺ, notre modèle parfait.

📋 **Qui était Muhammad ﷺ?**
- Le dernier prophète et messager d'Allah
- Né à La Mecque en 570 (Année de l'Éléphant)
- Reçut la révélation à 40 ans
- Mort à 63 ans à Médine

**Son nom complet:**
Muhammad ibn 'Abdullah ibn 'Abdul-Muttalib ibn Hashim

**Ses surnoms:**
- Al-Amin (Le Fidèle) - avant la prophétie
- As-Sadiq (Le Véridique)

**Sa description physique:**
- Taille moyenne, légèrement grand
- Visage lumineux
- Barbe fournie
- Marche rapide comme sur une pente
- Sourire constante

**Ses qualités (Kamalat):**
- Véridique dans tout ce qu'il dit
- Fidèle dans ses engagements
- Doux et miséricordieux
- Humble malgré son statut
- Patient face aux épreuves
- Généreux comme le vent

💡 **Pourquoi étudier sa vie?**
- "Il y a certes dans le Messager d'Allah un excellent modèle" (33:21)
- Il incarnait le Coran vivant
- Sa vie est un guide pratique
- On l'aime en le connaissant

🎯 **Les périodes de sa vie à étudier:**
1. Avant la prophétie (0-40 ans)
2. À La Mecque (40-53 ans)
3. À Médine (53-63 ans)
"""
                ),
                Lesson(
                    id: "seerah-early",
                    title: "Avant la Prophétie",
                    content: """
**Les 40 premières années** - Préparation d'un prophète.

📍 **La naissance (570 CE):**
- Né à La Mecque
- Père décédé avant sa naissance
- Mère: Amina bint Wahb
- Orphelin de père et mère très jeune

**La garde:**
- 0-5 ans: Halima as-Sa'diyya (nourrice du désert)
- 5-6 ans: Retour à sa mère, puis elle décède
- 6-8 ans: Grand-père Abdul-Muttalib
- 8-25 ans: Oncle Abu Talib

**Événements marquants:**

**1. L'ouverture de la poitrine (4-5 ans)**
- Deux anges ont retiré une partie noire de son cœur
- Purification pour sa future mission

**2. Le voyage en Syrie (12 ans)**
- Avec son oncle Abu Talib
- Le moine Bahira reconnaît les signes de prophétie

**3. La guerre de Fijar (15-20 ans)**
- Participe à la reconciliation

**4. L'alliance de Fudul (20 ans)**
- Pacte pour défendre l'opprimé
- Le Prophète ﷺ a dit: "J'aurais participé même dans l'Islam"

**5. Le commerce pour Khadija (25 ans)**
- Réputation d'honnêteté
- Succès commercial

**6. Mariage avec Khadija (25 ans)**
- Elle a 40 ans, lui 25
- Elle propose le mariage
- Le meilleur mariage de l'histoire

**7. La reconstruction de la Kaaba (35 ans)**
- Règlement du conflit de la Pierre Noire
- Sa sagesse évite une guerre tribale

💡 **Pourquoi 40 ans de préparation?**
- Maturité complète
- Réputation établie
- Connaissance de sa société
- Prêt pour la lourde mission

🎯 **Leçons:**
- L'honnêteté construit la confiance
- L'intégrité avant l'autorité
- La préparation précède la mission
"""
                ),
                Lesson(
                    id: "seerah-revelation",
                    title: "La Révélation et la Persécution",
                    content: """
**Les 13 ans à La Mecque** - Foi contre oppression.

📍 **La première révélation (610 CE, 40 ans):**
- Grotte de Hira, montagne de Nur
- L'ange Jibril apparaît
- "Lis! Au nom de ton Seigneur qui a créé" (96:1-5)
- Muhammad ﷺ rentre tremblant
- Khadija le rassure: "Allah ne t'humiliera jamais"

**Les premiers musulmans:**
1. **Khadija** - Première croyante, épouse
2. **Ali** - 10 ans, cousin
3. **Zayd** - Affranchi, fils adoptif
4. **Abu Bakr** - Ami intime, premier homme libre
5. **Bilal** - Esclave, futur muezzin

**Les 3 ans de prêche secret:**
- Invitation discrète
- Environ 40 convertis
- Formation spirituelle

**L'appel public (3ème année):**
- "Et avertis ta tribu" (26:214)
- Montée de Safa
- Rejet de son oncle Abu Lahab

**La persécution:**
- Moqueries et insultes
- Boycott économique
- Tortures physiques
- Martyre de Sumayya et Yasir

**Les années difficiles:**
- Mort d'Abu Talib (protection)
- Mort de Khadija (soutien)
- Année de la tristesse

💡 **Leçons de cette période:**
- La vérité est d'abord rejetée
- La patience face à l'épreuve
- L'importance du soutien familial
- Ne jamais abandonner

🎯 **Comment appliquer:**
- Sois patient dans l'épreuve
- Fortifie ta foi dans la difficulté
- Soutiens les nouveaux musulmans
"""
                ),
                Lesson(
                    id: "seerah-madina",
                    title: "L'Hégire et Médine",
                    content: """
**L'Hégire et l'État Islamique** - De la persécution à la victoire.

📍 **L'Hégire (622 CE):**
- Migration de La Mecque à Médine
- Tournant de l'histoire islamique
- Début du calendrier islamique

**Le voyage:**
- Ali dans le lit du Prophète ﷺ
- Caverne de Thawr (3 jours)
- Abu Bakr avec lui
- Arrivée à Quba, puis Médine

**Construction de la communauté:**

**1. La Mosquée du Prophète**
- Centre spirituel et social
- Première mosquée de l'Islam

**2. La fraternité (Mu'akhat)**
- Réfugiés mecquois (Muhajirun)
- Médinois accueillants (Ansar)
- Partage des biens et foyers

**3. La Constitution de Médine**
- Droits et devoirs de tous
- Liberté religieuse
- Défense commune

**Les batailles majeures:**

| Bataille | Année | Résultat |
|----------|-------|----------|
| Badr | 2H | Victoire décisive |
| Uhud | 3H | Défaite partielle |
| La Tranchée | 5H | Victoire défensive |
| La Mecque | 8H | Conquête pacifique |

**Le Traité de Hudaybiyya (6H):**
- Apparente défaite, grande victoire
- Paix de 10 ans
- Muslims purent propager librement

**La Conquête de La Mecque (8H):**
- 10,000 musulmans
- Victoire sans effusion de sang
- "Allez, vous êtes libres!"
- Pardon général

💡 **Leçons:**
- La patience mène à la victoire
- La stratégie compte
- Le pardon est puissant
- L'unité est force

🎯 **Comment appliquer:**
- Construis des communautés
- Pratique la fraternité
- Fais preuve de pardon
"""
                ),
                Lesson(
                    id: "seerah-end",
                    title: "Les Derniers Jours et l'Héritage",
                    content: """
**La fin de la mission** - Un héritage éternel.

📍 **Le Pèlerinage d'Adieu (10H):**
- Le seul Hajj du Prophète ﷺ
- 100,000+ compagnons présents
- Le sermon d'adieu

**Extraits du Sermon d'Adieu:**
- "Votre sang, vos biens et votre honneur sont sacrés"
- "Toute âme est responsable de ses actes"
- "Pas de supériorité d'un Arabe sur un non-Arabe"
- "Traitez bien les femmes"
- "Je vous laisse deux choses: le Coran et ma Sira"

**La maladie finale (11H, 63 ans):**
- Commence après le Hajj
- Fièvre et faiblesse
- Dernier sermon: "La prière, la prière!"
- Demande pardon pour ses péchés (humilité)

**Ses derniers mots:**
"Plutôt, Allah a choisi la compagnie d'en haut. Non, plutôt, avec les prophètes, les véridiques, les martyrs et les vertueux."

Il mourut la tête sur la poitrine d'Aïsha, sa femme.

**Date du décès:**
- 12 Rabi' al-Awwal, 11H
- 8 juin 632 CE
- Âge: 63 ans

**Son héritage:**
- Le Coran préservé
- La Sira documentée
- Des millions de compagnons formés
- Une civilisation florissante
- Un message universel

**Ses accomplissements:**
✅ Transformation d'une société tribale en communauté unie
✅ Élimination du racisme et du tribalisme
✅ Droits des femmes sans précédent
✅ Éducation de masse
✅ Système de justice équitable
✅ Liberté religieuse protégée

💡 **Ce qu'il a laissé:**
- Pas d'or ni d'argent
- Son armure était en gage
- Mais: le chemin vers le Paradis

🎯 **Comment honorer son héritage:**
- Étudie sa vie
- Suis son exemple
- Prie sur lui régulièrement
- Vis selon ses enseignements
"""
                )
            ]
        )
    ]
}

struct Lesson: Identifiable, Codable {
    let id: String
    let title: String
    let content: String
}
