//
//  ContentView.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 20.08.2024.
//

import SwiftUI

struct VKLoginView: View {
    var body: some View {
        VStack {
            WebView()
                .ignoresSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VKLoginView()
    }
}
