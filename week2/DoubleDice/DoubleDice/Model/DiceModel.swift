import Foundation
import UIKit

struct DiceModel{
    var diceNum: [Int] = []
    
    mutating func rollDices() {
        let num1 = Int.random(in: 1...6)
        let num2 = Int.random(in: 1...6)
        diceNum = [num1,num2]
    }
    
    func dicesHap() -> Int {
        return diceNum[0] + diceNum[1]
    }
    
    func getDicesImage() -> [UIImage] {
        return [UIImage(named: "black\(diceNum[0])")!, UIImage(named: "black\(diceNum[1])")!]
    }
    
}
