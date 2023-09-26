//
//  ViewController.swift
//  week1
//
//  Created by 이동현 on 2023/09/24.
//

import UIKit

class ViewController: UIViewController {

    var storeName = ["지지고", "매홀고기촌", "금촌칼국수", "칠구대포", "백년순대국", "달봉감자", "함께식탁", "떡보의하루", "르불루피자", "파파존스"]
    
    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var cv1: UICollectionView!
    
    @IBOutlet weak var cv2: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cv1.delegate = self
        cv1.dataSource = self
        
        cv2.delegate = self
        cv2.dataSource = self
        
        cv2.register(StoreCollectionViewCell.self, forCellWithReuseIdentifier: "cv2")
        
        searchView.layer.cornerRadius = 20
        searchView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        searchView.layer.masksToBounds = true
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = cv1.dequeueReusableCell(withReuseIdentifier: "StoreCollectionViewCell", for: indexPath) as! StoreCollectionViewCell
        cell.img.image = UIImage(systemName: "storefront.fill")
        cell.nameLabel.text = storeName[indexPath.row]
        print(storeName[indexPath.row])
        print(indexPath.row)
        return cell
        
    }
}

