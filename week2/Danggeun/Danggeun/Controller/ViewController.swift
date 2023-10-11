//
//  ViewController.swift
//  Danggeun
//
//  Created by 이현호 on 2023/10/11.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var tableView: UITableView!
    var writingBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setNavigation()
    }
    
    func setUp(){
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 120
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "itemCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        
        writingBtn = {
            let button = UIButton()
            button.layer.cornerRadius = 25
            button.backgroundColor = .systemOrange
            button.setImage(UIImage(systemName: "plus"), for: .normal)
            button.tintColor = .white
            return button
        }()
        
        view.addSubview(tableView)
        view.addSubview(writingBtn)
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        writingBtn.snp.makeConstraints{ make in
            make.height.width.equalTo(50)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
    
    private func setNavigation(){
        let locationBtn: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
            btn.semanticContentAttribute = .forceRightToLeft
            btn.setTitle("홍지동 ", for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            btn.setTitleColor(.black, for: .normal)
            return btn
        }()
        
        let menuBtn = UIBarButtonItem(title: nil, image: UIImage(systemName: "line.3.horizontal"), target: self, action: nil)
        let searchBtn = UIBarButtonItem(title: nil, image: UIImage(systemName: "magnifyingglass"), target: self, action: nil)
        let notiBtn = UIBarButtonItem(title: nil, image: UIImage(systemName: "bell"), target: self, action: nil)
        
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.tintColor = .black
        
        let leftBarBtn = UIBarButtonItem(customView: locationBtn)
        self.navigationItem.leftBarButtonItem = leftBarBtn
        self.navigationItem.rightBarButtonItems = [menuBtn, searchBtn, notiBtn]
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        return cell
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ViewControllerPreview: PreviewProvider{
    static var previews: some View {
        UIViewControllerPreview {
            let vc = ViewController()
            return vc
        }
    }
}
#endif
