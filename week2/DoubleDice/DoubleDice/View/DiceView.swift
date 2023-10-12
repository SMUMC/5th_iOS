//
//  DiceView.swift
//  DoubleDice
//
//  Created by 이현호 on 2023/10/12.
//

import UIKit
import SnapKit

class DiceView: UIView{
    
    var diceImageViews: UIStackView!
    
    lazy var diceImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "black1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var diceImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "black3")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var guideLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.text = "주사위를 굴리세요"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        diceImageViews = {
            let stackView = UIStackView(arrangedSubviews: [self.diceImageView1, self.diceImageView2])
            stackView.spacing = 30
            stackView.sizeToFit()
            stackView.layer.borderColor = CGColor.init(gray: 1, alpha: 0)
            stackView.layer.borderWidth = 10
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            return stackView
        }()
        
  
        addSubview(guideLabel)
        addSubview(diceImageViews)
        
        
        guideLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
        }
        
        diceImageView1.snp.makeConstraints{ make in
            make.width.height.equalTo(150)
        }
        
        diceImageView2.snp.makeConstraints{ make in
            make.width.height.equalTo(150)
        }
    
        diceImageViews.snp.makeConstraints{ make in
//            make.width.equalTo(400)
//            make.height.equalTo(150)
            make.top.equalTo(guideLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            
        }
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct DiceViewPreview: PreviewProvider{
    static var previews: some View{
        UIViewPreview{
            let view = DiceView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
