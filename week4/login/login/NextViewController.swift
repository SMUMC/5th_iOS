//
//  NextViewController.swift
//  login
//
//  Created by 이동현 on 2023/10/16.
//

import UIKit
import SnapKit

class NextViewController: UIViewController {

    lazy var label: UILabel = {
       let label = UILabel()
        label.text = "로그인 완료!!"
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)

        
        print(UserDefaults.standard.value(forKey: "islogin"))
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
