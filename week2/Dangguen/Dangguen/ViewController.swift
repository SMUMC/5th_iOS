//
//  ViewController.swift
//  Dangguen
//
//  Created by 이동현 on 2023/10/05.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private var tableView: UITableView!
    
    lazy var addBtn:UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "plus"), for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = .orange
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 35
        btn.layer.cornerCurve = .circular
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        setUp()
    }
    
    private func setNavigation(){
        let locationBtn: UIButton = {
            let btn = UIButton()
            btn.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
            btn.semanticContentAttribute = .forceRightToLeft
            btn.setTitle("영통구 ", for: .normal)
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
    
    private func setUp(){
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: "itemCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        
        view.addSubview(tableView)
        view.addSubview(addBtn)
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        addBtn.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.width.equalTo(70)
            make.height.equalTo(70)
        }
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemTableViewCell
        
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
