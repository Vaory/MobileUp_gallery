//
//  VideoDetailView.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 26.08.2024.
//

import SwiftUI

struct VideoDetailView: View {
    
        let video: Video
        
        var body: some View {
            VStack {
                
                Spacer()
                
                AsyncImage(url: URL(string: video.thumbnailUrl)) { image in
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
