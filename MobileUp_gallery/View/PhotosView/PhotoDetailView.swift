//
//  PhotoDetailView.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 25.08.2024.
//

import SwiftUI

struct PhotoDetailView: View {
    
    @ObservedObject var loginViewModel: LoginViewModel
    let photo: Photo
   
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack {
            
            DetailViewHeader(loginViewModel: loginViewModel, date: photo.uploadDate, imageUrl: photo.imageUrl)
            
            Divider()
            
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
        .navigationBarBackButtonHidden(true)
    }
}
