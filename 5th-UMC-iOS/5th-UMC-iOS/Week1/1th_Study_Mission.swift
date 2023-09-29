//
//  1th_Study_Mission.swift
//  5th-UMC-iOS
//
//  Created by 황인성 on 2023/09/29.
//

import UIKit
import SnapKit

class DiceViewController: UIViewController{
    var diceModel = DiceModel()
    var diceView = DiceView()
    
        lazy var rollBtn: UIButton = {
            let btn = UIButton()
            btn.backgroundColor = .black
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.setTitle("ROLL", for: .normal)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.layer.masksToBounds = true
            btn.layer.cornerRadius = 10
            return btn
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        diceView.delegate = self
        makeUI()
        
        rollBtn.addTarget(self, action: #selector(rollBtnTapped), for: .touchUpInside)
    }
    
    func makeUI(){
        self.view.addSubview(diceView)
        self.view.addSubview(rollBtn)
        
        diceView.imageView.image = diceModel.getDice1Img()
        diceView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        rollBtn.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(diceView.imageView.snp.bottom).offset(30)
        }
    }
    
    @objc func rollBtnTapped(){
        diceModel.rollDice1()
        updateUI()
    }
    
    func updateUI(){
        diceView.imageView.image = diceModel.getDice1Img()
        diceView.titleLabel.text = "결과: \(diceModel.dice1Value)"
    }
}

struct DiceModel{
    var dice1Value: Int = 1
    var diceImg: [UIImage] = []

    mutating func rollDice1(){
        dice1Value = Int.random(in: 1...6)
    }
    
    func getDice1Img() -> UIImage{
        return diceImg[dice1Value - 1]
    }
    
    init(){
        for i in 1...6{
            if let image = UIImage(named: "black\(i)"){ diceImg.append(image)}
        }
    }
}

class DiceView: UIView{
//    weak var delegate: RollBtnDelegate?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "주사위를 굴리세요"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
//    lazy var rollBtn: UIButton = {
//        let btn = UIButton()
//        btn.backgroundColor = .black
//        btn.setTitleColor(UIColor.white, for: .normal)
//        btn.setTitle("ROLL", for: .normal)
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.layer.masksToBounds = true
//        btn.layer.cornerRadius = 10
//        return btn
//    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(imageView)
        //        addSubview(rollBtn)
        //        rollBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        titleLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(150)
        }
        
        imageView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
        }
        
//        rollBtn.snp.makeConstraints { make in
//            make.width.equalTo(100)
//            make.height.equalTo(40)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(imageView.snp.bottom).offset(30)
//        }
        
    }
    
//    @objc func buttonTapped(){
//        delegate?.roll()
//        print("delegate")
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//protocol RollBtnDelegate: AnyObject{
//    func roll()
//}

#if DEBUG
import SwiftUI
struct DiceViewControllerRepresentable: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
    }
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        DiceViewController()
    }
}
@available(iOS 13.0, *)
struct DiceViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            DiceViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 pro"))
        }
    }
} #endif

