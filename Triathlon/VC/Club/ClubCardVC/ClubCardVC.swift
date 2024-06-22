import Lottie
import UIKit

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
    private let clubCardView = UIView()
    private let clubCardLottie = LottieAnimationView(name: "ClubCardLottie")
    private let clubCardImage = UIImageView()
    private let clubCardTitleLabel = UILabel()
    private let clubCardButtom = UIButton(type: .system)
    private var segmentedControl = UISegmentedControl()
    private let partnerTableView = UITableView()
    private let mutualTableView = UITableView()
    private let vibration = Vibration()
    
    // MARK: - LIFYCYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        view.addSubviews(backgroundImage, titleLabel, clubCardView, segmentedControl, partnerTableView, mutualTableView)
        clubCardView.addSubviews(clubCardLottie, clubCardImage, clubCardTitleLabel, clubCardButtom)
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
        
        // CLUB CARD VIEW:
        clubCardView.translatesAutoresizingMaskIntoConstraints = false
        clubCardView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25).isActive = true
        clubCardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        clubCardView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        clubCardView.heightAnchor.constraint(equalTo: clubCardView.widthAnchor, multiplier: 0.5).isActive = true
        
        // CLUB CARD LOTTIE:
        clubCardLottie.translatesAutoresizingMaskIntoConstraints = false
        clubCardLottie.topAnchor.constraint(equalTo: clubCardView.topAnchor).isActive = true
        clubCardLottie.bottomAnchor.constraint(equalTo: clubCardView.bottomAnchor).isActive = true
        clubCardLottie.leadingAnchor.constraint(equalTo: clubCardView.leadingAnchor).isActive = true
        clubCardLottie.trailingAnchor.constraint(equalTo: clubCardView.trailingAnchor).isActive = true
        
        // CLUB CARD IMAGE:
        clubCardImage.translatesAutoresizingMaskIntoConstraints = false
        clubCardImage.centerXAnchor.constraint(equalTo: clubCardView.centerXAnchor).isActive = true
        clubCardImage.centerYAnchor.constraint(equalTo: clubCardView.centerYAnchor).isActive = true
        clubCardImage.widthAnchor.constraint(equalTo: clubCardView.widthAnchor, multiplier: 0.8).isActive = true
        clubCardImage.heightAnchor.constraint(equalTo: clubCardImage.widthAnchor, multiplier: 0.35).isActive = true
        
        // CLUB CARD TITLE LABEL:
        clubCardTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        clubCardTitleLabel.centerXAnchor.constraint(equalTo: clubCardView.centerXAnchor).isActive = true
        clubCardTitleLabel.bottomAnchor.constraint(equalTo: clubCardView.bottomAnchor, constant: -50).isActive = true
        
        // CLUB CARD BUTTOM:
        clubCardButtom.translatesAutoresizingMaskIntoConstraints = false
        clubCardButtom.topAnchor.constraint(equalTo: clubCardView.topAnchor).isActive = true
        clubCardButtom.bottomAnchor.constraint(equalTo: clubCardView.bottomAnchor).isActive = true
        clubCardButtom.leadingAnchor.constraint(equalTo: clubCardView.leadingAnchor).isActive = true
        clubCardButtom.trailingAnchor.constraint(equalTo: clubCardView.trailingAnchor).isActive = true
        
        // SEGMENTED CONTROL:
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.topAnchor.constraint(equalTo: clubCardView.bottomAnchor, constant: 25).isActive = true
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
        clubCardView.backgroundColor = .systemBlue
        clubCardView.layer.masksToBounds = true
        clubCardView.layer.cornerRadius = cornerRadius
        
        // CLUB CARD LOTTIE:
        clubCardLottie.play()
        clubCardLottie.loopMode = .loop
        clubCardLottie.contentMode = .scaleAspectFill
        clubCardLottie.layer.opacity = 0.8
        
        // CLUB CARD IMAGE:
        clubCardImage.image = UIImage(resource: .clubCard)
        clubCardImage.contentMode = .scaleAspectFill
        clubCardImage.layer.shadowColor = UIColor.white.cgColor
        clubCardImage.layer.shadowRadius = 50
        clubCardImage.layer.shadowOpacity = 0.2
        
        // CLUB CARD TITLE LABEL:
        clubCardTitleLabel.textColor = .white
        clubCardTitleLabel.textAlignment = .center
        clubCardTitleLabel.font = fontLightStandard12
        clubCardTitleLabel.text = "Клубная карта Tristyle"
        
        // CLUB CARD BUTTOM:
        clubCardButtom.addAction(UIAction(handler: { [weak self] _ in
            guard let self = self else { return }
            self.vibration.vibrationStandart()
        }), for: .touchUpInside)
        
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
