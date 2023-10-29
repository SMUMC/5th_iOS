//
//  RequestFile.swift
//  Chapter5_2
//
//  Created by 김영준 on 2023/10/29.
//

import Alamofire
import UIKit

class RequestFile {
    
    let apiKey = "NW8Y49b6TTTo0hIPONoMys6cwVbu+RWWR1PWLy926E/6TqItZ4vvjalIHg8dMNLj2PmtM3R1rbz6KlpJYLdsWg=="
    let baseURL = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst"
    let baseURL2 = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0"
    let dataType = "JSON"
    
    func fetchData(_ viewController: ViewController) {
        let params: Parameters = [
            "serviceKey": apiKey,
            "pageNo": 1,
            "numOfRows": 10,
            "dataType": dataType,
            "base_date": "20231029",
            "base_time": "0830",
            "nx": 37,
            "ny": 126
        ]
        
        AF.request(baseURL, 
                   method: .get, 
                   parameters: params)
        .responseDecodable(of: ResponseFile.self) { response in
            
            switch response.result{
            case .success(let response):
                print("success>> Response \(response)")
                
            case .failure(let error):
                print("DEBUG>> Error : \(error.localizedDescription)")
                debugPrint(response)
            }
        }
    }
}

