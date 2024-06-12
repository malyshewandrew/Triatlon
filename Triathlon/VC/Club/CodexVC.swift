import UIKit
import WebKit

final class CodexVC: UIViewController {
    // MARK: - PROPERTIES:
    
    private var webView = WKWebView()
    
    // MARK: - LIFECYCLE:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        configureUI()
        loadPDF()
    }
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        webView = WKWebView()
        view.addSubviews(webView)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        // VIEW:
        view.backgroundColor = .colorMain
    }
    
    // MARK: - HELPERS:
    
    private func loadPDF() {
        if let url = Bundle.main.url(forResource: "Codex", withExtension: "pdf") {
            let request = URLRequest(url: url)
            webView.load(request)
        } else {
            print("PDF file not found")
        }
    }
}
