//
//  ViewController.swift
//  Chapter3
//
//  Created by 김영준 on 2023/10/08.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let contentView = UIView()
    let imageView = UIImageView()
    lazy var informationView = InformationView()
    lazy var priceView = PriceView()
    lazy var cartView = CartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "Pizza")
        
        cartView.cartButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
       
        setupUI()
    }
    
    @objc func cartButtonTapped() {
        let resultViewController = ResultViewController()
        let mediumButtonSelected = priceView.isMediumButtonSelected
        let largeButtonSelected = priceView.isLargeButtonSelected
        resultViewController.didSelectButtons(mediumSelected: mediumButtonSelected, largeSelected: largeButtonSelected)
        
        present(resultViewController, animated: true, completion: nil)
    }
    
    private func setupUI(){
        self.view.backgroundColor = .systemGray6
        self.view.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        let views: [UIView] = [imageView, informationView, priceView, cartView]
        _ = views.map { self.contentView.addSubview($0) }

        imageView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(0)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.height / 4 )
        }
        
        informationView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(150)
        }
        
        priceView.snp.makeConstraints { make in
            make.top.equalTo(informationView.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(150)
        }
        
        cartView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        
    }

}
//
//
//#if DEBUG
//import SwiftUI
//struct ViewControllerRepresentable: UIViewControllerRepresentable {
//    
//    func updateUIViewController(_ uiView: UIViewController,context: Context) {
//        // leave this empty
//    }
//    @available(iOS 13.0.0, *)
//    func makeUIViewController(context: Context) -> UIViewController{
//        ViewController()
//    }
//}
//@available(iOS 13.0, *)
//struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ViewControllerRepresentable()
//                .ignoresSafeArea()
//                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
//                .previewDevice(PreviewDevice(rawValue: "iPhone 14 pro"))
//        }
//        
//    }
//} #endif
