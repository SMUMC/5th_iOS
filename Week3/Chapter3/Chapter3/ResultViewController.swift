//
//  ResultViewController.swift
//  Chapter3
//
//  Created by 김영준 on 2023/10/10.
//

import UIKit
import SnapKit

class ResultViewController: UIViewController, ButtonSelectionDelegate {
    
    weak var delegate: ButtonSelectionDelegate?
    var mediumButtonSelected: Bool = false
    var largeButtonSelected: Bool = false
    
    let resultLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        updateResultLabel()
        setupUI()
    }
    private func updateResultLabel() {
        if mediumButtonSelected {
            resultLabel.text = "20000"
        } else {
            resultLabel.text = "30000"
        }
    }
    
    private func setupUI() {
        self.view.addSubview(resultLabel)
        
        resultLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func didSelectButtons(mediumSelected: Bool, largeSelected: Bool) {
        mediumButtonSelected = mediumSelected
        largeButtonSelected = largeSelected
    }
    
}


