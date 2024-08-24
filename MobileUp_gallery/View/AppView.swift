//
//  AppView.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 22.08.2024.
//

import SwiftUI

struct AppView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            if loginViewModel.isLoggedIn, let token = loginViewModel.token {
                
                LogoutButtonView()
                
                PhotosView()
        
                
            } else if loginViewModel.isAttemptingLogin {
                WebView(loginViewModel: loginViewModel)
                    .edgesIgnoringSafeArea(.all)
            } else {
                LoginView(loginViewModel: loginViewModel)
            }
        }
        .onAppear {
            loginViewModel.loadSavedData()
        }
    }
}



struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
