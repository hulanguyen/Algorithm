import Foundation

public protocol SortTemplate {
    associatedtype T: Comparable
    func sort( arr: inout [T])
}

extension SortTemplate {
    public func less(val1: T, val2: T) -> Bool {
        return val1 > val2
    }
    
    public func exch(arr: inout [T], i: Int, j: Int) {
        let tmp = arr[i]
        arr[i] = arr[j]
        arr[j] = tmp
    }
    
    public func isSorted(arr: [T]) -> Bool {
        for i in 0..<(arr.count - 1) {
            if arr[i] > arr[i + 1] {
                return false
            }
        }
        return true
    }
    
    public func testSorted(arr: [T]) {
        assert(isSorted(arr: arr), "Array is rearranged")
    }
}

//MARK: Selection sort
public struct SelectionSort<Item: Comparable>: SortTemplate {
    
   public typealias T = Item
    
    public init() {}
    
    public func sort(arr: inout [T]) {
        for i in 0..<(arr.count - 1) {
            var min = arr[i]
            var minIndex = i
            for j in (i + 1)..<arr.count {
                if less(val1: min, val2: arr[j]) {
                    min = arr[j]
                    minIndex = j
                }
            }
            exch(arr: &arr, i: i, j: minIndex)
        }
    }
}

//MARK: Insertion sort
public struct InsertionSort<Item: Comparable>: SortTemplate {
    public typealias T = Item
    public init() {}
    
    public func sort(arr: inout [Item]) {
        for i in 1..<arr.count {
            for j in stride(from: i, to: 0, by: -1) {
                if j - 1 >= 0, less(val1: arr[j - 1], val2: arr[j]) {
                    exch(arr: &arr, i: j-1, j: j)
                }
            }
        }
    }
}

//MARK: Shell sort

public struct Shellsort<Item: Comparable>: SortTemplate {
    public typealias T = Item
    public init() {}
    
    public func sort(arr: inout [Item]) {
        let n = arr.count
        var h = 1
        while h < n/3 { h = 3*h + 1}
        while h >= 1 {
            for i in h..<n {
                for j in stride(from: i, through: h, by: -h) {
                    if j - h >= 0, less(val1: arr[j - h], val2: arr[j]) {
                        exch(arr: &arr, i: j, j: j - h)
                    }
                }
                
            }
            h = h/3
        }
    }
}

//MARK: Sort compare
public enum Alg {
    case selectionSort
    case insertionSort
    case shellSort
}

extension Alg: CustomStringConvertible {
    public var description: String {
        switch self {
        case .selectionSort:
            return "Selection sort"
        case .insertionSort:
            return "Insertion sort"
        case .shellSort:
            return "Shell sort"
        }
    }
}

public struct TimerCounter<T: Comparable> {
    static func calSortTime(alg: Alg, arr: inout [T]) -> TimeInterval {
        let startTime = Date().timeIntervalSince1970
       
        switch alg {
        case .selectionSort:
           let sortAlg = SelectionSort<T>()
            sortAlg.sort(arr: &arr)
        case .insertionSort:
           let sortAlg = InsertionSort<T>()
            sortAlg.sort(arr: &arr)
        case .shellSort:
            let sortAlg = Shellsort<T>()
            sortAlg.sort(arr: &arr)
        }
        return Date().timeIntervalSince1970 - startTime
    }
}

public struct SortCompare {
   public static func timeRandomInput(alg: Alg, length: Int, numOfArr: Int) -> TimeInterval{
        var arr = Array<Double>(repeating: 0, count: length)
        var total: TimeInterval = 0
        for _ in 0..<numOfArr {
            for i in 0..<length {
                arr[i] = Double.random(in: 0...1)
            }
            total += TimerCounter<Double>.calSortTime(alg: alg, arr: &arr)
        }
        return total
    }
}
