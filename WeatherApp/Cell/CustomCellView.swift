//
//  CustomCellView.swift
//  WeatherApp
//
//  Created by Eugene on 15.02.2024.
//

import UIKit

class CustomCellView: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var weatherForecastLabel: UILabel!
    
    @IBOutlet weak var weatherForecastImageView: UIImageView!
    
    var cityBrief: [CityBrief] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCityBrief(cityBrief: CityBrief ) {
        cityNameLabel.text = cityBrief.cityName
        temperatureLabel.text = cityBrief.temperature + "°"
        weatherForecastLabel.text = cityBrief.weatherForecast
        
        //currentTimeLabel.text = cityBrief.currentTime
        //weatherForecastImageView.image = UIImage(named: "")
        
        self.backgroundColor = Color().elephant
        self.layer.borderWidth = 5
        self.layer.borderColor = Color().darkCG
        self.layer.cornerRadius = 20
        
        
    }
    
}
