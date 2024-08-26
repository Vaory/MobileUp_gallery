//
//  ShareButtonView.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 23.08.2024.
//

import SwiftUI

struct ShareButtonView: View {
    
    @State private var isSharePresented = false
    let customActivity = ShareButtonModel(title: "App Name", imageName: "Share_app_icon") {
    }
    
    var body: some View {
        Button(action: {
            self.isSharePresented = true
        }, label: {
            Image("ShareIcon")
                .resizable()
                .frame(width: 15, height: 19)
        })
        .sheet(isPresented: $isSharePresented, content: {
            ActivityView(activityItems: ["test"], applicationActivities: [self.customActivity])
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShareButtonView()
    }
}
