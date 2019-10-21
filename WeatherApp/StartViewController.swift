//
//  StartViewController.swift
//  WeatherApp
//
//  Created by admin on 10/21/19.
//  Copyright © 2019 Timur Korolev. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    var weather: OfferModel?
    
    private let weatherURL = "https://api.openweathermap.org/data/2.5/weather?id=627907&units=metric&appid=90178019185f529f9ac20989abd272de"

    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
    }
    
    func getWeather() {
        guard let url = URL(string: weatherURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else { return }
            
            do {
                self.weather = try JSONDecoder().decode(OfferModel.self, from: data)
            } catch let error {
                print(error)
            }
            
        }.resume()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let currentWeatherVC = segue.destination as! CurrentWeatherViewController
        currentWeatherVC.currentWeather = weather
    }
}
