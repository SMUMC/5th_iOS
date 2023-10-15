//
//  SizeView.swift
//  Baemin
//
//  Created by 이현호 on 2023/10/12.
//

import UIKit

class SizeView: UIView{
    
    var containerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    var button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .lightGray
        return button
    }()
    
    var sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "M"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "20,000원"
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(containerView)
        containerView.addSubview(button)
        containerView.addSubview(sizeLabel)
        containerView.addSubview(priceLabel)
        
        containerView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(40)
            
            make.top.equalToSuperview()
        }
        
        button.snp.makeConstraints{ make in
            make.width.height.equalTo(25)
            
            make.top.equalToSuperview().offset(7)
            make.leading.equalToSuperview().offset(20)
        }
        
        sizeLabel.snp.makeConstraints{ make in
            make.leading.equalTo(button.snp.trailing).offset(5)
            make.top.equalToSuperview().offset(10)
        }
        
        priceLabel.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(10)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

import SwiftUI

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SizeViewPreview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = SizeView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
