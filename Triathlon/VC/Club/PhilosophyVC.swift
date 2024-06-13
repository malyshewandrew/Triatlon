import UIKit

final class PhilosophyVC: UIViewController {
    // MARK: - PROPERTIES:

    private let scrollView = UIScrollView()
    private let topTitleLabel = UILabel()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let ruleOneTitleLabel = UILabel()
    private let ruleOneDescriptionLabel = UILabel()
    private let ruleTwoTitleLabel = UILabel()
    private let ruleTwoDescriptionLabel = UILabel()
    private let ruleThreeTitleLabel = UILabel()
    private let ruleThreeDescriptionLabel = UILabel()
    private let ruleFourTitleLabel = UILabel()
    private let ruleFourDescriptionLabel = UILabel()
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(scrollView)
        scrollView.addSubviews(topTitleLabel, titleLabel, descriptionLabel, ruleOneTitleLabel, ruleOneDescriptionLabel, ruleTwoTitleLabel, ruleTwoDescriptionLabel, ruleThreeTitleLabel, ruleThreeDescriptionLabel, ruleFourTitleLabel, ruleFourDescriptionLabel)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // SCROLL VIEW:
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // TOP TITLE:
        topTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        topTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topTitleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 25).isActive = true
        topTitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        
        // TITLE LABEL:
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topTitleLabel.bottomAnchor, constant: 25).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        
        // DESCRIPTION LABEL:
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        // RULE ONE TITLE:
        ruleOneTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ruleOneTitleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50).isActive = true
        ruleOneTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ruleOneTitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        // RULE ONE DESCRIPTION:
        ruleOneDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        ruleOneDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ruleOneDescriptionLabel.topAnchor.constraint(equalTo: ruleOneTitleLabel.bottomAnchor, constant: 25).isActive = true
        ruleOneDescriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        // RULE TWO TITLE:
        ruleTwoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ruleTwoTitleLabel.topAnchor.constraint(equalTo: ruleOneDescriptionLabel.bottomAnchor, constant: 50).isActive = true
        ruleTwoTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ruleTwoTitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        // RULE TWO DESCRIPTION:
        ruleTwoDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        ruleTwoDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ruleTwoDescriptionLabel.topAnchor.constraint(equalTo: ruleTwoTitleLabel.bottomAnchor, constant: 25).isActive = true
        ruleTwoDescriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        // RULE THREE TITLE:
        ruleThreeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ruleThreeTitleLabel.topAnchor.constraint(equalTo: ruleTwoDescriptionLabel.bottomAnchor, constant: 50).isActive = true
        ruleThreeTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ruleThreeTitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        // RULE THREE DESCRIPTION:
        ruleThreeDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        ruleThreeDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ruleThreeDescriptionLabel.topAnchor.constraint(equalTo: ruleThreeTitleLabel.bottomAnchor, constant: 25).isActive = true
        ruleThreeDescriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        // RULE FOUR TITLE:
        ruleFourTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ruleFourTitleLabel.topAnchor.constraint(equalTo: ruleThreeDescriptionLabel.bottomAnchor, constant: 50).isActive = true
        ruleFourTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ruleFourTitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        // RULE FOUR DESCRIPTION:
        ruleFourDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        ruleFourDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ruleFourDescriptionLabel.topAnchor.constraint(equalTo: ruleFourTitleLabel.bottomAnchor, constant: 25).isActive = true
        ruleFourDescriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // VIEW:
        view.backgroundColor = .colorMain
        
        // SCROLL VIEW:
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * 1.7)
        scrollView.isScrollEnabled = true
        
        // TOP TITLE:
        topTitleLabel.text = "Tristyle - это не только спорт\nЭто философия и команда"
        topTitleLabel.textColor = .white
        topTitleLabel.numberOfLines = 0
        topTitleLabel.textAlignment = .center
        topTitleLabel.font = fontMediumStandard14
        
        // TITLE LABEL:
        titleLabel.text = "Понимать идею и не бояться"
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = fontBoldStandard32
        
        // DESCRIPTION LABEL:
        descriptionLabel.text = "Триатлон в Беларуси и СНГ пока только зарождается. Многие тренируются по схемам, которые по-определению не работают. Травмы, отсутствие роста результатов, угнетенность от напрасных тренировок – спорт не должен быть таким, он не должен быть в тягость или потому что «надо».\n\nКогда создавали «Тристайл» — начинали с философии клуба. У нас нет задачи сделать 1000 Ironman’ов. Мы не будем ставить «рекорды» обучения, выпуская на старт неподготовленных учеников и травмируя их, как это сейчас модно."
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = fontMediumLight14
        
        // RULE ONE TITLE:
        ruleOneTitleLabel.text = "TRISTYLE – ЭТО ФИЛОСОФИЯ ПРАВИЛЬНОГО СПОРТА"
        ruleOneTitleLabel.textColor = .white
        ruleOneTitleLabel.numberOfLines = 0
        ruleOneTitleLabel.textAlignment = .center
        ruleOneTitleLabel.font = fontBoldStandard32
        
        // RULE ONE DESCRIPTION:
        ruleOneDescriptionLabel.text = "Культура тренировок и здоровой жизни. Осознание логики построения тренировочного процесса, полный контроль всех систем организма, медицина, понимание собственного тела и ощущений, правильное питание, отслеживание восстановления после нагрузок и многое другое."
        ruleOneDescriptionLabel.textColor = .white
        ruleOneDescriptionLabel.numberOfLines = 0
        ruleOneDescriptionLabel.textAlignment = .center
        ruleOneDescriptionLabel.font = fontMediumLight14
        
        // RULE TWO TITLE:
        ruleTwoTitleLabel.text = "TRISTYLE - ЭТО КОМАНДА ЕДИНОМЫШЛЕННИКОВ"
        ruleTwoTitleLabel.textColor = .white
        ruleTwoTitleLabel.numberOfLines = 0
        ruleTwoTitleLabel.textAlignment = .center
        ruleTwoTitleLabel.font = fontBoldStandard32
        
        // RULE TWO DESCRIPTION:
        ruleTwoDescriptionLabel.text = "Мы не участвуем бездумно во всех стартах подряд. Совместно с тренером долгосрочно планируем, ставим невероятные цели и хладнокровно их добиваемся. В перспективе – командные велогонки, участие в горных и пустынных трейлах, марафонские заплывы в открытой воде. Всё это, конечно, совмещенное с путешествиями и отдыхом. Поддержка и взаимовыручка – основа нашей задумки."
        ruleTwoDescriptionLabel.textColor = .white
        ruleTwoDescriptionLabel.numberOfLines = 0
        ruleTwoDescriptionLabel.textAlignment = .center
        ruleTwoDescriptionLabel.font = fontMediumLight14
        
        // RULE THREE TITLE:
        ruleThreeTitleLabel.text = "TRISTYLE - ЗА ИНТЕЛЛЕКТУАЛЬНЫЙ СПОРТ"
        ruleThreeTitleLabel.textColor = .white
        ruleThreeTitleLabel.numberOfLines = 0
        ruleThreeTitleLabel.textAlignment = .center
        ruleThreeTitleLabel.font = fontBoldStandard32
        
        // RULE THREE DESCRIPTION:
        ruleThreeDescriptionLabel.text = "Никаких бездумных решений. Медицина, взвешенное понимание к чему стремишься, зачем оно нужно, и планомерное достижение задуманного без форсирования и спешки. Здоровье всегда на первом плане. Только так."
        ruleThreeDescriptionLabel.textColor = .white
        ruleThreeDescriptionLabel.numberOfLines = 0
        ruleThreeDescriptionLabel.textAlignment = .center
        ruleThreeDescriptionLabel.font = fontMediumLight14
        
        // RULE FOUR TITLE:
        ruleFourTitleLabel.text = "TRISTYLE - ПРИМЕР ДЛЯ ДЕТЕЙ"
        ruleFourTitleLabel.textColor = .white
        ruleFourTitleLabel.numberOfLines = 0
        ruleFourTitleLabel.textAlignment = .center
        ruleFourTitleLabel.font = fontBoldStandard32
        
        // RULE FOUR DESCRIPTION:
        ruleFourDescriptionLabel.text = "Лучший подход в воспитании – собственный пример. И наши многодетные спортсмены это доказывают ежедневно. IronKids, детские этапы на Tristyle Minsk Triathlon и, конечно, личная мотивация от родителей на каждом семейном выезде!"
        ruleFourDescriptionLabel.textColor = .white
        ruleFourDescriptionLabel.numberOfLines = 0
        ruleFourDescriptionLabel.textAlignment = .center
        ruleFourDescriptionLabel.font = fontMediumLight14
    }
    
    // MARK: - HELPERS:
}

// MARK: - EXTENSIONS:
