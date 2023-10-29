//
//  WeatherModel.swift
//  KakaoLogin
//
//  Created by 이현호 on 2023/10/29.
//

import Foundation


struct WeatherModel: Codable {
    struct Coordinate: Codable {
        let lon: Double
        let lat: Double
    }

    struct WeatherDetail: Codable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }

    struct MainDetails: Codable {
        let temp: Double
        let feels_like: Double
        let temp_min: Double
        let temp_max: Double
        let pressure: Int
        let humidity: Int
        let sea_level: Int
        let grnd_level: Int
    }

    struct WindDetails: Codable {
        let speed: Double
        let deg: Int
        let gust: Double
    }

    struct CloudDetails: Codable {
        let all: Int
    }

    struct SysDetails: Codable {
        let country: String
        let sunrise: Int
        let sunset: Int
    }

    let coord: Coordinate
    let weather: [WeatherDetail]
    let base: String
    let main: MainDetails
    let visibility: Int
    let wind: WindDetails
    let clouds: CloudDetails
    let dt: Int
    let sys: SysDetails
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}
