//
//  ViewController.swift
//  RSP
//
//  Created by 이동현 on 2023/10/16.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "주사위를 굴리세요"
        return label
    }()
    
    lazy var cpuImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "ready")
        return img
    }()
    
    lazy var userImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "ready")
        return img
    }()
    
    lazy var stkview: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 15
        return view
    }()
    
    lazy var choiceStkview:UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillEqually
        return view
    }()
    
    lazy var rockBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("주먹", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemGreen
        btn.tag = 0
        return btn
    }()
    
    lazy var paperBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("보", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemGreen
        btn.tag = 1
        return btn
    }()
    
    lazy var scissorsBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("가위", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemGreen
        btn.tag = 2
        return btn
    }()
    
    lazy var rspBtn:UIButton = {
        let btn = UIButton()
        btn.setTitle("가위 바위 보!", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .black
        return btn
    }()
    
    var userChoice: RPS = RPS.rock
    var cpuChoice: RPS = RPS(rawValue: Int.random(in: 0...2))!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        rockBtn.addTarget(self, action: #selector(btnTapped(sender:)), for: .touchUpInside)
        paperBtn.addTarget(self, action: #selector(btnTapped(sender:)), for: .touchUpInside)
        scissorsBtn.addTarget(self, action: #selector(btnTapped(sender:)), for: .touchUpInside)
        rspBtn.addTarget(self, action: #selector(rpsBtnTapped), for: .touchUpInside)

    }
    
    private func setUp(){
        view.addSubview(stkview)
        view.addSubview(choiceStkview)
        view.addSubview(resultLabel)
        view.addSubview(rspBtn)
        
        stkview.addArrangedSubview(cpuImg)
        stkview.addArrangedSubview(userImg)
        
        choiceStkview.addArrangedSubview(rockBtn)
        choiceStkview.addArrangedSubview(paperBtn)
        choiceStkview.addArrangedSubview(scissorsBtn)
        
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(150)
            make.centerX.equalToSuperview()
        }
        
        stkview.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(315)
            make.height.equalTo(150)
        }
        
        choiceStkview.snp.makeConstraints { make in
            make.width.equalTo(320)
            make.height.equalTo(50)
            make.top.equalTo(stkview.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        rspBtn.snp.makeConstraints { make in
            make.top.equalTo(choiceStkview.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
        }
        
        cpuImg.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
        userImg.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
    }
    
    @objc func btnTapped(sender: UIButton) {
        switch sender.tag {
        case 0: // 주먹
            userImg.image = UIImage(named: "rock")
            userChoice = RPS.rock
        case 1: // 보
            userImg.image = UIImage(named: "paper")
            userChoice = RPS.paper
        case 2: // 가위
            userImg.image = UIImage(named: "scissors")
            userChoice = RPS.scissors
        default:
            break
        }
    }
    
    @objc func rpsBtnTapped() {
        cpuChoice = RPS(rawValue: Int.random(in: 0...2))!
        
        switch cpuChoice {
        case .rock:
            cpuImg.image = UIImage(named: "rock")
        case .paper:
            cpuImg.image = UIImage(named: "paper")
        case .scissors:
            cpuImg.image = UIImage(named: "scissors")
        }
        
        if cpuChoice == userChoice {
            resultLabel.text = "비겼다!"
        } else if (cpuChoice == .rock && userChoice == .paper)
                    || (cpuChoice == .paper && userChoice == .scissors)
                    || (cpuChoice == .scissors && userChoice == .rock) {
            resultLabel.text = "이겼다!!"
        } else {
            resultLabel.text = "졌다!"
        }
    }
    

}

