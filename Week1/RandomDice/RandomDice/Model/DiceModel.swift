
import UIKit

struct DiceModel{
    var dice1Value: Int = 1
    var diceImg: [UIImage] = []

    mutating func rollDice1(){
        dice1Value = Int.random(in: 1...6)
    }
    
    func getDice1Img() -> UIImage{
        return diceImg[dice1Value - 1]
    }
    
    init(){
        for i in 1...6{
            if let image = UIImage(named: "black\(i)"){ diceImg.append(image)}
        }
    }
}
