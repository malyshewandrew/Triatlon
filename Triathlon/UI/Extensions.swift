import UIKit
import CoreImage

// MARK: - ADD SUBVIEWS:

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}

// MARK: - STACKVIEW ADD SUBVIEWS:

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}

// MARK: - BLUR:

extension UIView {
    func addBlurEffect(_ style: UIBlurEffect.Style = .dark) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
}

// MARK: - GRADIENT:

extension UIView {
    func addGradient(colors: [UIColor], startPoint: CGPoint = .init(x: 0.0, y: 0.5), endPoint: CGPoint = .init(x: 1.0, y: 0.5))
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors.map(\.cgColor)
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UIView {
    func applyGradient(colors: [CGColor], startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
