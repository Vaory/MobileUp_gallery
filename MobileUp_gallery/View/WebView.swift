//
//  SwiftUIView.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 21.08.2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    @ObservedObject var loginViewModel: LoginViewModel
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        
        let redirectUrl = "https://oauth.vk.com/blank.html"
        let display = "mobile"
        let responseType = "token"
        let scope = "photos,video"
        
        let authURLString = "https://oauth.vk.com/authorize?client_id=\(52179604)&display=\(display)&redirect_uri=\(redirectUrl)&scope=\(scope)&response_type=\(responseType)&v=5.131"
        
        if let authURL = URL(string: authURLString) {
            let request = URLRequest(url: authURL)
            webView.load(request)
        }
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let url = navigationAction.request.url, url.absoluteString.contains("access_token") {
                if let token = getToken(from: url) {
                    parent.loginViewModel.saveToken(token)
                    parent.loginViewModel.isLoggedIn = true
                }
                decisionHandler(.cancel)
            } else {
                decisionHandler(.allow)
            }
        }
        
        private func getToken(from url: URL) -> String? {
            let urlString = url.absoluteString
            if let range = urlString.range(of: "access_token=") {
                let token = urlString[range.upperBound...]
                    .split(separator: "&")
                    .first.map(String.init)
                return token
            }
            return nil
        }
    }
}
