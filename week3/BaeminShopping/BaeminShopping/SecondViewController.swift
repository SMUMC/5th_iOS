//
//  SecondViewController.swift
//  BaeminShopping
//
//  Created by 이동현 on 2023/10/08.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    var data: Int?
    
    lazy var storeBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor(named: "mainColor")
        btn.setTitleColor(.white, for: .normal)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(storeBtn)
        
        storeBtn.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.width.equalTo(100)
        }
    }
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SecondViewControllerPreview: PreviewProvider{
    static var previews: some View {
        UIViewControllerPreview {
            let vc = SecondViewController()
            return vc
        }
    }
}
#endif
 
