
import UIKit
import SnapKit

class DiceView: UIView{
//    weak var delegate: RollBtnDelegate?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "주사위를 굴리세요"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
//    lazy var rollBtn: UIButton = {
//        let btn = UIButton()
//        btn.backgroundColor = .black
//        btn.setTitleColor(UIColor.white, for: .normal)
//        btn.setTitle("ROLL", for: .normal)
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.layer.masksToBounds = true
//        btn.layer.cornerRadius = 10
//        return btn
//    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(imageView)
        //        addSubview(rollBtn)
        //        rollBtn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        titleLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(150)
        }
        
        imageView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
        }
        
//        rollBtn.snp.makeConstraints { make in
//            make.width.equalTo(100)
//            make.height.equalTo(40)
//            make.centerX.equalToSuperview()
//            make.top.equalTo(imageView.snp.bottom).offset(30)
//        }
        
    }
    
//    @objc func buttonTapped(){
//        delegate?.roll()
//        print("delegate")
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//protocol RollBtnDelegate: AnyObject{
//    func roll()
//}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct DiceViewPreView: PreviewProvider{
    static var previews: some View {
        UIViewPreview {
            let view = DiceView()
            return view
        }.previewLayout(.sizeThatFits)
    }
}
#endif
