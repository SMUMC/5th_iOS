//
//  ViewController.swift
//  KakaoLogin
//
//  Created by 이현호 on 2023/10/29.
//

import UIKit

class ViewController: UIViewController {
    
    var homeView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        applyViewCode()
 
    }


}

extension ViewController: ViewCodeProtocol {
    func buildViewHierachy() {
        view.addSubview(homeView)
    }
    
    func setUpConstraint() {
        homeView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
    
    
}

