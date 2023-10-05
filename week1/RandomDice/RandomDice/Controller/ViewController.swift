//
//  ViewController.swift
//  RandomDice
//
//  Created by 이현호 on 2023/10/05.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var diceModel = DiceModel()
    var diceView = DiceView()
    
    lazy var rollBtn: UIButton = {
        let button = UIButton()
        button.setTitle("던지기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        rollBtn.addTarget(self, action: #selector(rollBtnTapped), for: .touchDown)
        makeUI()
    }
    

    func makeUI(){
        self.view.addSubview(diceView)
        self.view.addSubview(rollBtn)
        
        diceView.diceImageView.image = diceModel.getDiceImage()
        
        diceView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        rollBtn.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(diceView.diceImageView.snp.bottom).offset(50)
        }
    }
    
    @objc func rollBtnTapped(){
        diceModel.rollDice()
        self.updateUI()
    }
    
    func updateUI(){
        diceView.diceImageView.image = diceModel.getDiceImage()
        diceView.titleLabel.text = "결과 : \(diceModel.diceNum)"
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct VCPreview: PreviewProvider {
    static var previews: some View {
        ViewController().showPreView(.iPhone15Pro)
    }
}
#endif
