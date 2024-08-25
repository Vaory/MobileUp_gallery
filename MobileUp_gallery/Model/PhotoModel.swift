//
//  PhotoModel.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 23.08.2024.
//

import SwiftUI

struct Photo: Identifiable {
    let id = UUID()
    let imageUrl: String
    let uploadDate: String
}
