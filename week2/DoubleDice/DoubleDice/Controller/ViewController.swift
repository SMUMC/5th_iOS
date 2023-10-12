//
//  ViewController.swift
//  DoubleDice
//
//  Created by 이현호 on 2023/10/12.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var diceModel = DiceModel()
    var diceView = DiceView()
    
    lazy var rollBtn: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.backgroundColor = .black
        button.setTitle("Roll!", for: .normal)
        button.titleLabel?.font = UIFont.italicSystemFont(ofSize: 30)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        rollBtn.addTarget(self, action: #selector(rollDice), for: .touchUpInside)
        self.setUp()
    }
    
    func setUp(){
        self.view.addSubview(diceView)
        self.view.addSubview(rollBtn)
        
        diceView.snp.makeConstraints{ make in
            
            
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
        }
        
        
        rollBtn.snp.makeConstraints{ make in
            make.width.equalTo(100)
            make.height.equalTo(40)
            
            make.top.equalTo(diceView.diceImageViews.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
    }
    
    func updateUI(){
        let diceImages = diceModel.getDicesImage()
        self.diceView.diceImageView1.image = diceImages[0]
        self.diceView.diceImageView2.image = diceImages[1]
        self.diceView.guideLabel.text = "합 : \(self.diceModel.dicesHap())"
    }
    
    @objc func rollDice(){
        self.diceModel.rollDices()
        self.updateUI()
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
