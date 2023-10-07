//
//  DiceModel.swift
//  DoubleDice
//
//  Created by 김영준 on 2023/10/07.
//

import UIKit

struct DiceModel{
    var dice1Status = 1
    var dice2Status = 1
    var diceImg: [UIImage] = []
    
    mutating func roll(){
        dice1Status = Int.random(in: 1...6)
        dice2Status = Int.random(in: 1...6)
    }
    
    func getDiceImg(value: Int) -> UIImage{
        return diceImg[value - 1]
    }
    
    init() {
        for i in 1...6{
            if let image = UIImage(named: "black\(i)"){diceImg.append(image)}
        }
    }
}
