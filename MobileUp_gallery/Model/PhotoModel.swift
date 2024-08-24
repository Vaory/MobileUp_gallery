//
//  PhotoModel.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 23.08.2024.
//

import SwiftUI

struct Photo: Identifiable {
    let id = UUID()
    let image: UIImage
    let uploadDate: String
}

