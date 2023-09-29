
import UIKit
import SnapKit

class ViewController: UIViewController{
    var diceModel = DiceModel()
    var diceView = DiceView()
    
        lazy var rollBtn: UIButton = {
            let btn = UIButton()
            btn.backgroundColor = .black
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.setTitle("ROLL", for: .normal)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.layer.masksToBounds = true
            btn.layer.cornerRadius = 10
            return btn
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        diceView.delegate = self
        makeUI()
        
        rollBtn.addTarget(self, action: #selector(rollBtnTapped), for: .touchUpInside)
    }
    
    func makeUI(){
        self.view.addSubview(diceView)
        self.view.addSubview(rollBtn)
        
        diceView.imageView.image = diceModel.getDice1Img()
        diceView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        rollBtn.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(diceView.imageView.snp.bottom).offset(30)
        }
    }
    
    @objc func rollBtnTapped(){
        diceModel.rollDice1()
        updateUI()
    }
    
    func updateUI(){
        diceView.imageView.image = diceModel.getDice1Img()
        diceView.titleLabel.text = "결과: \(diceModel.dice1Value)"
    }
}

//extension ViewController: RollBtnDelegate{
//    func roll() {
//        diceModel.rollDice1()
//        diceView.imageView.image = diceModel.getDice1Img()
//        print("roll")
//    }
//}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct VCPreview: PreviewProvider {
    static var previews: some View {
        ViewController().showPreview(.iPhone15Pro)
    }
}
#endif
