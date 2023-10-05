//
//  ItemTableViewCell.swift
//  Dangguen
//
//  Created by 이동현 on 2023/10/05.
//

import UIKit
import SnapKit

class ItemTableViewCell: UITableViewCell {

    lazy var imgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "pencil")
        return imgView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "판매글 제목"
        return label
    }()
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "수원시 영통구"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        label.text = "1일 전"
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "가격"
        return label
    }()
    
    lazy var reserveLabel: UILabel = {
        let label = UILabel()
        label.text = "예약중"
        label.font = UIFont.systemFont(ofSize: 10)
        label.backgroundColor = .systemGreen
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        return label
    }()
    
    lazy var locationStkView: UIStackView = {
        let stkView = UIStackView()
        stkView.axis = .horizontal
        stkView.spacing = 3
        stkView.distribution = .fill
        return stkView
    }()
    
    lazy var priceStkView: UIStackView = {
        let stkView = UIStackView()
        stkView.axis = .horizontal
        stkView.spacing = 3
        stkView.distribution = .fill
        return stkView
    }()
    
    lazy var commentStkView: UIStackView = {
        let stkView = UIStackView()
        stkView.axis = .horizontal
        stkView.spacing = 3
        stkView.distribution = .fill
        return stkView
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
    
    lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        label.text = "3"
        return label
    }()
    
    lazy var likeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .gray
        label.text = "10"
        return label
    }()
    
    lazy var containerView = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(containerView)
        containerView.addSubview(imgView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(locationStkView)
        containerView.addSubview(priceStkView)
        containerView.addSubview(commentStkView)
        locationStkView.addArrangedSubview(locationLabel)
        locationStkView.addArrangedSubview(dateLabel)
        priceStkView.addArrangedSubview(reserveLabel)
        priceStkView.addArrangedSubview(priceLabel)
        commentStkView.addArrangedSubview(commentImg)
        commentStkView.addArrangedSubview(commentLabel)
        commentStkView.addArrangedSubview(likeImg)
        commentStkView.addArrangedSubview(likeLabel)
        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        imgView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.top.equalTo(containerView.snp.top).offset(20)
            make.bottom.equalTo(containerView.snp.bottom).offset(-20)
            make.leading.equalTo(containerView.snp.leading).offset(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imgView.snp.top)
            make.leading.equalTo(imgView.snp.trailing).offset(20)
            make.trailing.equalTo(containerView.snp.trailing).offset(20)
        }
        
        locationStkView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(imgView.snp.trailing).offset(20)
            make.width.equalTo(10).priority(250)
            make.height.equalTo(15)
        }
        
        priceStkView.snp.makeConstraints { make in
            make.top.equalTo(locationStkView.snp.bottom).offset(5)
            make.leading.equalTo(imgView.snp.trailing).offset(20)
            make.width.equalTo(10).priority(250)
            make.height.equalTo(20)
        }
        
        reserveLabel.snp.makeConstraints { make in
            make.width.equalTo(35)
        }
        
        commentStkView.snp.makeConstraints { make in
            make.trailing.equalTo(containerView.snp.trailing).offset(-20)
            make.bottom.equalTo(imgView)
            make.width.equalTo(10).priority(250)
            make.height.equalTo(20)
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
