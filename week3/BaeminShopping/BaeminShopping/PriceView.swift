//
//  PriceView.swift
//  BaeminShopping
//
//  Created by 이동현 on 2023/10/08.
//

import UIKit
import SnapKit

class PriceView:UIView {
    lazy var contentView = UIView()
    
    lazy var priceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "가격"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var requiredLabel: UILabel = {
        let label = UILabel()
        label.text = "필수"
        label.backgroundColor = .systemBlue
        label.textColor = .blue
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        return label
    }()
    
    lazy var priceStackView: UIStackView = {
        let stkView = UIStackView()
        stkView.axis = .vertical
        stkView.spacing = 20
        return stkView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentView)
        contentView.addSubview(priceTitleLabel)
        contentView.addSubview(requiredLabel)
        contentView.addSubview(priceStackView)
        
        self.snp.makeConstraints { make in
            make.height.equalTo(10).priority(250)
        }
        
        contentView.snp.makeConstraints { make in
            make.height.equalTo(50).priority(250)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        priceTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView.snp.leading).offset(20)
        }
        
        requiredLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
            make.width.equalTo(40)
            make.height.equalTo(30)
        }
        
        priceStackView.snp.makeConstraints { make in
            make.top.equalTo(priceTitleLabel.snp.bottom).offset(20)
            make.leading
                .trailing
                .equalToSuperview()
            make.height.equalTo(20).priority(250)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PriceSelectView:UIView {
    lazy var radioBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle(nil, for: .normal)
        btn.setImage(UIImage(systemName: "circle"), for: .normal)
        return btn
    }()
    
    lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    lazy var currencyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(radioBtn)
        addSubview(sizeLabel)
        addSubview(priceLabel)
        addSubview(currencyLabel)
        self.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        radioBtn.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        sizeLabel.snp.makeConstraints { make in
            make.leading.equalTo(radioBtn.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
        }
        
        currencyLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.trailing.equalTo(currencyLabel.snp.leading)
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct PriceViewPreview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = PriceView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}

struct PriceSelectViewPreview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = PriceSelectView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
