//
//  ViewController.swift
//  week5
//
//  Created by 이동현 on 10/28/23.
//

import UIKit
import SnapKit
import KakaoSDKUser


class ViewController: UIViewController {
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func loginButtonTapped() {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    let vc = WeatherViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            }
    }
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ViewControllerPreview: PreviewProvider{
    static var previews: some View {
        UIViewControllerPreview {
            let vc = ViewController()
            return vc
        }
    }
}
#endif
