import Foundation

extension Array where Element: Comparable {

    func bubbleSort(by areInIncreasingOrder: ((Element, Element) -> Bool) = (<)) -> [Element] {
        var data = self
        
        for i in 0..<(data.count-1) { 
            for j in 0..<(data.count-i-1) where areInIncreasingOrder(data[j+1], data[j]) { 
                data.swapAt(j, j + 1)
            }
        }
        
        return data
    }
}

func swap<T: Comparable>(left: inout T, right: inout T) {
    print("Swapping \(left) and \(right)")
    let temp = right
    right = left
    left = temp
}

// 아래 코드는 테스트용으로 사용할 수 있습니다.

// let numberList : Array<Int> = [8, 2, 10, 9, 7, 5]
// let results: Array<Int> = numberList.bubbleSort()
// print(results)
