//
//  OfferModel.swift
//  WeatherApp
//
//  Created by admin on 10/19/19.
//  Copyright © 2019 Timur Korolev. All rights reserved.
//

import Foundation

struct OfferModel: Codable {
    let weather: [WeatherOfferModel]?
    let main: MainOfferModel?
    let wind: WindOfferModel?
}

struct WeatherOfferModel: Codable {
    let description: String?
    let icon: String?
}

struct MainOfferModel: Codable {
    let temp: Int?
    let humidity: Int?
}

struct WindOfferModel: Codable {
    let speed: Int?
}
