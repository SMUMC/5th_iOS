//
//  ViewController.swift
//  Chapter2
//
//  Created by 김영준 on 2023/10/03.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    static let identifier = "ViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let tableViewController = MyTableViewController()
        addChild(tableViewController)
        scrollView.addSubview(tableViewController.view)
        tableViewController.didMove(toParent: self)
        
        tableViewController.view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(1.5) // 스크롤 가능한 높이로 설정 (예: 화면 높이의 1.5배)
        }
        
        let imageButton = UIButton(type: .custom)
        imageButton.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        imageButton.addTarget(self, action: #selector(listButtonTapped), for: .touchUpInside)
        let imageButton2 = UIButton(type: .custom)
        imageButton2.setImage(UIImage(systemName: "bell"), for: .normal)
        imageButton2.addTarget(self, action: #selector(listButtonTapped), for: .touchUpInside)
    
        let editButton = UIBarButtonItem(title: "광명동", style: .plain, target: self, action: #selector(mapButtonTapped))
        let listButton = UIBarButtonItem(customView: imageButton)
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonTapped))
        let bellButton = UIBarButtonItem(customView: imageButton2)
        navigationItem.leftBarButtonItem = editButton
        navigationItem.rightBarButtonItems = [bellButton, searchButton, listButton]
    }
    
    @objc func mapButtonTapped() {
        
    }
    
    @objc func listButtonTapped() {
        
    }
    
    @objc func searchButtonTapped() {
        
    }
    
    @objc func bellButtonTapped() {
        
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
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 pro"))
        }
        
    }
} #endif
