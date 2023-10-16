//
//  ViewController.swift
//  login
//
//  Created by 이동현 on 2023/10/16.
//

import UIKit

class ViewController: UIViewController {

    lazy var idTf: UITextField = {
        let tf = UITextField()
        tf.placeholder = "id입력"
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.borderWidth = 0.5
        return tf
    }()
    
    lazy var pwTf: UITextField = {
        let tf = UITextField()
        tf.isSecureTextEntry = true
        tf.placeholder = "pw입력"
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.borderWidth = 0.5
        return tf
    }()
    
    lazy var btn: UIButton = {
        let btn = UIButton()
        btn.setTitle("로그인", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(idTf)
        view.addSubview(pwTf)
        view.addSubview(btn)
        
        idTf.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(300)
        }
        
        pwTf.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(idTf.snp.bottom).offset(20)
        }
        
        btn.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(pwTf.snp.bottom).offset(20)
        }
        
        btn.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
    }

    @objc func loginBtnTapped() {
        if(idTf.text == "admin" && pwTf.text == "admin") {
            UserDefaults.standard.set(true, forKey: "islogin")
            print(pwTf.text)
            let nextVC = NextViewController()
            nextVC.modalPresentationStyle = .fullScreen
            present(nextVC, animated: true)
        } else {
            let alert = UIAlertController(title: "알림", message: "잘못된 id/pw", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .cancel)
            alert.addAction(ok)
            present(alert, animated: true)
        }
    }

}

