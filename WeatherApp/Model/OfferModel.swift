//
//  OfferModel.swift
//  WeatherApp
//
//  Created by admin on 10/19/19.
//  Copyright © 2019 Timur Korolev. All rights reserved.
//

import Foundation

struct ForecastModel: Codable {
    let list: [OfferModel]?
}

struct OfferModel: Codable {
    let weather: [WeatherOfferModel]?
    let main: MainOfferModel?
    let wind: WindOfferModel?
    let dt_txt: String?
}

struct WeatherOfferModel: Codable {
    let description: String?
    let icon: String?
}

struct MainOfferModel: Codable {
    let temp: Float?
    let humidity: Float?
}

struct WindOfferModel: Codable {
    let speed: Float?
}
