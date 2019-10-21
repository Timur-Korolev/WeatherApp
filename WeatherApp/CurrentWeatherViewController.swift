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
    
    let gradientLayer = CAGradientLayer()
    
    var currentWeather: OfferModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundView.layer.addSublayer(gradientLayer)
        setInterface()
    }
    
    func setBlueGradientBackground() {
        let topColor = UIColor(red: 95.0/255.0, green: 165.0/255.0, blue: 1.0, alpha: 1.0).cgColor
        let bottomColor = UIColor(red: 72.0/255.0, green: 114.0/255.0, blue: 184.0/255.0, alpha: 1.0).cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor, bottomColor]
    }
        
    func setGreyGradientBackground() {
        let topColor = UIColor(red: 151.0/255.0, green: 151.0/255.0, blue: 151.0/255.0, alpha: 1.0).cgColor
        let bottomColor = UIColor(red: 72.0/255.0, green: 72.0/255.0, blue: 72.0/255.0, alpha: 1.0).cgColor
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [topColor, bottomColor]
    }
    
    func setInterface() {
        let iconName = currentWeather.weather.first??.icon
        let condition = currentWeather.weather.first??.description
        let temp = currentWeather.main?.temp
        
        
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

