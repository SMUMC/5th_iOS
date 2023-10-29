//
//  WeatherViewController.swift
//  week5
//
//  Created by 이동현 on 10/29/23.
//

import UIKit
import SnapKit
import Moya

class WeatherViewController: UIViewController {
    let provider = MoyaProvider<OpenWeatherAPI>()
    var apiKey = "MY_APIKEY"
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "날씨"
        return label
    }()
    
    lazy var weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "맑음"
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(weatherLabel)
        view.addSubview(temperatureLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
        }
        
        weatherLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
        }
        
        temperatureLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(weatherLabel.snp.bottom).offset(50)
        }
        getWeather()
    }
    
    func getWeather(){
        provider.request(OpenWeatherAPI.getWeather(city: "seoul", language: "kr", units: "metric", apiKey: apiKey)) { result in
            switch result {
            case .success(let response):
                do {
                    let weatherData = try JSONDecoder().decode(WeatherResponse.self, from: response.data)
                    
                    let temperature = weatherData.main.temp
                    let weatherDescription = weatherData.weather.first?.description
                    print(temperature)
                    self.weatherLabel.text = weatherDescription
                    self.temperatureLabel.text = String(temperature)
                } catch {
                    print("JSON 파싱 오류: \(error)")
                }
                
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
}
