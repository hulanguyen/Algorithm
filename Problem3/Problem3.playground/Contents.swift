//: A UIKit based Playground for presenting user interface
  
import UIKit



let arr = [[1, 2,3], [4,5,6], [9,8,9]]

func diagonalDifference(arr: [[Int]]) -> Int {
    // Write your code here
    var leftDiagonal = 0
    var rightDiagonal = 0
    let maxtrixNumber = arr[0].count - 1
    for index in 0...(arr[0].count - 1) {
        leftDiagonal += arr[index][index]
        rightDiagonal += arr[maxtrixNumber - index][index]
    }
    
    return abs(leftDiagonal - rightDiagonal)
}

print(diagonalDifference(arr: arr))
