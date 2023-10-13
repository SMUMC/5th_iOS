//
//  ViewController.swift
//  Baemin
//
//  Created by 이현호 on 2023/10/12.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let scrollView: UIScrollView! = UIScrollView()
    let contentView: UIView! = UIView()
    
    lazy var pizzaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pizzaImage")
        return imageView
    }()
    
    lazy var menuLabel: UILabel = {
        let label = UILabel()
        label.text = "[재주문1위] 오리지널 페퍼로니 피자"
        label.font = UIFont.boldSystemFont(ofSize: 23)
        return label
    }()
    
    lazy var ingiImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "IngiImage")
        return imageView
    }()
    
    lazy var explanationLabel: UILabel = {
        let label = UILabel()
        label.text = "육즙이 남도록 적절하게 익힌 존맛 페퍼로니 피자"
        label.textColor = .gray
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var showNutrientBtn: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 4
        btn.backgroundColor = .systemGray5
        
        btn.setTitleColor(.black, for: .normal)
        btn.setTitle("영양성분 및 알레르기성분 표시 보기", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        return btn
    }()
    
    lazy var splitView1: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "가격"
        label.textColor = .black
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var essentialLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 10
        label.layer.backgroundColor = UIColor.blue.cgColor
        
        label.text = "필수"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setScrollView()
    }
    
    func setScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(pizzaImageView)
        contentView.addSubview(ingiImageView)
        contentView.addSubview(menuLabel)
        contentView.addSubview(explanationLabel)
        contentView.addSubview(showNutrientBtn)
        contentView.addSubview(splitView1)
        contentView.addSubview(priceLabel)
        contentView.addSubview(essentialLabel)
        
        scrollView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        contentView.snp.makeConstraints{ make in
            make.top.equalTo(scrollView.contentLayoutGuide)
            make.bottom.equalTo(scrollView.contentLayoutGuide)
            make.leading.equalTo(scrollView.contentLayoutGuide)
            make.trailing.equalTo(scrollView.contentLayoutGuide)
            
            make.width.equalTo(scrollView).constraint.isActive = true
        }
        
        pizzaImageView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            
            make.height.equalTo(250)
        }
        
        ingiImageView.snp.makeConstraints{ make in
            make.top.equalTo(pizzaImageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            
            make.height.width.equalTo(50)
        }
        
        menuLabel.snp.makeConstraints{ make in
            make.bottom.equalTo(ingiImageView.snp.bottom).offset(-12)
            make.leading.equalTo(ingiImageView.snp.trailing).offset(3)
            
        }
        
        explanationLabel.snp.makeConstraints{ make in
            make.top.equalTo(ingiImageView.snp.bottom).offset(5)
            make.leading.equalTo(ingiImageView.snp.leading).offset(10)
        }
        
        showNutrientBtn.snp.makeConstraints{ make in
            make.height.equalTo(20)
            make.width.equalTo(160)
            
            make.top.equalTo(explanationLabel.snp.bottom).offset(10)
            make.leading.equalTo(explanationLabel.snp.leading).offset(5)
        }
        
        splitView1.snp.makeConstraints{ make in
            make.height.equalTo(13)
            make.width.equalToSuperview()
            make.top.equalTo(showNutrientBtn.snp.bottom).offset(15)
        }
        
        priceLabel.snp.makeConstraints{ make in
            make.top.equalTo(splitView1.snp.bottom).offset(15)
            make.leading.equalTo(explanationLabel.snp.leading)
        }
        
        essentialLabel.snp.makeConstraints{ make in
            make.height.equalTo(20)
            make.width.equalTo(40)
            
            make.bottom.equalTo(priceLabel.snp.bottom)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
        
        
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
