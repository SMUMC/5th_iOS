//
//  SizeView.swift
//  Baemin
//
//  Created by 이현호 on 2023/10/12.
//

import UIKit

class SizeView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        
    }
    
}

import SwiftUI

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ItemTableViewCellPreview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = SizeView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
