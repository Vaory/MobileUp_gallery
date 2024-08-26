//
//  MainViewHeader.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 26.08.2024.
//

import SwiftUI

struct MainViewHeader: View {
    
    @ObservedObject var loginViewModel: LoginViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("MobileUP Gallery")
                    .font(.system(size: 17, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .overlay(
                        HStack {
                            Spacer()
                            ShareButtonView()
                            .padding(.trailing, 12)
                        }
                    )
                    .frame(height: 44)
            }
            .frame(maxWidth: .infinity)

            SegmentedControlView()
        }
        .frame(maxWidth: .infinity)
    }
}

struct MainViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        MainViewHeader(loginViewModel: LoginViewModel())
    }
}

