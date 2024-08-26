//
//  GalleryView.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 26.08.2024.
//

import SwiftUI

struct GalleryView: View {
    @ObservedObject var loginViewModel: LoginViewModel
    var body: some View {
        NavigationView {
            MainViewHeader(loginViewModel: loginViewModel)
            
            SegmentedControlView()
            
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView(loginViewModel: LoginViewModel())
    }
}
