import SwiftUI
import WebKit

// Loads the bundled Study Arcade web app (the same index.html/manifest/icons
// used by the GitHub Pages deployment) locally, so the app works fully
// offline — no network round trip to GitHub Pages needed after install.
struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.isOpaque = false
        webView.backgroundColor = UIColor(red: 0x14 / 255, green: 0x12 / 255, blue: 0x1F / 255, alpha: 1)
        webView.scrollView.backgroundColor = webView.backgroundColor

        if let htmlURL = Bundle.main.url(forResource: "index", withExtension: "html") {
            webView.loadFileURL(htmlURL, allowingReadAccessTo: htmlURL.deletingLastPathComponent())
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}

struct ContentView: View {
    var body: some View {
        WebView()
            .ignoresSafeArea()
            .background(Color(red: 0x14 / 255, green: 0x12 / 255, blue: 0x1F / 255))
    }
}
