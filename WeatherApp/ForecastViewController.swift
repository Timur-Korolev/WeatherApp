//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by admin on 10/26/19.
//  Copyright © 2019 Timur Korolev. All rights reserved.
//

import UIKit

class ForecastViewController: UITableViewController {
    
    private let forecastURL = "https://api.openweathermap.org/data/2.5/forecast?id=627907&units=metric&appid=90178019185f529f9ac20989abd272de"
    
    private var forecast: ForecastModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.shared.getForecast(from: forecastURL) { (forecast) in
            DispatchQueue.main.async {
                self.forecast = forecast
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        forecast?.list?.count ?? 0
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ForecastCell
        guard let forecast = forecast else { return cell }
        guard let weather = forecast.list?[indexPath.row] else { return cell }
        
        cell.configureCell(with: weather)

        return cell
    }
}
