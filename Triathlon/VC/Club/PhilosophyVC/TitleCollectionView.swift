import UIKit

final class TitleCollectionView: UICollectionViewCell {
    // MARK: - PROPERTIES:

    private let imageView = UIImageView()
    
    // MARK: - LIFECYCLE:

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        configureConstraints()
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:

    private func configureConstraints() {
        // IMAGE VIEW:
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:

    private func configureUI() {
        
        // IMAGE VIEW:
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    
    // MARK: - HELPERS:
    
    // SET IMAGE:
    func setImage(_ image: UIImage) {
        imageView.image = image
    }
}
