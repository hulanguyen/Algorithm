import UIKit

//Given an array of sorted numbers and a target sum, find a pair in the array whose sum is equal to the given target
// Brute force will take O(n2)
func findPair(arr: [Int], target: Int) -> [Int] {
    var index1 = -1
    var index2 = -1
    for i in 0..<(arr.count - 1) {
        index1 = i
        let remainVal = target - arr[index1]
        for j in (i + 1)..<arr.count {
            if arr[j] == remainVal {
                index2 = j
                return [index1, index2]
            }
        }
    }
    if index1 == -1 || index2 == -1 {
        index1 = -1
        index2 = -1
    }
    return [index1, index2]
}

let input1 = [1, 2, 3, 4, 6]
findPair(arr: input1, target: 6)

let input2 = [2, 5, 9, 11]
findPair(arr: input2, target: 11)
let input3 = [1, 3, 3, 4, 6, 6, 7, 8, 9]
findPair(arr: input3, target: 6)

// Second way:
// use two pointer technich

func findPair1 (arr: [Int], target: Int) -> [Int] {
    var l = 0
    var r = arr.count - 1
    
    while l < r {
        let sum = arr[l] + arr[r]
        if sum == target {
            return [l, r]
        } else if sum > target {
            r -= 1
        } else {
            l += 1
        }
    }
    return [-1, -1]
}

findPair1(arr: input1, target: 6)
findPair1(arr: input2, target: 11)
findPair1(arr: input3, target: 26)

