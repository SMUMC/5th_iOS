//
//  DiceView.swift
//  DoubleDice
//
//  Created by 이동현 on 2023/10/03.
//

import Foundation
import UIKit
import SnapKit

class DiceView: UIView{
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "주사위를 굴리세요"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    lazy var diceStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 20
        return sv
    }()
    
    lazy var diceImg1 = UIImageView(image: UIImage(systemName: "pencil"))
    lazy var diceImg2 = UIImageView(image: UIImage(systemName: "pencil"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        diceStackView.addArrangedSubview(diceImg1)
        diceStackView.addArrangedSubview(diceImg2)
        addSubview(diceStackView)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(150)
        }
        
        diceStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(150)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//#if canImport(SwiftUI) && DEBUG
//import SwiftUI
//struct DiceViewPreView: PreviewProvider{
//    static var previews: some View {
//        UIViewPreview {
//            let view = DiceView()
//            return view
//        }.previewLayout(.sizeThatFits)
//    }
//}
//#endif
