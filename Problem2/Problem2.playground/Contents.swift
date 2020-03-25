import UIKit

//Input
let arr = [-4, 3, -9, 0, 4, 1]

func plusMinus(arr: [Int]) -> Void {
    var numberOfPos = 0
    var numberOfNav = 0
    var numberOfZero = 0
    
    arr.forEach { (value) in
        if value > 0 {
        numberOfPos += 1
        } else if value < 0 {
            numberOfNav += 1
        } else {
            numberOfZero += 1
        }
    }
    
    
    if arr.count > 0 {
        print(String(format: "%0.6f", Float(numberOfPos) / Float(arr.count)))
        print(String(format: "%0.6f", Float(numberOfNav) / Float(arr.count)))
        print(String(format: "%0.6f", Float(numberOfZero) / Float(arr.count)))
    }
}


plusMinus(arr: arr)
