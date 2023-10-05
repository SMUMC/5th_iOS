import Foundation
import UIKit


struct DiceModel{
    var imageArray: [UIImage] = []
    
    var diceNum: Int = 1
    
    mutating func rollDice(){
        self.diceNum = (1...6).randomElement()!
    }
    
    func getDiceImage() -> UIImage{
        return imageArray[diceNum-1]
    }
    
    init(){
        for i in 1...6{
            if let image = UIImage(named: "black\(i)"){ imageArray.append(image) }
        }
    }
 
}
