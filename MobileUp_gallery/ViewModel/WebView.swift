//
//  SwiftUIView.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 20.08.2024.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        
        let webView = WKWebView()
        var urlComponent = URLComponents()
        let appID = "52179604"
        
        urlComponent.scheme = "https"
        urlComponent.host = "oauth.vk.com"
        urlComponent.path = "/authorize"
        urlComponent.queryItems = [
        URLQueryItem(name: "client_id", value: appID),
        URLQueryItem(name: "redirect_url", value: "https:/oauth.vk.com/blank.html"),
        URLQueryItem(name: "display", value: "mobile"),
        URLQueryItem(name: "response_type", value: "token")]
        
        let request = URLRequest(url: urlComponent.url!)
        
        webView.load(request)
        
        return webView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
