//
//  PhotosViewModel.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 23.08.2024.
//

import SwiftUI

class PhotosViewModel: ObservableObject {
    @Published var photos: [Photo] = []
    
    func fetchPhotos(with token: String) {
        let ownerID = "-128666765"
        let albumID = "266276915"
        let urlString = "https://api.vk.com/method/photos.get?owner_id=\(ownerID)&album_id=\(albumID)&access_token=\(token)&v=5.131"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                print("Request error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let response = json["response"] as? [String: Any],
                   let items = response["items"] as? [[String: Any]] {
                    
                    var loadedPhotos: [Photo] = []
                    
                    for item in items {
                        // Найти URL изображения подходящего размера
                        if let sizes = item["sizes"] as? [[String: Any]],
                           let urlStr = sizes.first(where: { $0["type"] as? String == "x" })?["url"] as? String,
                           let url = URL(string: urlStr) {
                            
                            // Загрузить изображение по URL
                            if let imageData = try? Data(contentsOf: url),
                               let image = UIImage(data: imageData) {
                                
                                // Получить дату публикации
                                let timestamp = item["date"] as? TimeInterval ?? 0
                                let date = Date(timeIntervalSince1970: timestamp)
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateStyle = .medium
                                dateFormatter.timeStyle = .none
                                let dateString = dateFormatter.string(from: date)
                                
                                // Создать объект Photo
                                let photo = Photo(image: image, uploadDate: dateString)
                                loadedPhotos.append(photo)
                            }
                        }
                    }
                    
                    DispatchQueue.main.async {
                        self?.photos = loadedPhotos
                    }
                }
            } catch {
                print("JSON parsing error: \(error)")
            }
        }
        
        task.resume()
    }
}
