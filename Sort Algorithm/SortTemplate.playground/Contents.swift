
let totalTime1 = SortCompare.timeRandomInput(alg: .selectionSort, length: 1000, numOfArr: 100)
let totalTime2 = SortCompare.timeRandomInput(alg: .insertionSort, length: 1000, numOfArr: 100)

print("time for execute selection sort: \(totalTime1)")
print("Time for execute insertion sort: \(totalTime2)")

print ("\(Alg.insertionSort.description) is faster \(totalTime2 / totalTime1) than \(Alg.selectionSort.description)")

