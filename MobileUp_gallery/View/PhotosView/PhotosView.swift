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
        GridItem(.flexible(), spacing: 4),
        GridItem(.flexible(), spacing: 4)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 4) {
                    ForEach(viewModel.photos) { photo in
                        VStack {
                            Image(uiImage: photo.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 185, height: 185)
                                .clipped()
                        }
                        .background(Color.white)
                    }
                }
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
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
