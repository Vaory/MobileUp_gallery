//
//  VideoViewModel.swift
//  MobileUp_gallery
//
//  Created by Mikhail Demichev on 25.08.2024.
//

import SwiftUI
import Combine

class VideosViewModel: ObservableObject {
    @Published var videos: [Video] = []
    
    func fetchVideos(token: String) {
        let ownerID = "-128666765"
        let urlString = "https://api.vk.com/method/video.get?owner_id=\(ownerID)&access_token=\(token)&v=5.131"
        
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
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    
                    if let error = json["error"] as? [String: Any],
                       let errorMessage = error["error_msg"] as? String {
                        print("Ошибка запроса: \(errorMessage)")
                        return
                    }
                    
                    // Проверка на наличие данных в ответе
                    if let response = json["response"] as? [String: Any],
                       let items = response["items"] as? [[String: Any]] {
                        
                        let videos = items.compactMap { item -> Video? in
                            guard let title = item["title"] as? String,
                                  let player = item["player"] as? String,
                                  let imageArray = item["image"] as? [[String: Any]],
                                  let firstImage = imageArray.last,
                                  let thumbnailUrl = firstImage["url"] as? String else {
                                print("Не удалось распарсить видео: \(item)")
                                return nil
                            }
                            return Video(title: title, videoUrl: player, thumbnailUrl: thumbnailUrl)
                        }
                        
                        DispatchQueue.main.async {
                            self?.videos = videos
                        }
                    } else {
                        print("Не удалось распарсить ответ")
                    }
                }
            } catch {
                print("Ошибка парсинга JSON: \(error)")
            }
        }.resume()
    }
}
