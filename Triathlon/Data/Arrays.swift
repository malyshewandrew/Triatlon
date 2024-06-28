import UIKit

// MARK: - PHILOSOPHY:

let philosophyTitleArray: [UIImage] = [UIImage(resource: .philosophyTitle1), UIImage(resource: .philosophyTitle2), UIImage(resource: .philosophyTitle3), UIImage(resource: .philosophyTitle4), UIImage(resource: .philosophyTitle5)]
let philosophyRuleOneArray: [UIImage] = [UIImage(resource: .philosophyRuleOne1), UIImage(resource: .philosophyRuleOne2), UIImage(resource: .philosophyRuleOne3), UIImage(resource: .philosophyRuleOne4), UIImage(resource: .philosophyRuleOne5)]
let philosophyRuleTwoArray: [UIImage] = [UIImage(resource: .philosophyRuleTwo1), UIImage(resource: .philosophyRuleTwo2), UIImage(resource: .philosophyRuleTwo3), UIImage(resource: .philosophyRuleTwo4), UIImage(resource: .philosophyRuleTwo5)]
let philosophyRuleThreeArray: [UIImage] = [UIImage(resource: .philosophyRuleThree1), UIImage(resource: .philosophyRuleThree2), UIImage(resource: .philosophyRuleThree3), UIImage(resource: .philosophyRuleThree4), UIImage(resource: .philosophyRuleThree5)]
let philosophyRuleFourArray: [UIImage] = [UIImage(resource: .philosophyRuleFour1), UIImage(resource: .philosophyRuleFour2), UIImage(resource: .philosophyRuleFour3), UIImage(resource: .philosophyRuleFour4), UIImage(resource: .philosophyRuleFour5)]

// MARK: - PEOPLES:

// TRAINERS:
let trainerArray: [HumanModel] = [HumanModel(photo: [UIImage(resource: .tolkachev1), UIImage(resource: .tolkachev2), UIImage(resource: .tolkachev3), UIImage(resource: .tolkachev4), UIImage(resource: .tolkachev5)], name: "Дмитрий Толкачев", country: "🇧🇾", achievements: """
- Основатель и старший тренер Tristyle
- 2009-2016 г.г тренер национальной сборной РБ по триатлону
- Победитель и призер международных соревнований по триатлону и дуатлону (Германия, Польша, Прибалтика)
- 13-кратный победитель чемпионатов РБ
- Мастер спорта (первый мастер спорта среди мужчин по триатлону в РБ)
- Международная судейская категория по триатлону
- Стаж в триатлоне более 30 лет, из них 14 лет – тренерская работа
""", work: "Тренер Tristyle", url: "https://www.instagram.com/tolkachev_1971/", youtube: "https://youtu.be/oUDkghl2Kfs?si=i8rUmjX0rwK1UgGj"),
HumanModel(photo: [UIImage(resource: .meljah1), UIImage(resource: .meljah2), UIImage(resource: .meljah3), UIImage(resource: .meljah4), UIImage(resource: .meljah5)], name: "Дмитрий Мелях", country: "🇧🇾", achievements: """
- 3-кратный участник Олимпийских Игр
- 2-кратный чемпион мира
  (по современному пятиборью)
- Победитель этапа Кубка мира
- Чемпион Европы
- Тринадцатикратный чемпион РБ
- Заслуженный мастер спорта РБ
- Старший тренер национальной команды
""", work: "Тренер Tristyle", url: "https://www.instagram.com/dzmitry_meliakh/", youtube: "https://youtu.be/v0IYwysH0PQ?si=cB7m4E4OoFEKzeOA"),
HumanModel(photo: [UIImage(resource: .coptur1), UIImage(resource: .coptur2), UIImage(resource: .coptur3)], name: "Дмитрий Коптур", country: "🇧🇾", achievements: """
- МCМК по плаванию
- Участник Олимпийских Игр в Сиднее
- Победитель и призер этапов кубка мира
- Многократный финалист Чемпионатов мира и Чемпионатов Европы
- Многократный чемпион и рекордсмен на дистанциях 400, 800 и 1500 м. вольным стилем
""", work: "Тренер Tristyle", url: "https://www.instagram.com/dmitriikoptur/", youtube: "https://youtu.be/gBHg6gA8OFg?si=anT31do9u0ZYxjJT"),
HumanModel(photo: [UIImage(resource: .prokopenya1)],
           name: "Василий Прокопеня", country: "🇧🇾", achievements: """
           - Мастер спорта по плаванию
           - Многократный победитель и призер кубков и чемпионатов РБ
           - Победитель и призер республиканских универсиад
           - Многократный победитель ежегодных спартакиад дирекции региональных продаж «Газпром-нефть»
           - Призер международных турниров (Литва, Польша, Чехия)
           """, work: "Тренер Tristyle", url: "", youtube: ""),
HumanModel(photo: [UIImage(resource: .koleda1)], name: "Игорь Коледа", country: "🇧🇾", achievements: """
- Мастер спорта международного класса
- Участник XXVII летних Олимпийских игр в Сиднее, Австралия
- Финалист Чемпионатов Европы и Мира
- Победитель и призер этапов Кубка Мира
- Многократный победитель и призер Чемпионатов РБ
- Неоднократный рекордсмен РБ, держатель действующих рекордов на 200м и 400м
""", work: "Тренер Tristyle", url: "", youtube: ""),
HumanModel(photo: [UIImage(resource: .dahno1)], name: "Александр Дахно", country: "🇧🇾", achievements: """
- Мастер спорта по триатлону
- Член национальной сборной 2012-2017
- Чемпион Беларуси по триатлону на спринтерской дистанции
- Неоднократный победитель кубков Республики Беларусь по триатлону и дуатлону
- Участник первенства мира в Лондоне в 2013г
- МГУ им. А. А. Кулешова Тренер-преподаватель физической культуры и спорта
""", work: "Тренер Tristyle", url: "", youtube: ""),
HumanModel(photo: [UIImage(resource: .hrushev1)], name: "Вадим Хрущёв", country: "🇧🇾", achievements: """
- 15 лет в маунтинбайке
- Около 200 стартов в  олимпийском кросс-кантри и МТБ-марафонах
- Многократный победитель и  призер в Любительских соревнованиях по МТБ
- Основатель одной из лучших в Беларуси трассы по Олимпийскому кросс-кантри
- Тренер по МТБ с 2022г
""", work: "Тренер Tristyle", url: "", youtube: ""),
HumanModel(photo: [UIImage(resource: .bukovets1)], name: "Артём Буковец", country: "🇧🇾", achievements: """
- Мастер спорта по триатлону
- Около 30 человек подготовил к Ironman
- Стаж тренерской работы более 15 лет
- Личный тренер Анны Максимовой, Александра Василевича (до этого 9 лет тренер Толкачев Д.Л.), Никиты Григорьева
- Лучшие результаты учеников на Ironman: 8.35 женщина и 8.11 мужчина
""", work: "Тренер Tristyle", url: "", youtube: "https://youtu.be/rJVl5fqMpzg?si=E2aI6TT0O4SwaZy_"),
HumanModel(photo: [UIImage(resource: .peregud1)], name: "Денис Перегуд", country: "🇧🇾", achievements: """
- Мастер спорта по плаванию
- Неоднократный чемпион и призер чемпионата и кубка РБ
- Призер молодежного чемпионата Европы
- Чемпион и призер чемпионата СНГ
""", work: "Тренер Tristyle", url: "", youtube: ""),
HumanModel(photo: [UIImage(resource: .lagun1)], name: "Павел Лагун", country: "🇧🇾", achievements: """
- Мастер спорта международного класса по плаванию
- Участник XXVII и XXVIII-ых Олимпийских Игр
- Призёр этапов Кубка мира
- Призёр юниорского Чемпионата Европы
- Победитель Чемпионата Европы, Мира и Всемирных Игр по плаванию в категории «Мастерс»
- Многократный чемпион и рекордсмен РБ
""", work: "Тренер Tristyle", url: "", youtube: ""),
HumanModel(photo: [UIImage(resource: .lukyanov1)], name: "Алексей Лукьянов", country: "🇧🇾", achievements: """
- МС по лыжным гонкам, МС по биатлону
- Тренер высшей категории, подготовивший : 8 мастеров спорта и  мастера спорта международного класса (дважды  призёра чемпионата мира 2017 и 2022; участника паралимпийских игр 2018 и 2022)
- Тренерский стаж 14 лет
- Тренерский диплом Международного Олимпийского Комитета (специализация лыжные гонки/биатлон)
- Участник и призёр множества международных стартов по лыжным гонкам (в личных дисциплинах до 2010 года и в дальнейшем в роли гайда-лидера (3 место чемпионат мира 2017 года Финстерау-Германия), 4 место паралимпийские игры 2018 года
- Высшее физкультурное образование в БГПУ им. М.Танка
- Финишер двух ультрамарафонов кроссом по 100 км в 2021/2022
""", work: "Тренер Tristyle", url: "", youtube: ""),
HumanModel(photo: [UIImage(resource: .rylkov1)], name: "Алексей Рыльков", country: "🇧🇾", achievements: """
- Мастер спорта РБ в 3-х различных дисциплинах:
по современному пятиборью
по служебному многоборью
по многоборью специальных подразделений
- На протяжении  многих лет входил в национальную команду РБ по современному пятиборью.
- Призер и участник Чемпионатов мира, этапов Кубка мира, Чемпионатов Европы по современному пятиборью (2002-2010)
- Тренер спортивных команд, спортсмен — инструктор спортивных команд (стаж работы более 5 лет)
- Международный опыт работы:  государство Катар (6 лет)
""", work: "Тренер Tristyle", url: "", youtube: ""),
HumanModel(photo: [UIImage(resource: .ivanov1)], name: "Александр Иванов", country: "🇧🇾", achievements: """
- МС по легкой атлетике
- КМС по триатлону
- Член национальной сборной РБ по легкой атлетике с 2004 по 2010 года
- Неоднократный победитель и призер Республиканских и международных соревнований по легкой атлетике
- Рекордсмен РБ в беге на 400 метров в категории Мастерс (35-39)
- Чемпион РБ и России в беге на 800 метров в категории Мастерс (35-39)
""", work: "Тренер Tristyle", url: "", youtube: ""),
HumanModel(photo: [UIImage(resource: .suzdalev1)], name: "Александр Суздалев", country: "🇧🇾", achievements: """
- Мастер спорта по триатлону
- Победитель и призёр чемпионата РБ по триатлону и дуатлону
- Член национальной сборной с 2005-2010
- Призёр международных соревнований по триатлону
- МГУОР «тренер по плаванию»
- МГУ им. Кулешова факультет физического воспитания 2010г
""", work: "Тренер Tristyle", url: "", youtube: ""),
HumanModel(photo: [UIImage(resource: .bubenin1)], name: "Евгений Бубенин", country: "🇧🇾", achievements: """
- Мастер Спорта по плаванию
- Неоднократный призёр Чемпионатов и Кубков РБ
- Чемпион Республики Беларусь в плавании вольным стилем
- Неоднократный участник международных соревнований
""", work: "", url: "", youtube: "")]

// TEAM:
let teamArray: [HumanModel] = [HumanModel(photo: [UIImage(resource: .maksimova1), UIImage(resource: .maksimova2), UIImage(resource: .maksimova3), UIImage(resource: .maksimova4), UIImage(resource: .maksimova5)], name: "Анна Максимова", country: "🇧🇾", achievements: """
- МСМК по триатлону
- Член Национальной Команды
- Многократная победительница Чемпионата страны на Олимпийской дистанции (14,15,17,19)
- Рекордсменка страны на дистанции Ironman — 9.08
- 2 место Ironman Barcelona 2018
- Лидер Мирового рейтинга на длинной дистанции 2016, 2017 года
- Призёр и участница Чемпионата Европы на длинной дистанции
- Победитель Чемпионата Азии на длинной дистанции (2018)
- Призёр и участница различных этапов кубка Европы и Мира по триатлону
- Чемпион и призёр Чемпионата Балтийских стран
""", work: "Спортсмен Tristyle", url: "", youtube: "https://youtu.be/jP9paLc8sss?si=FJZOgSgvQKoe0KT0"),
HumanModel(photo: [UIImage(resource: .shemelev1), UIImage(resource: .shemelev2), UIImage(resource: .shemelev3), UIImage(resource: .shemelev4), UIImage(resource: .shemelev5)], name: "Тихон Щемелев", country: "🇧🇾", achievements: """
- Мастер спорта РБ по триатлону
- Призер этапа кубка Европы (юниоры)
- Призер чемпионата РБ
- Неоднократный победитель первенств РБ по триатлону
- Участник первенства Европы
""", work: "Спортсмен Tristyle", url: "", youtube: "")]

// SPORTSMENS:
let sportsmensArray: [HumanModel] = []

// TRISTYLE:
let tristyleArray: [HumanModel] = [HumanModel(photo: [UIImage(resource: .tolkachev1), UIImage(resource: .tolkachev2), UIImage(resource: .tolkachev3), UIImage(resource: .tolkachev4), UIImage(resource: .tolkachev5)], name: "Дмитрий Толкачев", country: "🇧🇾", achievements: """
- Основатель и старший тренер Tristyle
- 2009-2016 г.г тренер национальной сборной РБ по триатлону
- Победитель и призер международных соревнований по триатлону и дуатлону (Германия, Польша, Прибалтика)
- 13-кратный победитель чемпионатов РБ
- Мастер спорта (первый мастер спорта среди мужчин по триатлону в РБ)
- Международная судейская категория по триатлону
- Стаж в триатлоне более 30 лет, из них 14 лет – тренерская работа
""", work: "Тренер Tristyle", url: "https://www.instagram.com/tolkachev_1971/", youtube: "https://youtu.be/oUDkghl2Kfs?si=i8rUmjX0rwK1UgGj"),
HumanModel(photo: [UIImage(resource: .plodunov1), UIImage(resource: .plodunov2), UIImage(resource: .plodunov3), UIImage(resource: .plodunov4), UIImage(resource: .plodunov5)], name: "Захар Плодунов", country: "🇧🇾", achievements: """
- Требуется заполнить
- Требуется заполнить
- Требуется заполнить
- Требуется заполнить
- Требуется заполнить
""", work: "Требуется заполнить", url: "https://www.instagram.com/plodunov/", youtube: "https://youtu.be/yci9oqgHnf8?si=Zuc3io6fcZnGD8Hs"),
HumanModel(photo: [UIImage(resource: .kitsuk1), UIImage(resource: .kitsuk2), UIImage(resource: .kitsuk3), UIImage(resource: .kitsuk4), UIImage(resource: .kitsuk5)], name: "Дмитрий Кицук", country: "🇧🇾", achievements: """
- Требуется заполнить
- Требуется заполнить
- Требуется заполнить
- Требуется заполнить
- Требуется заполнить
""", work: "Требуется заполнить", url: "https://www.instagram.com/dimkit01/", youtube: ""),
HumanModel(photo: [UIImage(resource: .terpan1), UIImage(resource: .terpan2), UIImage(resource: .terpan3), UIImage(resource: .terpan4), UIImage(resource: .terpan5)], name: "Владимир Терпан", country: "🇧🇾", achievements: """
- Требуется заполнить
- Требуется заполнить
- Требуется заполнить
- Требуется заполнить
- Требуется заполнить
""", work: "Требуется заполнить", url: "https://www.instagram.com/vladimir_terpan/", youtube: ""),
HumanModel(photo: [UIImage(resource: .petr1)], name: "Петр", country: "🇧🇾", achievements: """
- Требуется заполнить
- Требуется заполнить
- Требуется заполнить
- Требуется заполнить
- Требуется заполнить
""", work: "Требуется заполнить", url: "", youtube: "")]

// MARK: - GROUPS:

let arrayGroups: [ScheduleModel] = [ScheduleModel(name: "Группа триатлон", trainer: "Дмитрий Мелях", photo: UIImage(resource: .meljah1), sport: "Велоспорт, бег", days: "Вторник, пятница", place: "Минск арена"), ScheduleModel(name: "Группа плавания", trainer: "Дмитрий Коптур", photo: UIImage(resource: .coptur1), sport: "Плавание", days: "Вторник, суббота", place: "Бассейн БГУФК"), ScheduleModel(name: "Группа триатлон", trainer: "Дмитрий Толкачев", photo: UIImage(resource: .tolkachev1), sport: "Триатлон", days: "Понедельник, пятница", place: "Tristyle"), ScheduleModel(name: "Группа бег", trainer: "Алексей Адамович", photo: UIImage(resource: .adamovich1), sport: "Бег", days: "Среда, пятница", place: "Калиновского")]

// MARK: - SHOP:

// CLOTHES:
let clothesArray: [ProductModel] = [
    ProductModel(name: "Майка Repeat", description: """
                 - Приталенный силуэт
                 - Принт шелкография

                 СОСТАВ И УХОД:
                 92% хлопок, 8% эластан

                 - Бережная машинная стирка на изнаночной стороне при температуре 30 градусов.
                 - Не отбеливать
                 - Не использовать агрессивные моющие средства
                 - Утюжка с изнаночной стороны (при наличии принта)

                 Произведено в Республике Беларусь.
                 По типу продукта: Майки
                 """,
                 price: "35 BYN",
                 link: "https://tristyleshop.by/sales/tproduct/162692404-463203246798-maika-repeat-muzhskaya",
                 photo: .tshirtRepeatMan),
    ProductModel(name: "Худи Age Group", description: """
                 Свободный силуэт

                 - Спущенная линия плеча
                 - Расширенный капюшон
                 - Два боковых кармана
                 - Рукава с вырезами для большого пальца
                 - Манжет по низу и рукаву

                 СОСТАВ И УХОД:
                 80% хлопок, 20% полиэстер

                 -бережная машинная стирка на изнаночной стороне при температуре 30 градусов.
                 -не отбеливать
                 -не использовать агрессивные моющие средства
                 -утюжка с изнаночной стороны (при наличии принта)

                 Произведено в Республике Беларусь.
                 По типу продукта: Худи
                 """,
                 price: "70 BYN",
                 link: "https://tristyleshop.by/sales/tproduct/162692404-149769668430-hudi-age-group-zhenskaya",
                 photo: .hoodieAgeGroupWoman),
    ProductModel(name: "Майка Female Triathlete",
                 description: """
                 - Приталенный силуэт
                 - Принт шелкография

                 СОСТАВ И УХОД:
                 92% хлопок, 8% эластан

                 -бережная машинная стирка на изнаночной стороне при температуре 30 градусов.
                 -не отбеливать
                 -не использовать агрессивные моющие средства
                 -утюжка с изнаночной стороны (при наличии принта)

                 Произведено в Республике Беларусь.
                 По типу продукта: Майки
                 """,
                 price: "35 BYN",
                 link: "https://tristyleshop.by/sales/tproduct/162692404-793756860850-maika-female-triathlete-zhenskaya",
                 photo: .tshirtTriathleteWoman)
]

// MARK: - CLUB CARD:

// PARTNER:
let partnerDiscountArray: [DiscountModel] = [DiscountModel(name: "Tristyle.Shop",
                                                           description: "Интернет-магазин спортивной одежды и аксессуаров для велоспорта, триатлона и бега.",
                                                           percent: "10%",
                                                           web: "https://instagram.com/ccnsport_belarus",
                                                           contact: nil),
                                             DiscountModel(name: "Garmin",
                                                           description: "На весь ассортимент товаров Garmin.",
                                                           percent: "7%",
                                                           web: "https://garmin.by",
                                                           contact: nil),
                                             DiscountModel(name: "On-bike.by",
                                                           description: "Скидка 5% на аксессуары, велосипеды, экипировку, запчасти и 10% велосервис/прокат.\nСкидки распространяются и на заказ онлайн (промокод «TRISTYLE24»).",
                                                           percent: "5-10%",
                                                           web: "https://docs.google.com/document/d/1GXdUkuZMFPzfz87Ianvo9tFnyvNTti8n/edit",
                                                           contact: nil),
                                             DiscountModel(name: "Bonifique",
                                                           description: "Скидка на товары Bonifique Store (одежда, мерч, рюкзаки, аксессуары).",
                                                           percent: "5%",
                                                           web: "https://bonifique.store",
                                                           contact: nil),
                                             DiscountModel(name: "Beurer",
                                                           description: "Скидка 10% на все немедицинские товары и 7% на медицинские товары.По промокоду: tristyle.",
                                                           percent: "7-10%",
                                                           web: "https://beurer-belarus.by",
                                                           contact: nil),
                                             DiscountModel(name: "F1 картинг",
                                                           description: "Скидка10% на катание и на корпоративные мероприятия для членов клуба Tristyle.",
                                                           percent: "10%",
                                                           web: "https://karting-club.by",
                                                           contact: nil),
                                             DiscountModel(name: "Водные прогулки",
                                                           description: "Скидка 10% на катание и на корпоративные мероприятия для членов клуба Tristyle.",
                                                           percent: "10%",
                                                           web: "https://teplohod.by",
                                                           contact: nil),
                                             DiscountModel(name: "F1 каток на Немиге",
                                                           description: "Скидка 10% на катание для членов клуба Tristyle.",
                                                           percent: "10%",
                                                           web: "https://f1katok.by",
                                                           contact: nil),
                                             DiscountModel(name: "DragonBike",
                                                           description: "Крупнейший магазин в Минске велоаксессуаров и велоэкипировки.\nСкидка на весь ассортимент товаров.",
                                                           percent: "10%",
                                                           web: "https://dragonbike.by",
                                                           contact: nil),
                                             DiscountModel(name: "Proswim.by",
                                                           description: "Экипировка и инвентарь для плавания.\nСкидка 5% на весь ассортимент товаров. При разовой покупке от 5 единиц — скидка 10%.",
                                                           percent: "5-10%",
                                                           web: "https://proswim.by",
                                                           contact: nil),
                                             DiscountModel(name: "SwimStore",
                                                           description: "Экипировка и инвентарь для плавания.\nСкидка на всю продукцию.",
                                                           percent: "10%",
                                                           web: "",
                                                           contact: nil),
                                             DiscountModel(name: "MetaRun",
                                                           description: "Магазин спортивной и беговой экипировки.",
                                                           percent: "15%",
                                                           web: "https://metarun.by",
                                                           contact: nil),
                                             DiscountModel(name: "Anaerobe",
                                                           description: "Обслуживание велосипедов, спортивное питание.\nСкидка 10% на велосервис, компоненты и аксессуары; 5% на спортивное питание SIS и GEL4U.",
                                                           percent: "5-10%",
                                                           web: "https://www.instagram.com/anaerobe.service",
                                                           contact: nil),
                                             DiscountModel(name: "Travers",
                                                           description: "Один из крупнейших магазинов туристической и беговой экипировки.",
                                                           percent: "10%",
                                                           web: "https://travers.by",
                                                           contact: nil),
                                             DiscountModel(name: "Ortos",
                                                           description: "Сеть ортопедических салонов по всей Беларуси с производством индивидуальных стелек и множеством другой продукции этого направления.\nВажно! Перед походом в салон обязательно возьмите у тренеров «Карту VIP-клиента», по которой и будет начислена скидка.",
                                                           percent: "10%",
                                                           web: "https://ortos.by",
                                                           contact: nil),
                                             DiscountModel(name: "МЦ «Спайнмед»",
                                                           description: "Клиника восстановительной неврологии и реабилитации.",
                                                           percent: "10%",
                                                           web: "https://spinemed.by",
                                                           contact: nil),
                                             DiscountModel(name: "Империя спорта",
                                                           description: "Сеть магазинов плавательной экипировки.",
                                                           percent: "10%",
                                                           web: "https://imperiasporta.by",
                                                           contact: nil),
                                             DiscountModel(name: "Arena",
                                                           description: "Сеть магазинов плавательного бренда «Arena».",
                                                           percent: "5%",
                                                           web: "https://arena.by",
                                                           contact: nil),
                                             DiscountModel(name: "SportStar",
                                                           description: "Сеть магазинов дилера плавательной экипировки «MadWave».",
                                                           percent: "10%",
                                                           web: "https://sportstar.by",
                                                           contact: nil),
                                             DiscountModel(name: "МЦ «Томография»",
                                                           description: "Медицинский центр с самым современным оборудованием для МРТ в Минске.\nРаспространяется на филиалы по адресам: ул.Жилуновича, 11А; ул.Революционная, 13.",
                                                           percent: "10%",
                                                           web: "https://mrt.by",
                                                           contact: nil),
                                             DiscountModel(name: "BikeHunter",
                                                           description: "Интернет-магазин аксессуаров для велоспорта.\nСкидка на велозапчасти, аксессуары и экипировку от цен на сайте.",
                                                           percent: "5%",
                                                           web: "https://bikehunter.by",
                                                           contact: nil),
                                             DiscountModel(name: "Планета СПА",
                                                           description: "Термальный комплекс и СПА-процедуры.",
                                                           percent: "10%",
                                                           web: "http://planetaspa.by",
                                                           contact: nil),
                                             DiscountModel(name: "Цветок.бай",
                                                           description: "Цветы и декор.",
                                                           percent: "10%",
                                                           web: "https://cvetok.by",
                                                           contact: nil),
                                             DiscountModel(name: "Golf Park",
                                                           description: "Спортивно-развлекательный центр.",
                                                           percent: "10%",
                                                           web: "http://golfpark.by",
                                                           contact: nil),
                                             DiscountModel(name: "Garfield",
                                                           description: "Интернет-магазин зоотоваров.\nСкидка в размере 1% при покупке товаров на сумму до 80 руб.\nСкидка в размере 5% при покупке товаров на сумму от 80 руб.",
                                                           percent: "1-5%",
                                                           web: "https://garfield.by/.",
                                                           contact: nil),
                                             DiscountModel(name: "Twins Special",
                                                           description: "Магазин спортивной экипировки.",
                                                           percent: "15%",
                                                           web: "https://twins.by",
                                                           contact: nil),
                                             DiscountModel(name: "ActiveLife",
                                                           description: "Сплавы на байдарках по всей Беларуси.\nСкидка на весь ассортимент, а также на участие в сплавах.",
                                                           percent: "10%",
                                                           web: "http://www.sport-life.by",
                                                           contact: nil),
                                             DiscountModel(name: "Пенальти",
                                                           description: "Магазин футбольной экипировки.",
                                                           percent: "10%",
                                                           web: "https://penalty.by",
                                                           contact: nil),
                                             DiscountModel(name: "Mediort",
                                                           description: "Скидка 10% на CEP, на остальные группы товаров 5%. Ортопедический салон medi (Куйбышева, 46).",
                                                           percent: "5-10%",
                                                           web: "https://mediort.by",
                                                           contact: nil),
                                             DiscountModel(name: "THULE",
                                                           description: "Скидка на автомобильные велокрепления, велочемоданы и другую продукцию Thule. 2 магазина в Минске.",
                                                           percent: "10%",
                                                           web: "https://xmedia.by",
                                                           contact: nil),
                                             DiscountModel(name: "Proffi Bike",
                                                           description: "Велосервис и магазин. Скидка 30% на услуги и 15% на запчасти при предъявлении клубной карты.",
                                                           percent: "15-30%",
                                                           web: "https://proffibike.by/",
                                                           contact: nil)]

// MUTUAL:
let mutualDiscountArray: [DiscountModel] = [DiscountModel(name: "John Galt Studio",
                                                          description: "Создание роботов, которые заменяют или дополняют сотрудников, выполняющих рутинные процессы за компьютером, на их рабочих местах.",
                                                          percent: "10%",
                                                          web: "https://johngalt.tech",
                                                          contact: "Захар Плодунов"),
                                            DiscountModel(name: "SHELBY",
                                                          description: "Скидка на все услуги по клубной карте, или по кобрендиновой SHELBY-Tristyle (лежат на ресепшене в Tristyle.Студии).",
                                                          percent: "10%",
                                                          web: "https://oldboybarbershop.by",
                                                          contact: "Александр Евстафьев"),
                                            DiscountModel(name: "СТО Tiptronik",
                                                          description: "Скидка 10% на замену масла, от 5 до 10% на ремонт коробки автомат.",
                                                          percent: "5-10%",
                                                          web: "https://tiptronik.by",
                                                          contact: "Виталий Бабич"),
                                            DiscountModel(name: "СТО MasterCar",
                                                          description: "Скидка на все услуги СТО.",
                                                          percent: "10%",
                                                          web: "https://mastercar.by",
                                                          contact: "Денис Байкевич"),
                                            DiscountModel(name: "Openini",
                                                          description: "Паркетная доска, виниловые полы, межкомнатные двери от европейских производителей.",
                                                          percent: "10%",
                                                          web: "https://openini.by",
                                                          contact: "Андрей Аноп"),
                                            DiscountModel(name: "Kinder Ball",
                                                          description: "Детский футбольный клуб для дошкольников.\nСкидка на 9-месячный абонемент.",
                                                          percent: "7%",
                                                          web: "https://kinderball.by",
                                                          contact: "Александр Синяк"),
                                            DiscountModel(name: "Praktika",
                                                          description: "Выстраивание и обучение отдела продаж.",
                                                          percent: "20%",
                                                          web: "http://praktika24.by",
                                                          contact: "Андрей Карпенко"),
                                            DiscountModel(name: "ТермоСистемы",
                                                          description: "Климатическое оборудование. Официальный дистрибьютор Cooper&Hunter в Беларуси.",
                                                          percent: "10%",
                                                          web: "Климатическое оборудование. Официальный дистрибьютор Cooper&Hunter в Беларуси.",
                                                          contact: "Дмитрий Гацко"),
                                            DiscountModel(name: "Медицинский массаж",
                                                          description: "Скидка на весь перечень услуг.",
                                                          percent: "10%",
                                                          web: "https://medmassazh.by",
                                                          contact: "Владимир Леончик"),
                                            DiscountModel(name: "MXAUTO",
                                                          description: "Скидка на все услуги.",
                                                          percent: "10%",
                                                          web: "http://www.mxauto.by",
                                                          contact: "Сергей Мунтян"),
                                            DiscountModel(name: "AKSTENT",
                                                          description: "Аренда и продажа тентовых конструкций и шатров. Скидка на все услуги.",
                                                          percent: "20%",
                                                          web: "https://akstent.com",
                                                          contact: "Андрей Коротенко"),
                                            DiscountModel(name: "NOVATION",
                                                          description: "Услуги по охране труда, лабораторные измерения. Скидка на все услуги в Беларуси и Минске.",
                                                          percent: "10%",
                                                          web: "http://www.novation.by",
                                                          contact: "Александр Тылиндус")]
