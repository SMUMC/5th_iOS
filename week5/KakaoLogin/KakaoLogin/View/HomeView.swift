//
//  HomeView.swift
//  KakaoLogin
//
//  Created by 이현호 on 2023/10/29.
//

import UIKit
import SnapKit

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class HomeView: UIView{
    
    
    lazy var kakaoLoginButton = UIButton()
    lazy var getTempButton = UIButton()
    lazy var tempLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: ViewCodeProtocol{
    func buildViewHierachy() {
        addSubview(kakaoLoginButton)
        addSubview(getTempButton)
        addSubview(tempLabel)
    }
    
    func setUpConstraint() {
        kakaoLoginButton.snp.makeConstraints{ make in
            make.width.equalTo(100)
            make.height.equalTo(30)
            
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        getTempButton.snp.makeConstraints{ make in
            make.width.equalTo(100)
            make.height.equalTo(30)
            
            make.centerX.equalToSuperview()
            make.top.equalTo(kakaoLoginButton.snp.top).offset(50)
        }
        
        tempLabel.snp.makeConstraints{ make in
            make.width.equalTo(500)
            make.height.equalTo(30)
            
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(150)
        }
    }
    
    func configureView() {
        kakaoLoginButton.backgroundColor = .yellow
        kakaoLoginButton.setTitle("kakaoLogin", for: .normal)
        kakaoLoginButton.setTitleColor(.black, for: .normal)
        kakaoLoginButton.addTarget(self, action: #selector(kakaoButtonTapped), for: .touchUpInside)
        
        getTempButton.backgroundColor = .yellow
        getTempButton.setTitle("get weather", for: .normal)
        getTempButton.setTitleColor(.black, for: .normal)
        getTempButton.addTarget(self, action: #selector(getTempButtonTapped), for: .touchUpInside)
        
        tempLabel.text = "날씨"
        tempLabel.textAlignment = .center
    }
    
    @objc func kakaoButtonTapped() {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                }
            }
    }
    
    @objc func getTempButtonTapped(){
        WeatherService.shared.getCurrentWeather(completion: {(networkResult) in
            
            switch networkResult {
            case .success(let data):
                guard let data = data as? WeatherModel else {return}
                self.tempLabel.text = "현재 기온 : \(data.main.temp)"
                
                
            default:
                print("network Error")
                
            }
        })
    }
    
    
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct HomeViewPreview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = HomeView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
