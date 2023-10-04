//
//  MyTableViewController.swift
//  Chapter2
//
//  Created by 김영준 on 2023/10/04.
//

import UIKit

class MyTableViewController: UITableViewController {
    let data: [(image: UIImage, text: String)] = [
        (UIImage(named: "Image1")!, "[급구] 50만원 제공! 쿵야 레스토랑에서 시식 알바 구합니다.^^"),
        (UIImage(named: "Image2")!, "에어팟 맥스 실버"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        tableView.rowHeight = 150
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as! MyTableViewCell
        
        let (image, text) = data[indexPath.row]
        cell.imageView?.image = image
        cell.textLabel?.text = text
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
}



