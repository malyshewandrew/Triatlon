import UIKit

// MARK: - PEOPLES:

// TRAINERS
let trainerArray: [HumanModel] = [
    HumanModel(photo: [UIImage(resource: .meljah1), UIImage(resource: .meljah2), UIImage(resource: .meljah3), UIImage(resource: .meljah4), UIImage(resource: .meljah5)], name: "Дмитрий Мелях", country: "🇧🇾", achievements: """
- 3-кратный участник Олимпийских Игр
- 2-кратный чемпион мира (по современному пятиборью)
- Победитель этапа Кубка мира
- Чемпион Европы
- Тринадцатикратный чемпион РБ
- Заслуженный мастер спорта Республики Беларусь (высшая спортивная награда страны)
- Старший тренер национальной команды
""", work: "Тренер по триатлону", url: "https://google.com")
]

// TEAM:
let teamArray: [HumanModel] = [
    HumanModel(photo: [UIImage(resource: .meljah1)], name: "Имя Фамилия", country: "🇧🇾", achievements: """
    - Финишер соревнований
    - Участник игр
    - Заслуженный мастер спорта
    - Обладатель кубка
    - Обладатель кубка
    - Кандидат в мастера спорта
    """, work: "Tristyle Team", url: "https://google.com")
]

// MARK: - GROUPS:

let arrayGroups: [ScheduleModel] = [ScheduleModel(name: "Группа триатлон", trainer: "Дмитрий Мелях", photo: UIImage(resource: .meljah1), sport: "Велоспорт, бег", days: "Вторник, пятница", place: "Минск арена"), ScheduleModel(name: "Группа плавания", trainer: "Дмитрий Коптур", photo: UIImage(resource: .coptur), sport: "Плавание", days: "Вторник, суббота", place: "Бассейн БГУФК"), ScheduleModel(name: "Группа триатлон", trainer: "Дмитрий Толкачев", photo: UIImage(resource: .tolkachev), sport: "Триатлон", days: "Понедельник, пятница", place: "Tristyle"), ScheduleModel(name: "Группа бег", trainer: "Алексей Адамович", photo: UIImage(resource: .adamovich), sport: "Бег", days: "Среда, пятница", place: "Калиновского")]

// MARK: - SHOP:

// CLOTHES:
let clothesArray: [ProductModel] = [
    ProductModel(name: "Майка Repeat", description: "- Приталенный силуэт\n- Принт шелкография", price: "35 BYN", link: "https://tristyleshop.by/sales/tproduct/162692404-463203246798-maika-repeat-muzhskaya", photo: .tshirt),
    ProductModel(name: "Худи Age Group", description: "- Спущенная линия плеча\n- Расширенный капюшон\n- Два боковых кармана\n - Рукава с вырезами для большого пальца\n - Манжет по низу и рукаву", price: "70 BYN", link: "https://tristyleshop.by/sales/tproduct/162692404-149769668430-hudi-age-group-zhenskaya", photo: .hoodie),
    ProductModel(name: "Майка Female Triathlete", description: "- Приталенный силуэт\n- Принт шелкография", price: "35 BYN", link: "https://tristyleshop.by/sales/tproduct/162692404-793756860850-maika-female-triathlete-zhenskaya", photo: .tshirtFemaleTriathlete)
]
