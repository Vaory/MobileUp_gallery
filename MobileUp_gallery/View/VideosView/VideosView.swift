//
//  VideosView.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 25.08.2024.
//
import SwiftUI

struct VideosView: View {
    @StateObject private var viewModel = VideosViewModel()
    var loginViewModel: LoginViewModel

    var body: some View {
        
            ScrollView {
                LazyVStack(spacing: 4) {
                    ForEach(viewModel.videos) { video in
                        NavigationLink(destination: VideoDetailView(loginViewModel: loginViewModel, video: video)) {
                            ZStack(alignment: .bottomTrailing) {
                                AsyncImage(url: URL(string: video.thumbnailUrl)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(maxWidth: .infinity, maxHeight: 210)
                                        .clipped()
                                } placeholder: {
                                    ProgressView()
                                        .frame(maxWidth: .infinity, maxHeight: 210)
                                }

                                Text(video.title)
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 4)
                                    .background(Color.white.opacity(0.5))
                                    .cornerRadius(16)
                                    .padding([.bottom, .trailing], 16)
                            }
                            .frame(height: 210)
                        }
                    }
                }
            }
            .onAppear {
                if let token = UserDefaults.standard.string(forKey: "VKAccessToken") {
                    viewModel.fetchVideos(token: token)
                } else {
                    print("Access token not found")
                }
            }
            .ignoresSafeArea(.all)
        
    }
}

struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        // Предположим, что у вас есть способ создать экземпляр LoginViewModel для предварительного просмотра
        VideosView(loginViewModel: LoginViewModel())
    }
}
