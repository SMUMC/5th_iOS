//
//  ShoppingBasketViewController.swift
//  Baemin
//
//  Created by 이현호 on 2023/10/16.
//

import UIKit
import SnapKit

class ShoppingBasketViewController: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "hello world"
        return label
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        
        label.snp.makeConstraints{ make in
            make.width.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
    }
}
#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ShoppingBasketVCPreview: PreviewProvider {
    static var previews: some View {
        ShoppingBasketViewController().showPreView(.iPhone15Pro)
    }
}
#endif
