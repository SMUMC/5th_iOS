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
    let contentView: UIView! = {
        let view = UIView()
        return view
    }()
    var price = 0
    
    lazy var testButton: UIButton = {
        let button = UIButton()
        button.setTitle("test", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        return button
    }()
    
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
    
    lazy var splitView2: UIView = {
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
        label.layer.backgroundColor = UIColor.systemCyan.cgColor
        
        label.text = "필수"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var sizeView1: SizeView = {
        let view = SizeView()
        view.button.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
        view.button.isUserInteractionEnabled = true
        
        return view
    }()
    
    lazy var sizeView2: SizeView = {
        let view = SizeView()
        view.priceLabel.text = "23,000원"
        view.sizeLabel.text = "L"
        return view
    }()

    lazy var changeDoughLabel: UILabel = {
        let label = UILabel()
        label.text = "도우 변경"
        label.textColor = .black
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var guideLabel: UILabel = {
        let label = UILabel()
        label.text = "최대 1개 선택"
        label.textColor = .gray
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    
    lazy var notEssentialLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 10
        label.layer.backgroundColor = UIColor.systemGray6.cgColor
        
        label.text = "선택"
        label.textColor = .gray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var doughView: SizeView = {
        let view = SizeView()
        view.priceLabel.text = "+4,500원"
        view.sizeLabel.text = "크림리치골드 크러스트"
        return view
    }()

    lazy var bottomView = GoShoppingBasketView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setScrollView()
        self.buttonSet()
        view.backgroundColor = .white
//        sizeView1.button.addTarget(self, action:  #selector(btnTapped(_:)), for: .touchUpInside)
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
        contentView.addSubview(sizeView1)
        contentView.addSubview(sizeView2)
        contentView.addSubview(splitView2)
        contentView.addSubview(changeDoughLabel)
        contentView.addSubview(guideLabel)
        contentView.addSubview(notEssentialLabel)
        contentView.addSubview(doughView)
        contentView.addSubview(testButton)
        view.addSubview(bottomView)
    
        
        bottomView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(40)
            
            make.bottom.equalToSuperview().offset(-20)
        }
        
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
//            make.height.equalTo(1000)
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
            make.bottom.equalTo(ingiImageView.snp.bottom)
            make.leading.equalTo(ingiImageView.snp.trailing).offset(3)
            
            make.height.equalTo(50)
        }
        
        explanationLabel.snp.makeConstraints{ make in
            make.top.equalTo(ingiImageView.snp.bottom).offset(5)
            make.leading.equalTo(ingiImageView.snp.leading).offset(10)
            
            make.height.equalTo(30)
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
            make.width.equalToSuperview()
            make.height.equalTo(20)
            make.top.equalTo(splitView1.snp.bottom).offset(15)
            make.leading.equalTo(explanationLabel.snp.leading)
        }
        
        essentialLabel.snp.makeConstraints{ make in
            make.height.equalTo(20)
            make.width.equalTo(40)
            
            make.bottom.equalTo(priceLabel.snp.bottom)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        sizeView1.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(40)
            
            make.top.equalTo(priceLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview()
        }
        
        sizeView2.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(40)
            
            make.top.equalTo(sizeView1.containerView.snp.bottom)
            make.leading.equalToSuperview()
        }
        
        splitView2.snp.makeConstraints{ make in
            make.height.equalTo(13)
            make.width.equalToSuperview()
            make.top.equalTo(sizeView2.containerView.snp.bottom).offset(15)
        }
        
        changeDoughLabel.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(20)
            
            make.top.equalTo(splitView2.snp.bottom).offset(15)
            make.leading.equalTo(priceLabel.snp.leading)
        }
        
        guideLabel.snp.makeConstraints{ make in
            make.height.equalTo(20)
            
            make.top.equalTo(changeDoughLabel.snp.bottom).offset(3)
            make.leading.equalTo(priceLabel.snp.leading)
        }
        
        notEssentialLabel.snp.makeConstraints{ make in
            make.height.equalTo(20)
            make.width.equalTo(40)
            
            make.bottom.equalTo(changeDoughLabel.snp.bottom)
            make.leading.equalTo(essentialLabel.snp.leading)
        }
        
        doughView.snp.makeConstraints{ make in
            make.height.equalTo(40)
            make.width.equalToSuperview()
            make.top.equalTo(guideLabel.snp.bottom)
        }
        

        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultLow
        contentViewHeight.isActive = true
    }
    
    func buttonSet(){
        self.sizeView1.button.addTarget(self, action:  #selector(btnTapped(_:)), for: .touchUpInside)
        self.sizeView2.button.addTarget(self, action:  #selector(btnTapped(_:)), for: .touchUpInside)
        self.doughView.button.addTarget(self, action:  #selector(btnTapped(_:)), for: .touchUpInside)
        
        self.bottomView.goShoppingBasketBtn.addTarget(self, action: #selector(goShoppingBasket), for: .touchUpInside)
        print("buttonSet in")
    }
    
    @objc func goShoppingBasket() {
        let viewController = ShoppingBasketViewController()
        viewController.label.text = "\(self.price)원"
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    @objc func btnTapped(_ sender: UIButton){
        print("btnTapped in")
        
        if sender.imageView?.image == UIImage(systemName: "circle"){
            print("if")
            sender.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            sender.tintColor = .systemCyan
            
            switch sender {
            case self.sizeView1.button :
                self.price = self.price + 20000
            case self.sizeView2.button :
                self.price = self.price + 23000
            case self.doughView.button :
                self.price = self.price + 4500
            default :
                self.price
            }
            
        }else{
            print("else")
            sender.setImage(UIImage(systemName: "circle"), for: .normal)
            sender.tintColor = .gray
            
            switch sender {
            case self.sizeView1.button :
                self.price = self.price - 20000
            case self.sizeView2.button :
                self.price = self.price - 23000
            case self.doughView.button :
                self.price = self.price - 4500
            default :
                self.price
            }
        }
        
        print("price = \(price)")
        self.bottomView.goShoppingBasketBtn.setTitle("\(price)원 담기", for: .normal)
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
