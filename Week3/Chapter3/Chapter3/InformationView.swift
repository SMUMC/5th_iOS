//
//  InformationView.swift
//  Chapter3
//
//  Created by 김영준 on 2023/10/08.
//

import UIKit
import SnapKit

class InformationView: UIView {
    lazy var informationTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "[재주문1위] 바싹불고기피자"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "바싹 익힌 불고기의 풍미를 입안 가득 느낄 수 있는 자가제빵선명희피자의 야심작"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .lightGray
        label.numberOfLines = 2
        return label
    }()
    
    lazy var allergyLabel: UILabel = {
        let label = UILabel()
        label.text = "영양성분 및 알레르기성분 표시 보기"
        label.backgroundColor = .systemGray6
        label.layer.cornerRadius = 50
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
        
    private func setupUI() {
        addSubview(informationTitleLabel)
        addSubview(contentLabel)
        addSubview(allergyLabel)
        
        self.backgroundColor = .white
        
        informationTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(informationTitleLabel.snp.bottom).offset(10)
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
        }
        
        allergyLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(10)
            make.leading.equalTo(self).offset(10)
//            make.trailing.equalTo(self).offset(-10)
        }
    }
    

}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct informationViewPreview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = InformationView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
