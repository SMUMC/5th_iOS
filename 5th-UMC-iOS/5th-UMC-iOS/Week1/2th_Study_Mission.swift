//
//  2th_Study_Mission.swift
//  5th-UMC-iOS
//
//  Created by 황인성 on 2023/10/07.
//

import Foundation
import UIKit
import SnapKit

struct DoubleDiceModel{
    var dice1Status = 1
    var dice2Status = 1
    var diceImg: [UIImage] = []
    
    mutating func roll(){
        dice1Status = Int.random(in: 1...6)
        dice2Status = Int.random(in: 1...6)
    }
    
    func getDiceImg(value: Int) -> UIImage{
        return diceImg[value - 1]
    }
    
    init() {
        for i in 1...6{
            if let image = UIImage(named: "black\(i)"){diceImg.append(image)}
        }
    }
}


class DoubleDiceView: UIView{
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "주사위를 굴리세요"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    lazy var diceStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 20
        return sv
    }()
    
    lazy var diceImg1 = UIImageView(image: UIImage(systemName: "pencil"))
    lazy var diceImg2 = UIImageView(image: UIImage(systemName: "pencil"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        diceStackView.addArrangedSubview(diceImg1)
        diceStackView.addArrangedSubview(diceImg2)
        addSubview(diceStackView)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(150)
        }
        
        diceStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(150)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class DoubleDiceViewController: UIViewController {

    lazy var diceView = DoubleDiceView()
    var diceModel = DoubleDiceModel()
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

#if DEBUG
import SwiftUI
struct DoubleDiceViewControllerRepresentable: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
    }
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        DoubleDiceViewController()
    }
}
@available(iOS 13.0, *)
struct DoubleDiceViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            DoubleDiceViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 14pro"))
        }
    }
} #endif
