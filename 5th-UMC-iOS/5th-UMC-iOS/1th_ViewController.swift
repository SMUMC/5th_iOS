//
//  1th_ViewController.swift
//  5th-UMC-iOS
//
//  Created by 황인성 on 2023/09/25.
//

import UIKit
import SwiftUI
import SnapKit

class Study1WeekViewController: UIViewController {

//    lazy var changeLocationBtn = { () -> UIButton in
//        let btn = UIButton(type: .system)
//        btn.setTitle("픽업매장 선택 >", for: .normal)
//        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        btn.setTitleColor(UIColor.black, for: .normal)
//        btn.backgroundColor = .white
//        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
//        return btn
//    }()
    
    lazy var createButtonWithText: (String) -> UIButton = { buttonText in
        let btn = UIButton(type: .system)
        btn.setTitle(buttonText, for: .normal)
        btn.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        btn.layer.cornerRadius = 10
        return btn
    }
    
    lazy var createButtonWithText2: (String, Int) -> UIButton = { buttonText, textSize  in
        let btn = UIButton(type: .system)
        btn.setTitle(buttonText, for: .normal)
        btn.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .lightGray
        btn.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(textSize))
        btn.layer.cornerRadius = 10
        return btn
    }
    
//    lazy var createButtonWithTextAndImage: (String, UIImage) -> UIButton = { buttonText, buttonImage in
//        let btn = UIButton(type: .system)
//
//        // 이미지 설정
//        btn.setImage(buttonImage, for: .normal)
//
//        // 텍스트 설정
//        btn.setTitle(buttonText, for: .normal)
//        btn.setTitleColor(UIColor.black, for: .normal)
//        btn.titleLabel?.font = UIFont.systemFont(ofSize: 10)
//
//        // 이미지와 텍스트 간격 조정
//            btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -20, right: 0)
//            btn.titleEdgeInsets = UIEdgeInsets(top: 20, left: -buttonImage.size.width, bottom: 0, right: 0)
//
//        // 버튼 크기 설정 (텍스트와 이미지에 따라 조절해야 할 수도 있습니다)
//        btn.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
//
//        btn.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
//
//        return btn
//    }
    
//    lazy var createButtonWithTextAndImage: (String, UIImage) -> UIButton = { buttonText, buttonImage in
//        let btn = UIButton(type: .system)
//
//        // 이미지 설정
//        btn.setImage(buttonImage, for: .normal)
//
//        // 텍스트 설정
//        btn.setTitle(buttonText, for: .normal)
//        btn.setTitleColor(UIColor.black, for: .normal)
//        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
//
//        // 이미지와 텍스트 간격 조정
//        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -20, right: 0)
//        btn.titleEdgeInsets = UIEdgeInsets(top: 20, left: -buttonImage.size.width, bottom: 0, right: 0)
//
//        // 버튼 크기 설정 (텍스트와 이미지에 따라 조절해야 할 수도 있습니다)
//        btn.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
//
//        btn.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
//
//        return btn
//    }
    
    lazy var createRoundButtonWithTextAndImage: (String, UIImage?) -> UIButton = { [unowned self] buttonText, image in
        let btn = UIButton(type: .system)
        btn.setTitle(buttonText, for: .normal)
        btn.setImage(image, for: .normal) // Set the button's image
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .yellow
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        // Make the button round by setting cornerRadius
        btn.layer.cornerRadius = 10
        
        // Add some padding between the image and the title
        btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        
        return btn
    }
    
    lazy var createButtonWithAdjustedImageSize: (String, UIImage?, CGSize) -> UIButton = { [unowned self] buttonText, image, imageSize in
        let btn = UIButton(type: .system)
        btn.setTitle(buttonText, for: .normal)
        
        if let image = image {
            // Set the button's image
            btn.setImage(image, for: .normal)
            
            // Set the content mode to control how the image is scaled within the button
            btn.imageView?.contentMode = .scaleAspectFit // Adjust the content mode as needed
            
            // Set the image size within the button
            let imageInset: CGFloat = 10 // Adjust the inset as needed
            btn.imageEdgeInsets = UIEdgeInsets(top: imageInset, left: imageInset, bottom: imageInset, right: imageInset)
            
            //        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -20, right: 0)
            //        btn.titleEdgeInsets = UIEdgeInsets(top: 20, left: -buttonImage.size.width, bottom: 0, right: 0)
        }
        //        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -20, right: 0)
        //        btn.titleEdgeInsets = UIEdgeInsets(top: 20, left: -buttonImage.size.width, bottom: 0, right: 0)
        btn.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        // Make the button round by setting cornerRadius
        btn.layer.cornerRadius = 10
        
        return btn
    }
    
    lazy var imageView: UIImageView = {
            let imageView = UIImageView()
//            imageView.contentMode = .scaleAspectFit // Adjust the content mode as needed
            return imageView
        }()
    
    


    // 사용 예제:
    


    

    // 사용 예제:
//    let changeLocationBtn = createButtonWithText("픽업매장 선택 >")

    
    @objc func buttonTapped() {
        // 버튼이 눌렸을 때 실행할 코드
        print("버튼이 눌렸습니다.")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemGray4
        
        let adBtn = createButtonWithText("편의점 픽업하면 4천원 할인!")
        let deliveryBtn = createButtonWithText("배달")
        let bMartBtn = createButtonWithText("B마트")
        let storeBtn = createButtonWithText("배민스토어")
        let whiteView = UIView()
        whiteView.backgroundColor = UIColor.white
        whiteView.layer.cornerRadius = 10
        let naviBtn = createButtonWithText("알뜰 한집배달 배민1 원하는 대로 골라 주문!")
        let categotyBtn1 = createButtonWithText2("알뜰배달", 15)
        let categotyBtn2 = createButtonWithText2("돈까스,회", 15)
        let categotyBtn3 = createButtonWithText2("피자", 15)
        let categotyBtn4 = createButtonWithText2("중식", 15)
        let categotyBtn5 = createButtonWithText2("치킨", 15)
        let categotyBtn6 = createButtonWithText2("버거", 15)
        let categotyBtn7 = createButtonWithText2("분식", 15)
        let categotyBtn8 = createButtonWithText2("디저트", 15)
        let categotyBtn9 = createButtonWithText2("족발", 15)
        let categotyBtn10 = createButtonWithText2("전체보기", 15)
        let categotyBtn11 = createButtonWithText2("예시", 15)
        
//        let categoryBtn1 = createButtonWithAdjustedImageSize("알뜰배달", UIImage(named: "myImage")!, CGSize(width: 60, height: 60))
        
        self.view.addSubview(adBtn)
        self.view.addSubview(deliveryBtn)
        self.view.addSubview(bMartBtn)
        self.view.addSubview(storeBtn)
        self.view.addSubview(whiteView)
        self.view.addSubview(naviBtn)
//        self.view.addSubview(categoryBtn1)
        
        self.view.addSubview(categotyBtn1)
        self.view.addSubview(categotyBtn2)
        self.view.addSubview(categotyBtn3)
        self.view.addSubview(categotyBtn4)
        self.view.addSubview(categotyBtn5)
        self.view.addSubview(categotyBtn6)
        self.view.addSubview(categotyBtn7)
        self.view.addSubview(categotyBtn8)
        self.view.addSubview(categotyBtn9)
        self.view.addSubview(categotyBtn10)
        self.view.addSubview(categotyBtn11)
        self.view.addSubview(imageView)
        
        
        adBtn.snp.makeConstraints{ (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(5)
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
        }
        
        deliveryBtn.snp.makeConstraints { make in
            make.top.equalTo(adBtn.snp.bottom).offset(20)
            make.leading.equalTo(adBtn.snp.leading)
            make.width.height.equalTo(100)
        }
        
        bMartBtn.snp.makeConstraints { make in
            make.top.equalTo(deliveryBtn.snp.top)
            make.centerX.equalTo(adBtn.snp.centerX)
            make.width.height.equalTo(100)
        }
        
        storeBtn.snp.makeConstraints { make in
            make.top.equalTo(deliveryBtn.snp.top)
            make.trailing.equalTo(adBtn.snp.trailing)
            make.width.height.equalTo(100)
        }
        
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(deliveryBtn.snp.bottom).offset(20)
            make.width.equalTo(350)
            make.centerX.equalTo(adBtn.snp.centerX)
            make.height.equalTo(250)
        }
        
        naviBtn.snp.makeConstraints { make in
            make.top.equalTo(whiteView.snp.top).offset(5)
            make.centerX.equalToSuperview()
        }
        
        categotyBtn1.snp.makeConstraints { make in
            make.top.equalTo(naviBtn.snp.bottom).offset(10)
            make.leading.equalTo(whiteView.snp.leading).offset(25)
        }
        
        categotyBtn2.snp.makeConstraints { make in
            make.top.equalTo(categotyBtn1.snp.top)
            make.leading.equalTo(categotyBtn1.snp.trailing).offset(25)
        }
        
        categotyBtn3.snp.makeConstraints { make in
            make.top.equalTo(categotyBtn1.snp.top)
            make.leading.equalTo(categotyBtn2.snp.trailing).offset(25)
        }
        
        categotyBtn4.snp.makeConstraints { make in
            make.top.equalTo(categotyBtn1.snp.top)
            make.leading.equalTo(categotyBtn3.snp.trailing).offset(25)
        }
        
        categotyBtn5.snp.makeConstraints { make in
            make.top.equalTo(categotyBtn1.snp.top)
            make.leading.equalTo(categotyBtn4.snp.trailing).offset(25)
        }
        
        categotyBtn6.snp.makeConstraints { make in
            make.top.equalTo(categotyBtn1.snp.bottom).offset(20)
            make.centerX.equalTo(categotyBtn1.snp.centerX)
        }
        
        categotyBtn7.snp.makeConstraints { make in
            make.top.equalTo(categotyBtn6.snp.top)
            make.centerX.equalTo(categotyBtn2.snp.centerX)
        }
        
        categotyBtn8.snp.makeConstraints { make in
            make.top.equalTo(categotyBtn6.snp.top)
            make.centerX.equalTo(categotyBtn3.snp.centerX)
        }
        
        categotyBtn9.snp.makeConstraints { make in
            make.top.equalTo(categotyBtn6.snp.top)
            make.centerX.equalTo(categotyBtn4.snp.centerX)
        }
        
        categotyBtn10.snp.makeConstraints { make in
            make.top.equalTo(categotyBtn6.snp.top)
            make.centerX.equalTo(categotyBtn5.snp.centerX)
        }
        
//        categoryBtn1.snp.makeConstraints { make in
//            make.top.equalTo(naviBtn.snp.bottom).offset(5)
//        }
        
        categotyBtn11.snp.makeConstraints { make in
            make.top.equalTo(categotyBtn6.snp.bottom).offset(50)
//            make.centerX.equalTo(categotyBtn6.snp.centerX)
            make.centerX.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(whiteView.snp.bottom).offset(20)
            make.width.equalTo(350)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
        }
        
        setImageWithName("adBlock")
    }
    
    
    func setImageWithName(_ imageName: String) {
            if let image = UIImage(named: imageName) {
                imageView.image = image
            }
        }
}

#if DEBUG
import SwiftUI
struct Study1WeekViewControllerRepresentable: UIViewControllerRepresentable {
    
    func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
    }
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        Study1WeekViewController()
    }
}
@available(iOS 13.0, *)
struct Study1WeekViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            Study1WeekViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 pro"))
        }
    }
} #endif

