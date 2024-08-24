//
//  LogoutButtonView.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 24.08.2024.
//

import SwiftUI

struct LogoutButtonView: View {
    
    @StateObject private var loginViewModel = LoginViewModel()
    
    var body: some View {
        Button {
            loginViewModel.logout()
        } label: {
            Text("Выход")
                .foregroundColor(.black)
        }

    }
}

struct LogoutButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButtonView()
    }
}
