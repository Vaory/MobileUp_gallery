//
//  PhotoDetailView.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 25.08.2024.
//

import SwiftUI

struct PhotoDetailView: View {
    
    let photo: Photo
    
    var body: some View {
        VStack {
            
            Spacer()
            
            AsyncImage(url: URL(string: photo.imageUrl)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            Spacer()
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}
