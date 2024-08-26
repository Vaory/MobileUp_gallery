//
//  DetailViewHeader.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 26.08.2024.
//

import SwiftUI

struct DetailViewHeader: View {
    @ObservedObject var loginViewModel: LoginViewModel
    let date: String
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
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
                Text(date)
                    .font(.system(size: 17, weight: .semibold))
            )
        }
        .frame(maxWidth: .infinity)
    }
}


