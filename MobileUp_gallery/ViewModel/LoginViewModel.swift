//
//  LoginViewModel.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 22.08.2024.
//

import SwiftUI
import Combine
import Network

class LoginViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var isAttemptingLogin: Bool = false
    @Published var token: String?
    
    func saveToken(_ token: String) {
        self.token = token
        self.isLoggedIn = true
        UserDefaults.standard.set(token, forKey: "VKAccessToken")
        UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
    }
    
    func loadSavedData() {
        if let savedToken = UserDefaults.standard.string(forKey: "VKAccessToken") {
            self.token = savedToken
            self.isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        }
    }
    
    func logout() {
        self.token = nil
        self.isLoggedIn = false
        self.isAttemptingLogin = false
        UserDefaults.standard.removeObject(forKey: "VKAccessToken")
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
    }
    func checkInternetConnection(completion: @escaping (Bool) -> Void) {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "InternetConnectionMonitor")
        monitor.pathUpdateHandler = { path in
            completion(path.status == .satisfied)
            monitor.cancel()
        }
        monitor.start(queue: queue)
    }
}

