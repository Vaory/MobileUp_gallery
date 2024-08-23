//
//  ShareButtonModel.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 23.08.2024.
//

import SwiftUI
import UIKit

class ShareButtonModel: UIActivity {
    var title: String
    var imageName: String
    var action: () -> Void
    
    init(title: String, imageName: String, action: @escaping () -> Void) {
        self.title = title
        self.imageName = imageName
        self.action = action
    }

    override var activityTitle: String? {
        return title
    }

    override var activityImage: UIImage? {
        return UIImage(named: imageName)
    }

    override func perform() {
        action()
        activityDidFinish(true)
    }

    override class var activityCategory: UIActivity.Category {
        return .action
    }
}

struct ActivityView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIActivityViewController
    public var activityItems: [Any]
    public var applicationActivities: [UIActivity]?

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let viewController = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context){
    }
}
