//
//  TableViewCell.swift
//  Danggeun
//
//  Created by 이현호 on 2023/10/11.
//

import UIKit
import SnapKit

class ItemTableViewCell: UITableViewCell {
    lazy var containerView = UIView()
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "애어팟 맥스 판매합니다"
        return label
    }()
    
    lazy var productImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(systemName: "airpodsmax")
        imageView.tintColor = .orange
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    lazy var locationLabel: UILabel = {
        var label = UILabel()
        label.text = "서대문구 홍제동 · "
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        var label = UILabel()
        label.text = "6일전"
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    lazy var reserveLabel: UILabel = {
        var label = UILabel()
        
        label.layer.cornerRadius = 10
        label.backgroundColor = .systemGreen
       
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "예약중"
        
        
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        var label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textAlignment = .center
        label.textColor = .black
        label.text = "390,000 원"
        return label
    }()
    
    lazy var commentImg: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "message")
        imgView.tintColor = .gray
        return imgView
    }()
    
    lazy var likeImg: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "heart")
        imgView.tintColor = .gray
        return imgView
    }()
    
    lazy var likeCountLabel: UILabel = {
        let label = UILabel()
        label.text = "77"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemGray
        return label
    }()
    
    lazy var commentCountLabel: UILabel = {
        let label = UILabel()
        label.text = "36"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .systemGray
        return label
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(productImageView)
        containerView.addSubview(locationLabel)
        containerView.addSubview(dateLabel)
        containerView.addSubview(reserveLabel)
        containerView.addSubview(reserveLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(commentImg)
        containerView.addSubview(likeImg)
        containerView.addSubview(likeCountLabel)
        containerView.addSubview(commentCountLabel)
        
        containerView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(productImageView.snp.trailing).offset(10)
        }
        
        productImageView.snp.makeConstraints{ make in
            make.width.height.equalTo(90)
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(10)
        }
        
        locationLabel.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        dateLabel.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.leading.equalTo(locationLabel.snp.trailing)
        }
        
        reserveLabel.snp.makeConstraints{ make in
            make.width.equalTo(35)
            make.height.equalTo(15)
            
            make.top.equalTo(dateLabel.snp.bottom).offset(5)
            make.leading.equalTo(titleLabel.snp.leading)
        }
        
        priceLabel.snp.makeConstraints{ make in
            make.top.equalTo(dateLabel.snp.bottom).offset(5)
            make.leading.equalTo(reserveLabel.snp.trailing).offset(5)
        }
        
        commentImg.snp.makeConstraints{ make in
            make.width.height.equalTo(17)
            
            make.bottom.equalTo(productImageView.snp.bottom)
            make.trailing.equalTo(commentCountLabel.snp.leading).offset(-3)
            
        }
        
        commentCountLabel.snp.makeConstraints{ make in
            make.trailing.equalTo(likeImg.snp.leading).offset(-3)
            make.bottom.equalTo(productImageView.snp.bottom)
        }
        
        likeImg.snp.makeConstraints{ make in
            make.width.height.equalTo(20)
            
            make.bottom.equalTo(productImageView.snp.bottom)
            make.trailing.equalTo(likeCountLabel.snp.leading).offset(-3)
        }
        
        likeCountLabel.snp.makeConstraints{ make in
            make.bottom.equalTo(productImageView.snp.bottom)
            make.trailing.equalTo(containerView.snp.trailing).offset(-20)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ItemTableViewCellPreview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = ItemTableViewCell()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
