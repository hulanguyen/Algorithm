import UIKit
///
/// Problem 1:
/// There are 2 sorted arrays A and B of size n each. Write an algorithm to find median of the array obtained after merging the 2 arrays(i.e. array  of length 2n). The complexity should be O(log(n)).
///
/// Input:           arr1[] = [1, 12, 15, 26, 38]
///          arr2 [] = [2, 13, 17. 30, 45]
/// Oput: 16
/// Exlanation:
/// After merging 2 arrays, we get
///  {1, 2, 12, 13, 15, 17, 26, 30, 38, ,45}
///  Middle of two elements are 15 and 17
///  Average of middle elements is (15 + 17) / 2 which is equal 16
///

///Note: for more under stand about Big O notation, please follow this link : https://en.wikipedia.org/wiki/Big_O_notation for references.

// input
var arr1 = [1, 12, 15, 26, 38]
var arr2 = [2, 13, 17, 30, 45]

// algorithm with O(n)

func getMediumOfMergeArr(arr1: Array<Int>, arr2: Array<Int>) -> Int {
    
    var mergedArr = Array<Int>()
    
    for index in 0..<arr1.count {
        var lessValue = arr1[index]
        var moreValue = arr2[index]
        if arr1[index] > arr2[index] {
            lessValue = arr2[index]
            moreValue = arr1[index]
        }
        mergedArr.append(lessValue)
        mergedArr.append(moreValue)
    }
    
    print(mergedArr)
    let middleIndex = arr2.count - 1
    let value = Int((mergedArr[middleIndex] + mergedArr[middleIndex + 1]) / 2)
   
    
    return value
}

//print("Output : \(getMediumOfMergeArr(arr1: arr1, arr2: arr2))")


// algorithm with O(logn)

func getMediumOfMergeArr2(arr1: Array<Int>, arr2: Array<Int>) -> Int {
    
    let n = arr1.count
    var mergedArr = Array<Int>(repeating: 0, count: 2 * n)
    var preIndex = 0
    var posIndex = 2 * n - 1
    for index in 0..<(Int(n / 2) + 1) {
        let preValue = getValueForOrder(value1: arr1[index], value2: arr2[index])

        mergedArr[preIndex] = preValue.0
        mergedArr[preIndex + 1] = preValue.1
        preIndex += 2
        
        if preIndex > posIndex {
            break
        }
        let posValue = getValueForOrder(value1: arr1[n - 1 - index], value2: arr2[n - 1 - index])
        
        mergedArr[posIndex] = posValue.1
        mergedArr[posIndex - 1] = posValue.0
        posIndex -= 2
    }
    
    
    print(mergedArr)
        let middleIndex = arr2.count - 1
        let value = Int((mergedArr[middleIndex] + mergedArr[middleIndex + 1]) / 2)
       
        
        return value
    }

func getValueForOrder(value1: Int, value2: Int) -> (Int, Int) {
    value1 > value2 ? (value2, value1) : (value1, value2)
}

print("Output : \(getMediumOfMergeArr2(arr1: arr1, arr2: arr2))")
