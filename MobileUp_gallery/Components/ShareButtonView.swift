//
//  ShareButtonView.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 23.08.2024.
//

import SwiftUI

struct ShareButtonView: View {
    
    @State private var isSharePresented = false
    let imageUrl: String
    
    var body: some View {
        Button(action: {
            self.isSharePresented = true
        }, label: {
            Image("ShareIcon")
                .resizable()
                .frame(width: 15, height: 19)
        })
        .sheet(isPresented: $isSharePresented, content: {
            if let url = URL(string: imageUrl),
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                ActivityView(activityItems: [image], applicationActivities: nil)
            } else {
                ActivityView(activityItems: [URL(string: imageUrl)!], applicationActivities: nil)
            }
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShareButtonView(imageUrl: "https://example.com/image.jpg")
    }
}
