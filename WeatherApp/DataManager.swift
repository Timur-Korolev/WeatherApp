//
//  DataManager.swift
//  WeatherApp
//
//  Created by admin on 10/26/19.
//  Copyright © 2019 Timur Korolev. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    func getWeather(from url: String, completion: @escaping (OfferModel) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            
            do {
                let currentWeather = try JSONDecoder().decode(OfferModel.self, from: data)
                completion(currentWeather)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }
}
