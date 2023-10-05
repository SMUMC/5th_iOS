//
//  DiceView.swift
//  RandomDice
//
//  Created by 이현호 on 2023/10/05.
//

import UIKit
import SnapKit

class DiceView: UIView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "주사위를 굴리세요"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var diceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(diceImageView)
        
        titleLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(150)
        }
        
        diceImageView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.width.equalTo(200)
            make.height.equalTo(200)
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

