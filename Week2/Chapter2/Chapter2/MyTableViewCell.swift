//
//  MyTableView.swift
//  Chapter2
//
//  Created by 김영준 on 2023/10/03.
//

import UIKit
import SnapKit

class MyTableViewCell: UITableViewCell {
    static let identifier = "MyTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
