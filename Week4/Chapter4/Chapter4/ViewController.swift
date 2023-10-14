//
//  ViewController.swift
//  Chapter4
//
//  Created by 김영준 on 2023/10/15.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let textLabel = UILabel()
    let loginTextView = UITextField()
    let passwordTextView = UITextField()
    let loginButtonView = UIButton()
    let signButtonView = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = ""
        textLabel.font = .systemFont(ofSize: 20)
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 2
        
        loginTextView.placeholder = "ID"
        loginTextView.borderStyle = .roundedRect
        
        passwordTextView.placeholder = "Password"
        passwordTextView.borderStyle = .roundedRect
        
        loginButtonView.setTitle("로그인", for: .normal)
        loginButtonView.backgroundColor = .systemBlue
        loginButtonView.layer.cornerRadius = 5
        
        signButtonView.setTitle("회원가입", for: .normal)
        signButtonView.backgroundColor = .systemBlue
        signButtonView.layer.cornerRadius = 5
        
        loginButtonView.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        signButtonView.addTarget(self, action: #selector(signButtonTapped), for: .touchUpInside)
        
        setupUI()
    }
    
    @objc private func loginButtonTapped() {
        guard let username = loginTextView.text, let password = passwordTextView.text else {
            return
        }
        
        if let savedPassword = UserDefaults.standard.string(forKey: username) {
            if password == savedPassword {
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                textLabel.text = "로그인 성공! 사용자: \(username)"
            } else {
                textLabel.text = "비밀번호가 일치하지 않습니다."
            }
        } else {
            textLabel.text = "존재하지 않는 사용자입니다."
        }
    }

        
    @objc private func signButtonTapped() {
        guard let username = loginTextView.text, let password = passwordTextView.text else {
            return
        }
        
        if UserDefaults.standard.string(forKey: username) != nil {
            showAlert(message: "이미 등록된 사용자입니다.")
        } else {
            UserDefaults.standard.set(password, forKey: username)
            showAlert(message: "회원가입이 완료되었습니다.")
        }
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    
    private func setupUI(){
        self.view.backgroundColor = .white
        self.view.addSubview(textLabel)
        self.view.addSubview(loginTextView)
        self.view.addSubview(passwordTextView)
        self.view.addSubview(loginButtonView)
        self.view.addSubview(signButtonView)
        
        textLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(loginTextView).offset(-100)
            make.width.equalTo(200)
        }
        loginTextView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.view).offset(-100)
            make.width.equalTo(200)
        }
        passwordTextView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginTextView).offset(50)
            make.width.equalTo(200)
        }
        loginButtonView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextView).offset(50)
            make.width.equalTo(200)
        }
        signButtonView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButtonView).offset(50)
            make.width.equalTo(200)
        }
    }
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {

    func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
    }
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        ViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 pro"))
        }

    }
} #endif
