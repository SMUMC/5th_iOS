//
//  ViewController.swift
//  Chapter5_2
//
//  Created by 김영준 on 2023/10/29.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    lazy var fetchDataButton: UIButton = {
        let button = UIButton()
        button.setTitle("데이터 불러오기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(fetchDataButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(fetchDataButton)
        fetchDataButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }

    @objc func fetchDataButtonTapped() {
        let requestFile = RequestFile()
        requestFile.fetchData(self)
    }
}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {

    func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
    }
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        ViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 15 pro"))
        }

    }
} #endif

