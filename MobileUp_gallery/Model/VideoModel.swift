//
//  VideoModel.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 25.08.2024.
//

import SwiftUI

struct Video: Identifiable {
    let id = UUID()
    let title: String
    let videoUrl: String
    let thumbnailUrl: String
}
