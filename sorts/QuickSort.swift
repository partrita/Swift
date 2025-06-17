import Foundation

extension Array where Element: Comparable {
    /// QuickSort 알고리즘을 사용하여 배열을 제자리에서 정렬합니다.
    ///
    /// QuickSort 알고리즘은 먼저 피벗을 선택하여 배열을 정렬합니다. 이 피벗은
    /// 모든 요소를 재배열하는 데 사용되며, 더 작은 요소는 왼쪽으로 이동합니다. 이 작업은
    /// 피벗을 중심으로 형성된 하위 배열에 재귀적으로 적용됩니다.
    mutating func quickSort() {
        guard count > 1 else {
            return
        }
        
        _quickSort(from: 0, to: count - 1)
    }
    
    mutating private func _quickSort(from left: Int, to right: Int) {
        guard left < right, right - left > 0 else {
            return
        }
        
        let pivotIndex = partition(from: left, to: right)
        _quickSort(from: left, to: pivotIndex - 1)
        _quickSort(from: pivotIndex + 1, to: right)
    }
    
    /// 이 메서드는 피벗이 선택되는 곳으로, 더 작은 요소는 왼쪽으로,
    /// 더 큰 요소는 오른쪽으로 이동합니다.
    mutating private func partition(from left: Int, to right: Int) -> Int {
        /// 피벗을 선택합니다. 이 경우 항상 첫 번째 요소이며, 이는 그다지 효율적이지 않습니다.
        let pivotIndex = left
        swapAt(pivotIndex, right)
        
        let pivot = self[right]
        var i = left
        
        for j in i ..< right {
            // 요소가 피벗보다 작으면 왼쪽으로 이동합니다.
            if self[j] <= pivot {
                swapAt(i, j)
                i += 1
            }
        }
        
        // 피벗을 올바른 정렬 위치로 이동합니다.
        swapAt(i, right)
        
        return i
    }
    
    /// QuickSort 알고리즘을 사용하여 이 배열의 정렬된 버전을 반환합니다.
    func quickSorted() -> Array {
        var copy = self
        
        copy.quickSort()
        
        return copy
    }
}

// 다음 코드를 사용하여 테스트하십시오.
// var numbers = [1002, 42, 55, 124, 205]
// debugPrint(numbers.quickSorted())
//
// numbers.quickSort()
// debugPrint(numbers)
//
// 콘솔에 다음이 인쇄되어야 합니다.
// [42, 55, 124, 205, 1002]
// [42, 55, 124, 205, 1002]
