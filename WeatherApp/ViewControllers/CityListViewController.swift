//
//  CityListViewController.swift
//  WeatherApp
//
//  Created by Eugene on 15.02.2024.
//

import UIKit

class CityListViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var weatherForecastLabel: UILabel!
    
    @IBOutlet weak var citySearchBar: UISearchBar!
    
    @IBOutlet weak var cityListTableView: UITableView!
    
    var cities: [[CityBrief]] = [
        [
            CityBrief(cityName: "Dnipro", temperature: "3", weatherForecast: "Rain")
        ], [
            CityBrief(cityName: "Kyiv", temperature: "5", weatherForecast: "Rain"),
            CityBrief(cityName: "London", temperature: "11", weatherForecast: "Fog"),
            CityBrief(cityName: "New York", temperature: "22", weatherForecast: "Cloudy"),
            CityBrief(cityName: "Berlin", temperature: "12", weatherForecast: "Rain"),
            CityBrief(cityName: "Istambul", temperature: "28", weatherForecast: "Sunny")
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layer.backgroundColor = Color().darkCG
        
        //citySearchBar.layer.backgroundColor = Color().darkCG
        citySearchBar.tintColor = Color().dark
        
        let cellNib = UINib(nibName: "CustomCellView", bundle: nil)
        cityListTableView.register(cellNib, forCellReuseIdentifier: "customCell")
        
        cityListTableView.backgroundColor = .clear
        
        cityListTableView.dataSource = self
        cityListTableView.delegate = self
    }
}

extension CityListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 20
//    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 10
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let viewContainer = UIView()
        let labelHeader = UILabel()
        
        if section == 0 {
            labelHeader.font = .systemFont(ofSize: 15)
            labelHeader.backgroundColor = .clear
            labelHeader.textColor = UIColor.white
            labelHeader.text = "Your City"
        }
        if section == 1 {
            labelHeader.font = .systemFont(ofSize: 15)
            labelHeader.backgroundColor = .clear
            labelHeader.textColor = UIColor.white
            labelHeader.text =  "Favorite List"
        }
        viewContainer.addSubview(labelHeader)
        labelHeader.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        labelHeader.frame = viewContainer.frame
        
        return viewContainer
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCellView
        
        let cityBrief = cities[indexPath.row][indexPath.row]
        
        if indexPath.section == 0 {
            
            cell.setCityBrief(cityBrief: cityBrief)
        }
        if indexPath.section == 1 {
            cell.setCityBrief(cityBrief: cityBrief)
        }
        return cell
    }
}

extension CityListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let messageVC = MessageViewController()
//        
//        messageVC.person = persons[indexPath.row]
//
//        self.navigationController?.pushViewController(messageVC, animated: true)
    }
}
