//
//  LoginView.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 21.08.2024.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Mobile UP\nGallery")
                    .font(.system(size: 44, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                    .padding(.top, 160)
                
                Spacer()

                NavigationLink(destination: VKLoginView()) {
                    Text("Вход через VK")
                        .frame(maxWidth: .infinity, minHeight: 52)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 42)
            }
            .edgesIgnoringSafeArea(.all)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
