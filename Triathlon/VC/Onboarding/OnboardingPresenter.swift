import AVFoundation
import UIKit

// MARK: - PROTOCOL:

protocol OnboardingPresenterProtocol {
    func startVideo()
    func continueButtonTapped()
}

final class OnboardingPresenter: NSObject, OnboardingPresenterProtocol {
    // MARK: - PROPERTIES:

    unowned let view: OnboardingVC
    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?

    // MARK: - INIT:

    init(view: OnboardingVC) {
        self.view = view
    }

    // MARK: - METHODS:

    // START VIDEO:
    func startVideo() {
        guard let videoURL = Bundle.main.url(forResource: "Video", withExtension: "mp4") else { return }
        let player = AVPlayer(url: videoURL)
        self.player = player
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        view.view.layer.insertSublayer(playerLayer, at: 0)
        self.playerLayer = playerLayer
        player.currentItem?.addObserver(self, forKeyPath: "status", options: .new, context: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: .AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        player.play()
    }

    // REPEAT VIDEO:
    @objc private func playerDidFinishPlaying() {
        player?.seek(to: .zero)
        player?.play()
    }

    // OBSERVER:
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status", let playerItem = object as? AVPlayerItem {
            if playerItem.status == .readyToPlay {
            } else if playerItem.status == .failed {}
        }
    }

    deinit {
        player?.currentItem?.removeObserver(self, forKeyPath: "status")
        NotificationCenter.default.removeObserver(self, name: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
    }

    // CONTINUE BUTTON TAPPED:
    func continueButtonTapped() {
        let tabBarController = TabBarController()
        player?.pause()
        view.navigationController?.setViewControllers([tabBarController], animated: true)
    }
}
