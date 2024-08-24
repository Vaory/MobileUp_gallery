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
            Image(uiImage: photo.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .navigationBarTitle("", displayMode: .inline)
            Spacer()
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}
