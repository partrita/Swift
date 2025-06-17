/*
 팬케이크 정렬은 크기 순서대로 정렬되지 않은 팬케이크 스택을 정렬하는 수학적 문제입니다.
 주걱을 스택의 어느 지점에나 삽입하여 그 위의 모든 팬케이크를 뒤집을 수 있습니다.
 */

import Foundation

func flip(array: [Int], key: Int) -> [Int] {
    var flippedArray = array
    var pos = key
    var start = 0
    var aux = 0

    while (start < pos) {
        aux = flippedArray[start]
        flippedArray[start] = flippedArray[pos]
        flippedArray[pos] = aux
        
        start += 1
        pos -= 1
    }
    
    return flippedArray
}

func pancakeSort(_ array: [Int]) -> [Int] {
    var list = array
    var currentSize = list.count
    for _ in (1 ..< currentSize).reversed() {
        
        let listToSearch = list[0...currentSize-1]
        let max = listToSearch.max() ?? 0
        let indexOfMax = listToSearch.firstIndex(of: max) ?? 0

        if indexOfMax != currentSize - 1 {
            list = flip(array: list, key: indexOfMax)
            list = flip(array: list, key: currentSize - 1)
        }
        
        currentSize -= 1
    }
    
    return list
}

// 아래 코드는 테스트용으로 사용할 수 있습니다.
//var numbers = [2, 4, 6, 12, 3, -2, 9, 14, 22, 0, 18]
//numbers = pancakeSort(numbers)
//print(numbers)
