import UIKit
import SnapKit

class TopView: UIView {
    
    lazy var containerView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

import SwiftUI

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct TopViewPreview: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = TopView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
