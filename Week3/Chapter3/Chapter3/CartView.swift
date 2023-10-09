//
//  CartView.swift
//  Chapter3
//
//  Created by 김영준 on 2023/10/08.
//

import UIKit
import SnapKit

class CartView: UIView {
    lazy var cartButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        return button
    }()
    
    lazy var cartLabel: UILabel = {
        let label = UILabel()
        label.text = "20,000원 담기"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        self.backgroundColor = .white
        
        addSubview(cartButton)
        addSubview(cartLabel)
        
        cartButton.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.width.equalTo(200)
            make.top.equalTo(self).offset(10)
            make.bottom.equalTo(self).offset(-10)
        }
        
        cartLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
    }
    
}
