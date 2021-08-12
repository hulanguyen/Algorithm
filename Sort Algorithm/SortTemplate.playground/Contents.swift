


let string = "sortexample"
var arr = string.uppercased().map({$0})
//let sortObject = SelectionSort<Character>()
//sortObject.sort(arr: &arr)
//print(arr)


let insertSort = InsertionSort<Character>()
insertSort.sort(arr: &arr)
print(arr)
