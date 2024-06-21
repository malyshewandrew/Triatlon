import UIKit

// MARK: - PHILOSOPHY:

let philosophyTitleArray: [UIImage] = [UIImage(resource: .philosophyTitle1), UIImage(resource: .philosophyTitle2), UIImage(resource: .philosophyTitle3), UIImage(resource: .philosophyTitle4), UIImage(resource: .philosophyTitle5)]
let philosophyRuleOneArray: [UIImage] = [UIImage(resource: .philosophyRuleOne1), UIImage(resource: .philosophyRuleOne2), UIImage(resource: .philosophyRuleOne3), UIImage(resource: .philosophyRuleOne4), UIImage(resource: .philosophyRuleOne5)]
let philosophyRuleTwoArray: [UIImage] = [UIImage(resource: .philosophyRuleTwo1), UIImage(resource: .philosophyRuleTwo2), UIImage(resource: .philosophyRuleTwo3), UIImage(resource: .philosophyRuleTwo4), UIImage(resource: .philosophyRuleTwo5)]
let philosophyRuleThreeArray: [UIImage] = [UIImage(resource: .philosophyRuleThree1), UIImage(resource: .philosophyRuleThree2), UIImage(resource: .philosophyRuleThree3), UIImage(resource: .philosophyRuleThree4), UIImage(resource: .philosophyRuleThree5)]
let philosophyRuleFourArray: [UIImage] = [UIImage(resource: .philosophyRuleFour1), UIImage(resource: .philosophyRuleFour2), UIImage(resource: .philosophyRuleFour3), UIImage(resource: .philosophyRuleFour4), UIImage(resource: .philosophyRuleFour5)]

// MARK: - PEOPLES:

// TRAINERS
let trainerArray: [HumanModel] = [HumanModel(photo: [UIImage(resource: .tolkachev1), UIImage(resource: .tolkachev2), UIImage(resource: .tolkachev3), UIImage(resource: .tolkachev4), UIImage(resource: .tolkachev5)], name: "Дмитрий Толкачев", country: "🇧🇾", achievements: """
- Основатель и старший тренер Tristyle
- 2009-2016 г.г тренер национальной сборной РБ по триатлону
- Победитель и призер международных соревнований по триатлону и дуатлону (Германия, Польша, Прибалтика)
- 13-кратный победитель чемпионатов РБ
- Мастер спорта (первый мастер спорта среди мужчин по триатлону в РБ)
- Международная судейская категория по триатлону
- Стаж в триатлоне более 30 лет, из них 14 лет – тренерская работа
""", work: "Тренер по триатлону", url: "https://www.instagram.com/tolkachev_1971/"),
HumanModel(photo: [UIImage(resource: .meljah1), UIImage(resource: .meljah2), UIImage(resource: .meljah3), UIImage(resource: .meljah4), UIImage(resource: .meljah5)], name: "Дмитрий Мелях", country: "🇧🇾", achievements: """
- 3-кратный участник Олимпийских Игр
- 2-кратный чемпион мира
  (по современному пятиборью)
- Победитель этапа Кубка мира
- Чемпион Европы
- Тринадцатикратный чемпион РБ
- Заслуженный мастер спорта РБ
- Старший тренер национальной команды
""", work: "Тренер по плаванию", url: "https://www.instagram.com/dzmitry_meliakh/"),
HumanModel(photo: [UIImage(resource: .coptur1), UIImage(resource: .coptur2), UIImage(resource: .coptur3)], name: "Дмитрий Коптур", country: "🇧🇾", achievements: """
- МCМК по плаванию
- Участник Олимпийских Игр в Сиднее
- Победитель и призер этапов кубка мира
- Многократный финалист Чемпионатов мира и Чемпионатов Европы
- Многократный чемпион и рекордсмен на дистанциях 400, 800 и 1500 м. вольным стилем
""", work: "Тренер по плаванию", url: "https://www.instagram.com/dmitriikoptur/")]

// TEAM:
let teamArray: [HumanModel] = []

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
                 Произведено в Республике Беларусь!
                 По типу продукта: Майки
                 """,
                 price: "35 BYN",
                 link: "https://tristyleshop.by/sales/tproduct/162692404-463203246798-maika-repeat-muzhskaya",
                 photo: .tshirt),
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
                 Произведено в Республике Беларусь!
                 По типу продукта: Худи
                 """,
                 price: "70 BYN",
                 link: "https://tristyleshop.by/sales/tproduct/162692404-149769668430-hudi-age-group-zhenskaya",
                 photo: .hoodie),
    ProductModel(name: "Майка Female Triathlete",
                 description: """
                 - Приталенный силуэт
                 - Принт шелкография
                 СОСТАВ И УХОД
                 92% хлопок, 8% эластан
                 -бережная машинная стирка на изнаночной стороне при температуре 30 градусов.
                 -не отбеливать
                 -не использовать агрессивные моющие средства
                 -утюжка с изнаночной стороны (при наличии принта)
                 Произведено в Республике Беларусь!
                 По типу продукта: Майки
                 """,
                 price: "35 BYN",
                 link: "https://tristyleshop.by/sales/tproduct/162692404-793756860850-maika-female-triathlete-zhenskaya",
                 photo: .tshirtFemaleTriathlete)
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
