//
//  DetailViewHeader.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 26.08.2024.
//

import SwiftUI

struct DetailViewHeader: View {
    @ObservedObject var loginViewModel: LoginViewModel
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    //Действие для кнопки назад
                } label: {
                    Image("BackIcon")
                        .resizable()
                        .frame(width: 11, height: 21)
                        .padding(.leading, 19)
                }

                Spacer()

                ShareButtonView()
                    .padding(.trailing, 12)
            }
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .overlay(
                Text("MobileUP Gallery")
                    .font(.system(size: 17, weight: .semibold))
            )
        }
        .frame(maxWidth: .infinity)
    }
}


struct DetailViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewHeader(loginViewModel: LoginViewModel())
    }
}
