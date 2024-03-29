//
//  ViewController.swift
//  WeatherApp
//
//  Created by admin on 10/19/19.
//  Copyright © 2019 Timur Korolev. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {

    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var conditionImageView: UIImageView!
    @IBOutlet var conditionLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var backgroundView: UIView!
    
    private let gradientLayer = CAGradientLayer()
    private let weatherURL = "https://api.openweathermap.org/data/2.5/weather?id=627907&units=metric&appid=90178019185f529f9ac20989abd272de"
    private var currentWeather: OfferModel?
    private var fiveDayForecast: ForecastModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.layer.addSublayer(gradientLayer)
        DataManager.shared.getWeather(from: weatherURL) { (currentWeather) in
            DispatchQueue.main.async {
                self.setInterface(with: currentWeather)
            }
        }
    }
    
    private func setBlueGradientBackground() {
        let topColor = UIColor(red: 95.0/255.0, green: 165.0/255.0, blue: 1.0, alpha: 1.0).cgColor
        let bottomColor = UIColor(red: 72.0/255.0, green: 114.0/255.0, blue: 184.0/255.0, alpha: 1.0).cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor, bottomColor]
    }
        
    private func setGreyGradientBackground() {
        let topColor = UIColor(red: 151.0/255.0, green: 151.0/255.0, blue: 151.0/255.0, alpha: 1.0).cgColor
        let bottomColor = UIColor(red: 72.0/255.0, green: 72.0/255.0, blue: 72.0/255.0, alpha: 1.0).cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor, bottomColor]
    }
    
    private func setInterface(with weather: OfferModel) {
        let iconName = weather.weather?.first?.icon
        let condition = weather.weather?.first?.description
        let temp = weather.main?.temp
        
        
        conditionImageView.image = UIImage(named: iconName ?? "10d")
        conditionLabel.text = condition
        temperatureLabel.text = String(temp ?? 0)
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dayLabel.text = dateFormatter.string(from: date)
        
        let suffix = iconName?.suffix(1) ?? "n"
        if suffix == "n" {
            self.setGreyGradientBackground()
        } else {
            self.setBlueGradientBackground()
        }
    }
}

