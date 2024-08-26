//
//  VideoDetailView.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 26.08.2024.
//

import SwiftUI
import WebKit

struct VideoDetailView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    @Environment(\.presentationMode) private var presentationMode
    
    let video: Video
    
    var body: some View {
        VStack {
            DetailViewHeader(loginViewModel: loginViewModel, date: video.title, imageUrl: video.thumbnailUrl)
            
            Divider()
            
            Spacer()
            
            VideoWebView(url: video.videoUrl)
                .edgesIgnoringSafeArea(.bottom)
            
            Spacer()
        }
        .background(Color.white)
        .navigationBarBackButtonHidden(true)
    }
}

struct VideoWebView: UIViewRepresentable {
    let url: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.configuration.allowsInlineMediaPlayback = true
        webView.configuration.mediaTypesRequiringUserActionForPlayback = []
        webView.scrollView.isScrollEnabled = false
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let videoURL = URL(string: url) {
            let request = URLRequest(url: videoURL)
            uiView.load(request)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: VideoWebView
        
        init(_ parent: VideoWebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.querySelector('video').addEventListener('play', function() {webkit.messageHandlers.fullscreen.postMessage(null);})", completionHandler: nil)
        }
    }
}
