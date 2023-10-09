//
//  PriceView.swift
//  Chapter3
//
//  Created by 김영준 on 2023/10/08.
//

import UIKit
import SnapKit

class PriceView: UIView {
    lazy var priceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "가격"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var requiredLabel: UILabel = {
        let label = UILabel()
        label.text = "필수"
        label.font = .systemFont(ofSize: 18)
        label.backgroundColor = .systemBlue
        label.textColor = .blue
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    var isMediumButtonSelected = false
    var isLargeButtonSelected = false
    
    lazy var mediumButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(mediumButtonTapped), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    lazy var largeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(largeButtonTapped), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    lazy var mLabel: UILabel = {
        let label = UILabel()
        label.text = "M"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    lazy var lLabel: UILabel = {
        let label = UILabel()
        label.text = "L"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    lazy var mValue: UILabel = {
        let label = UILabel()
        label.text = "20,000원"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    lazy var lValue: UILabel = {
        let label = UILabel()
        label.text = "30,000원"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func mediumButtonTapped() {
        isMediumButtonSelected = !isMediumButtonSelected
        mediumButton.backgroundColor = isMediumButtonSelected ? .green : .white
        if isMediumButtonSelected {
            isLargeButtonSelected = false
            largeButton.backgroundColor = .white
        }
    }

    @objc func largeButtonTapped() {
        isLargeButtonSelected = !isLargeButtonSelected
        largeButton.backgroundColor = isLargeButtonSelected ? .green : .white
        if isLargeButtonSelected {
            isMediumButtonSelected = false
            mediumButton.backgroundColor = .white
        }
    }
    
    private func setupUI(){
        self.backgroundColor = .white
        
        addSubview(priceTitleLabel)
        addSubview(requiredLabel)
        addSubview(mediumButton)
        addSubview(largeButton)
        addSubview(mLabel)
        addSubview(lLabel)
        addSubview(mValue)
        addSubview(lValue)
        
        priceTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.leading.equalTo(self.snp.leading).offset(10)
        }
        
        requiredLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.trailing.equalTo(self.snp.trailing).offset(-10)
        }
        
        mediumButton.snp.makeConstraints { make in
            make.top.equalTo(priceTitleLabel.snp.bottom).offset(27)
            make.leading.equalTo(self.snp.leading).offset(10)
            make.width.height.equalTo(20)
        }
        
        largeButton.snp.makeConstraints { make in
            make.top.equalTo(mLabel.snp.bottom).offset(27)
            make.leading.equalTo(self.snp.leading).offset(10)
            make.width.height.equalTo(20)
        }
        
        mLabel.snp.makeConstraints { make in
            make.top.equalTo(priceTitleLabel.snp.bottom).offset(25)
            make.leading.equalTo(mediumButton.snp.leading).offset(30)
        }
        
        lLabel.snp.makeConstraints { make in
            make.top.equalTo(mLabel.snp.bottom).offset(25)
            make.leading.equalTo(largeButton.snp.leading).offset(30)
        }
        mValue.snp.makeConstraints { make in
            make.top.equalTo(priceTitleLabel.snp.bottom).offset(25)
            make.trailing.equalTo(self.snp.trailing).offset(-10)
        }
        lValue.snp.makeConstraints { make in
            make.top.equalTo(mLabel.snp.bottom).offset(25)
            make.trailing.equalTo(self.snp.trailing).offset(-10)
        }
        
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
#endif
