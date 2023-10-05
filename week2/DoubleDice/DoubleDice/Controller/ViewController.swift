//
//  ViewController.swift
//  DoubleDice
//
//  Created by 이동현 on 2023/10/03.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var diceView = DiceView()
    var diceModel = DiceModel()
    let rollBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        btn.setTitle("ROLL", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(diceView)
        view.addSubview(rollBtn)
        
        diceView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        rollBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(diceView.diceStackView.snp.bottom).offset(30)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        rollBtn.addTarget(self, action: #selector(rollBtnTapped), for: .touchUpInside)
        setDiceImg()
    }
    
    
    // MARK: - 주사위의 이미지를 설정하는 함수
    func setDiceImg(){
        diceView.diceImg1.image = diceModel.getDiceImg(value: diceModel.dice1Status)
        diceView.diceImg2.image = diceModel.getDiceImg(value: diceModel.dice2Status)
    }
    
    func setTitle(){
        diceView.titleLabel.text = "결과: \(diceModel.dice1Status + diceModel.dice2Status)"
    }
    
    @objc func rollBtnTapped(){
        diceModel.roll()
        setTitle()
        diceView.diceImg1.image = diceModel.getDiceImg(value: diceModel.dice1Status)
        diceView.diceImg2.image = diceModel.getDiceImg(value: diceModel.dice2Status)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct VCPreview: PreviewProvider {
    static var previews: some View {
        ViewController().showPreview(.iPhone15Pro)
    }
}
#endif
