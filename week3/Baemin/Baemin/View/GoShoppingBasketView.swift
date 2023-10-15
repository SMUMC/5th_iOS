import UIKit
import SnapKit

class GoShoppingBasketView: UIView{
    
    lazy var containerView: UIView = UIView()
    
    lazy var priceGuideLabel: UILabel = {
        let label = UILabel()
        label.text = "최소주문금액"
        label.textColor = .gray
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    
    lazy var atLeastPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "17,000원"
        label.textColor = .black
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 10)
        return label
    }()
    
    lazy var goShoppingBasketBtn: UIButton = {
        let button = UIButton()
        button.setTitle("20,000원 담기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemCyan
        return button
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(containerView)
        containerView.addSubview(priceGuideLabel)
        containerView.addSubview(atLeastPriceLabel)
        containerView.addSubview(goShoppingBasketBtn)
        
        containerView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        
        priceGuideLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(15)
        }
        
        atLeastPriceLabel.snp.makeConstraints{ make in
            make.top.equalTo(priceGuideLabel.snp.bottom).offset(5)
            make.leading.equalToSuperview().offset(15)
        }
        
        goShoppingBasketBtn.snp.makeConstraints{ make in
            make.height.equalTo(40)
            make.width.equalTo(250)
            make.top.equalToSuperview()
            
            make.trailing.equalToSuperview().offset(-15)
            
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

import SwiftUI

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct GoShoppingBasketViewPreview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = GoShoppingBasketView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
