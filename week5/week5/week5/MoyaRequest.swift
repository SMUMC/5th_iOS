//
//  MoyaRequest.swift
//  week5
//
//  Created by 이동현 on 10/29/23.
//

import Foundation
import Moya


// OpenWeatherAPI 정의
enum OpenWeatherAPI {
    case getWeather(city: String, language: String, units: String, apiKey: String)
}

// OpenWeatherAPI 타겟 설정
extension OpenWeatherAPI: TargetType {
    var baseURL: URL { return URL(string: "https://api.openweathermap.org/data/2.5")! }
    var path: String {
        switch self {
        case .getWeather:
            return "/weather"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    var sampleData: Data {
        return Data() // 예제 데이터
    }
    var task: Task {
        switch self {
        case .getWeather(let city, let units, let lang, let apiKey):
            return .requestParameters(parameters: ["q": city, "units": units, "lang": lang, "appid": apiKey], encoding: URLEncoding.default)
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
