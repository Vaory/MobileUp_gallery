//
//  PhotosView.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 24.08.2024.
//

import SwiftUI

struct PhotosView: View {
    @StateObject private var viewModel = PhotosViewModel()
    
    let columns = [
        GridItem(.fixed(185), spacing: 4),
        GridItem(.fixed(185), spacing: 4)
    ]
    
    var body: some View {
        
            ScrollView {
                LazyVGrid(columns: columns, spacing: 4) {
                    ForEach(viewModel.photos) { photo in
                        NavigationLink(destination: PhotoDetailView(loginViewModel: LoginViewModel(), photo: photo)) {
                            AsyncImage(url: URL(string: photo.imageUrl)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 185, height: 185)
                                    .clipped()
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 185, height: 185)
                            }
                        }
                    }
                }
                .padding(.horizontal, 4)
            }
            .onAppear {
                if let token = UserDefaults.standard.string(forKey: "VKAccessToken") {
                    viewModel.fetchPhotos(with: token)
                } else {
                    print("Access token not found")
                }
            }
        
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
