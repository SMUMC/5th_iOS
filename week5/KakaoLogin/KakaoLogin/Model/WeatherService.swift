//
//  WeatherService.swift
//  KakaoLogin
//
//  Created by 이현호 on 2023/10/29.
//

import Foundation
import Alamofire

struct WeatherService{
    static let shared = WeatherService()
    
    //회원가입
    func getCurrentWeather(completion: @escaping (NetworkResult<Any>) -> (Void)) {
        

        let url = ""//openWather API
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json"
        ]

            
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData(completionHandler: {(response) in
            
            guard let statusCode = response.response?.statusCode else {
                return
            }
            guard let data = response.value else {
                return
            }
            
            switch response.result{
            case .success:
                completion(getWeatherData(data: data))
            case .failure(let error):
                print(error)
                completion(.networkFail)
            }
        })
    }
    
    private func getWeatherData(data: Data) -> NetworkResult<Any>{
        //decoding
        let decoder = JSONDecoder()
        let weatherResponse = try? decoder.decode(WeatherModel.self, from: data)
        
        return .success(weatherResponse)
    }
}
