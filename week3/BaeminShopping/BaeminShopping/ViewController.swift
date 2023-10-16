//
//  ViewController.swift
//  BaeminShopping
//
//  Created by 이동현 on 2023/10/08.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var priceView = PriceView()
    
    lazy var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "pencil")
        return imgView
    }()
    
    lazy var divideLine: UIView =  {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    lazy var storeBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor(named: "mainColor")
        btn.setTitleColor(.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 5
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        view.backgroundColor = .white
        lazy var price1 = PriceSelectView()
        lazy var price2 = PriceSelectView()
        
        view.addSubview(imgView)
        view.addSubview(priceView)
        view.addSubview(divideLine)
        view.addSubview(storeBtn)
        priceView.priceStackView.addArrangedSubview(price1)
        priceView.priceStackView.addArrangedSubview(price2)
        
        
        imgView.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.leading
                .trailing
                .equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
        
        divideLine.snp.makeConstraints { make in
            make.leading
                .trailing
                .equalToSuperview()
            make.top.equalTo(imgView.snp.bottom)
            make.height.equalTo(15)
        }
        
        priceView.snp.makeConstraints { make in
            make.leading
                .trailing
                .equalToSuperview()
            make.top.equalTo(divideLine.snp.bottom).offset(10)
        }
        
        storeBtn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        price1.sizeLabel.text = "M"
        price2.sizeLabel.text = "L"
        price1.priceLabel.text = "20000"
        price2.priceLabel.text = "30000"
        price1.currencyLabel.text = "원"
        price2.currencyLabel.text = "원"
    }

}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ViewControllerPreview: PreviewProvider{
    static var previews: some View {
        UIViewControllerPreview {
            let vc = ViewController()
            return vc
        }
    }
}
#endif
