//MARK: Compare selection sort and insertion sort
//let totalTime1 = SortCompare.timeRandomInput(alg: .selectionSort, length: 1000, numOfArr: 100)
//let totalTime2 = SortCompare.timeRandomInput(alg: .insertionSort, length: 1000, numOfArr: 100)
//
//print("time for execute selection sort: \(totalTime1)")
//print("Time for execute insertion sort: \(totalTime2)")
//
//print ("\(Alg.insertionSort.description) is faster \(totalTime1 / totalTime2) than \(Alg.selectionSort.description)")

//let shellSort = Shellsort<String>()
//let text = "SHELLSORTEXAMPLE"
//var arr = text.map({String($0)})
//shellSort.sort(arr: &arr)
//print(arr)


////MARK: Compare selection sort and insertion sort
let totalTime1 = SortCompare.timeRandomInput(alg: .insertionSort, length: 5000, numOfArr: 100)
let totalTime2 = SortCompare.timeRandomInput(alg: .shellSort, length: 5000, numOfArr: 100)

print("time for execute insertion sort: \(totalTime1)")
print("Time for execute shell sort: \(totalTime2)")

print ("\(Alg.shellSort.description) is faster \(totalTime1 / totalTime2) than \(Alg.insertionSort.description)")
