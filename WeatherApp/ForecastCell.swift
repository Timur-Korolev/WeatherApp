//
//  ForecastCell.swift
//  WeatherApp
//
//  Created by admin on 10/26/19.
//  Copyright © 2019 Timur Korolev. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell {

    func configureCell(with weather: OfferModel) {
        let iconName = weather.weather?.first?.icon
        let condition = weather.weather?.first?.description
        let temp = weather.main?.temp
        let date = weather.dt_txt
        
        imageView?.image = UIImage(named: iconName ?? "10d")
        textLabel?.text = date
        detailTextLabel?.text = "\(temp ?? 0)ºC \(condition ?? "zz")"
        
    }

}

