import Lottie
import UIKit
import FirebaseAuth
import FirebaseFirestore

// MARK: - PROTOCOL:

protocol ClubCardVCProtocol: AnyObject {
    func showPartnerTableView()
    func hidePartnerTableView()
}

final class ClubCardVC: UIViewController {
    // MARK: - PROPERTIES:

    var presenter: ClubCardPresenterProtocol!
    private let backgroundImage = UIImageView()
    private let titleLabel = UILabel()
    private let cardsContainerView = UIView()
    private let clubCardOneView = UIView()
    private let clubCardOneLottie = LottieAnimationView(name: "ClubCardOneLottie")
    private let clubCardOneImage = UIImageView()
    private let clubCardOneTitleLabel = UILabel()
    private let clubCardButton = UIButton(type: .system)
    private let clubCardTwoView = UIView()
    private let clubCardTwoLottie = LottieAnimationView(name: "ClubCardTwoLottie")
    private let clubCardTwoImage = UIImageView()
    private let clubCardTwoNameLabel = UILabel()
    private var segmentedControl = UISegmentedControl()
    private let partnerTableView = UITableView()
    private let mutualTableView = UITableView()
    private let vibration = Vibration()
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(backgroundImage, titleLabel, cardsContainerView, segmentedControl, partnerTableView, mutualTableView)
        cardsContainerView.addSubviews(clubCardTwoView, clubCardOneView, clubCardButton)
        clubCardOneView.addSubviews(clubCardOneLottie, clubCardOneImage, clubCardOneTitleLabel)
        clubCardTwoView.addSubviews(clubCardTwoLottie, clubCardTwoImage, clubCardTwoNameLabel)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        // BACKGROUND VIEW:
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // TITLE LABEL:
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 25).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        // CLUB CARDS CONTAINER VIEW:
        cardsContainerView.translatesAutoresizingMaskIntoConstraints = false
        cardsContainerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25).isActive = true
        cardsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cardsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        cardsContainerView.heightAnchor.constraint(equalTo: cardsContainerView.widthAnchor, multiplier: 0.5).isActive = true
        
        // CLUB CARD ONE VIEW:
        clubCardOneView.translatesAutoresizingMaskIntoConstraints = false
        clubCardOneView.topAnchor.constraint(equalTo: cardsContainerView.topAnchor).isActive = true
        clubCardOneView.bottomAnchor.constraint(equalTo: cardsContainerView.bottomAnchor).isActive = true
        clubCardOneView.leadingAnchor.constraint(equalTo: cardsContainerView.leadingAnchor).isActive = true
        clubCardOneView.trailingAnchor.constraint(equalTo: cardsContainerView.trailingAnchor).isActive = true
        
        // CLUB CARD ONE LOTTIE:
        clubCardOneLottie.translatesAutoresizingMaskIntoConstraints = false
        clubCardOneLottie.topAnchor.constraint(equalTo: clubCardOneView.topAnchor).isActive = true
        clubCardOneLottie.bottomAnchor.constraint(equalTo: clubCardOneView.bottomAnchor).isActive = true
        clubCardOneLottie.leadingAnchor.constraint(equalTo: clubCardOneView.leadingAnchor).isActive = true
        clubCardOneLottie.trailingAnchor.constraint(equalTo: clubCardOneView.trailingAnchor).isActive = true
        
        // CLUB CARD ONE IMAGE:
        clubCardOneImage.translatesAutoresizingMaskIntoConstraints = false
        clubCardOneImage.centerXAnchor.constraint(equalTo: clubCardOneView.centerXAnchor).isActive = true
        clubCardOneImage.centerYAnchor.constraint(equalTo: clubCardOneView.centerYAnchor).isActive = true
        clubCardOneImage.widthAnchor.constraint(equalTo: clubCardOneView.widthAnchor, multiplier: 0.8).isActive = true
        clubCardOneImage.heightAnchor.constraint(equalTo: clubCardOneImage.widthAnchor, multiplier: 0.35).isActive = true
        
        // CLUB CARD ONE TITLE LABEL:
        clubCardOneTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        clubCardOneTitleLabel.centerXAnchor.constraint(equalTo: clubCardOneView.centerXAnchor).isActive = true
        clubCardOneTitleLabel.bottomAnchor.constraint(equalTo: clubCardOneView.bottomAnchor, constant: -50).isActive = true
        
        // CLUB CARD BUTTON:
        clubCardButton.translatesAutoresizingMaskIntoConstraints = false
        clubCardButton.topAnchor.constraint(equalTo: clubCardOneView.topAnchor).isActive = true
        clubCardButton.bottomAnchor.constraint(equalTo: clubCardOneView.bottomAnchor).isActive = true
        clubCardButton.leadingAnchor.constraint(equalTo: clubCardOneView.leadingAnchor).isActive = true
        clubCardButton.trailingAnchor.constraint(equalTo: clubCardOneView.trailingAnchor).isActive = true
        
        // CLUB CARD TWO VIEW:
        clubCardTwoView.translatesAutoresizingMaskIntoConstraints = false
        clubCardTwoView.topAnchor.constraint(equalTo: cardsContainerView.topAnchor).isActive = true
        clubCardTwoView.bottomAnchor.constraint(equalTo: cardsContainerView.bottomAnchor).isActive = true
        clubCardTwoView.leadingAnchor.constraint(equalTo: cardsContainerView.leadingAnchor).isActive = true
        clubCardTwoView.trailingAnchor.constraint(equalTo: cardsContainerView.trailingAnchor).isActive = true
        
        // CLUB CARD TWO LOTTIE:
        clubCardTwoLottie.translatesAutoresizingMaskIntoConstraints = false
        clubCardTwoLottie.topAnchor.constraint(equalTo: clubCardTwoView.topAnchor).isActive = true
        clubCardTwoLottie.bottomAnchor.constraint(equalTo: clubCardTwoView.bottomAnchor).isActive = true
        clubCardTwoLottie.leadingAnchor.constraint(equalTo: clubCardTwoView.leadingAnchor).isActive = true
        clubCardTwoLottie.trailingAnchor.constraint(equalTo: clubCardTwoView.trailingAnchor).isActive = true
        
        // CLUB CARD TWO IMAGE VIEW:
        clubCardTwoImage.translatesAutoresizingMaskIntoConstraints = false
        clubCardTwoImage.centerXAnchor.constraint(equalTo: clubCardTwoView.centerXAnchor).isActive = true
        clubCardTwoImage.centerYAnchor.constraint(equalTo: clubCardTwoView.centerYAnchor).isActive = true
        clubCardTwoImage.widthAnchor.constraint(equalTo: clubCardTwoView.widthAnchor, multiplier: 0.3).isActive = true
        clubCardTwoImage.heightAnchor.constraint(equalTo: clubCardTwoView.widthAnchor, multiplier: 1).isActive = true
        
        // CLUB CARD TWO NAME LABEL:
        clubCardTwoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        clubCardTwoNameLabel.bottomAnchor.constraint(equalTo: clubCardTwoView.bottomAnchor, constant: -10).isActive = true
        clubCardTwoNameLabel.leadingAnchor.constraint(equalTo: clubCardTwoView.leadingAnchor, constant: 15).isActive = true
        
        // SEGMENTED CONTROL:
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: clubCardOneView.bottomAnchor, constant: 25).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        
        // PARTNER TABLE VIEW:
        partnerTableView.translatesAutoresizingMaskIntoConstraints = false
        partnerTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 5).isActive = true
        partnerTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        partnerTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        partnerTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // MUTUAL TABLE VIEW:
        mutualTableView.translatesAutoresizingMaskIntoConstraints = false
        mutualTableView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 15).isActive = true
        mutualTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mutualTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        mutualTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // BACKGROUND VIEW:
        backgroundImage.image = UIImage(resource: .background)
        
        // TITLE LABEL:
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.font = fontLightStandard10
        titleLabel.text = "Благодаря спонсорам и партнёрам клуба мы создаём лучшие условия для наших спортсменов, поддерживаем профессиональный состав Tristyle, проводим старты и инвестируем в научную составляющую триатлона."
        
        // CLUB CARD VIEW:
        clubCardOneView.backgroundColor = .systemBlue
        clubCardOneView.layer.masksToBounds = true
        clubCardOneView.layer.cornerRadius = cornerRadius
        
        // CLUB CARD LOTTIE:
        clubCardOneLottie.play()
        clubCardOneLottie.loopMode = .loop
        clubCardOneLottie.contentMode = .scaleAspectFill
        clubCardOneLottie.layer.opacity = 0.8
        
        // CLUB CARD IMAGE:
        clubCardOneImage.image = UIImage(resource: .clubCard)
        clubCardOneImage.contentMode = .scaleAspectFill
        clubCardOneImage.layer.shadowRadius = 25
        clubCardOneImage.layer.shadowColor = UIColor.black.cgColor
        clubCardOneImage.layer.shadowOpacity = 1
        
        // CLUB CARD TITLE LABEL:
        clubCardOneTitleLabel.textColor = .white
        clubCardOneTitleLabel.textAlignment = .center
        clubCardOneTitleLabel.font = fontLightStandard12
        clubCardOneTitleLabel.text = "Клубная карта Tristyle"
        
        // CLUB CARD BUTTOM:
        clubCardButton.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.vibration.vibrationStandart()
            self.presenter.flipCard(oneView: self.clubCardOneView, twoView: self.clubCardTwoView)
            self.getNameForCardTwo()
        }), for: .touchUpInside)
        
        // CLUB CARD TWO VIEW:
        clubCardTwoView.backgroundColor = .red
        clubCardTwoView.backgroundColor = .colorBackground
        clubCardTwoView.layer.cornerRadius = cornerRadius
        clubCardTwoView.layer.masksToBounds = true
        
        // CLUB CARD TWO LOTTIE:
        clubCardTwoLottie.play()
        clubCardTwoLottie.loopMode = .loop
        clubCardTwoLottie.contentMode = .scaleAspectFill
        clubCardTwoLottie.animationSpeed = 0.2
        
        // CLUB CARD TWO IMAGE VIEW:
        clubCardTwoImage.image = UIImage(resource: .tristyleLogo)
        clubCardTwoImage.contentMode = .scaleAspectFit
        clubCardTwoImage.layer.shadowRadius = 25
        clubCardTwoImage.layer.shadowColor = UIColor.black.cgColor
        clubCardTwoImage.layer.shadowOpacity = 1
        
        // CLUB CARD TWO NAME LABEL:
        clubCardTwoNameLabel.textColor = .white
        clubCardTwoNameLabel.textAlignment = .center
        clubCardTwoNameLabel.font = .monospacedSystemFont(ofSize: 12, weight: .regular)
        clubCardTwoNameLabel.adjustsFontSizeToFitWidth = true
        
        // SEGMENTED CONTROL
        segmentedControl.backgroundColor = .colorBackground
        segmentedControl.selectedSegmentTintColor = .colorBackground
        let normalTextAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        segmentedControl.setTitleTextAttributes(normalTextAttributes, for: .normal)
        segmentedControl.insertSegment(withTitle: "Скидки партнёров", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Скидки спортсменов", at: 1, animated: true)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
        
        // PARTNER TABLE VIEW:
        partnerTableView.delegate = self
        partnerTableView.dataSource = self
        partnerTableView.separatorStyle = .none
        partnerTableView.backgroundColor = .clear
        partnerTableView.register(PartnerCell.self, forCellReuseIdentifier: "PartnerCell")
        
        // MUTUAL TABLE VIEW:
        mutualTableView.delegate = self
        mutualTableView.dataSource = self
        mutualTableView.separatorStyle = .none
        mutualTableView.backgroundColor = .clear
        mutualTableView.register(MutualCell.self, forCellReuseIdentifier: "MutualCell")
        mutualTableView.isHidden = true
    }
    
    // MARK: - HELPERS:
    
    // SEGMENTED CONTROL VALUE CHANGED:
    @objc private func segmentedControlValueChanged(sender: UISegmentedControl) {
        vibration.vibrationStandart()
        presenter.selectedSegmentControl(sender: sender)
    }
    
    // GET NAME FOR NAME USER:
    func getNameForCardTwo() {
        if let name = UserDefaults.standard.string(forKey: "userName"), !name.isEmpty {
            clubCardTwoNameLabel.text = name.uppercased()
            print("TEXT: \(name)")
        } else {
            clubCardTwoNameLabel.text = "Пользователь не аутентифицирован"
            print("TEXT: Пользователь не аутентифицирован")
        }
    }
}

// MARK: - EXTENSIONS:

// TABLE VIEW:
extension ClubCardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == partnerTableView {
            return partnerDiscountArray.count
        } else if tableView == mutualTableView {
            return mutualDiscountArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == partnerTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PartnerCell", for: indexPath) as? PartnerCell else { return UITableViewCell() }
            let discountPartner = partnerDiscountArray[indexPath.row]
            cell.configure(with: discountPartner)
            cell.backgroundColor = .clear
            cell.presenter = presenter
            return cell
        } else if tableView == mutualTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MutualCell", for: indexPath) as? MutualCell else { return UITableViewCell() }
            let discountMutual = mutualDiscountArray[indexPath.row]
            cell.configure(with: discountMutual)
            cell.backgroundColor = .clear
            cell.presenter = presenter
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        vibration.vibrationStandart()
        if let cell = tableView.cellForRow(at: indexPath) {
            presenter.startBounce(cellView: cell)
        }
    }
}

// PROTOCOL:
extension ClubCardVC: ClubCardVCProtocol {
    // SHOW CLOTHES:
    func showPartnerTableView() {
        partnerTableView.isHidden = false
        mutualTableView.isHidden = true
    }

    // HIDE TABLE VIEW:
    func hidePartnerTableView() {
        partnerTableView.isHidden = true
        mutualTableView.isHidden = false
    }
}
