import UIKit

final class Vibration {
    let vibrationNotification = UINotificationFeedbackGenerator()
    let vibrationSelectionFeedbackGenerator = UISelectionFeedbackGenerator()
    let vibrationSmall = UIImpactFeedbackGenerator(style: .light)
    let vibrationMedium = UIImpactFeedbackGenerator(style: .medium)
    let vibrationImpactFeedbackGeneratorSpeed = UIImpactFeedbackGenerator(style: .rigid)

    func vibrationSucces() {
        self.vibrationNotification.notificationOccurred(.success)
    }

    func vibrationError() {
        self.vibrationNotification.notificationOccurred(.error)
    }
    
    func vibrationSelection() {
        self.vibrationSelectionFeedbackGenerator.prepare()
        self.vibrationSelectionFeedbackGenerator.selectionChanged()
    }
    
    func vibrationLight() {
        self.vibrationSmall.prepare()
        self.vibrationSmall.impactOccurred()
    }
    
    func vibrationStandart() {
        self.vibrationMedium.prepare()
        self.vibrationMedium.impactOccurred()
    }
}
