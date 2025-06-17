/*
 칵테일 정렬(또는 칵테일 셰이커 정렬)은 버블 정렬의 변형입니다.
 버블 정렬 알고리즘은 항상 왼쪽에서 요소를 순회하며 첫 번째 반복에서는 가장 큰 요소를 올바른 위치로 이동시키고,
 두 번째 반복에서는 두 번째로 큰 요소를 이동시키는 방식으로 진행됩니다.
 칵테일 정렬은 주어진 배열을 양방향으로 번갈아 순회합니다.
*/

import Foundation

func cocktailSort<T: Comparable>(_ a: [T]) -> [T] {
    var list = a
    var swapped = true
    var start = 0
    var end = list.count - 1

    while (swapped) {
        swapped = false

        for i in start..<end {
            if (list[i] > list[i + 1]) {
                list.swapAt(i, i+1)
                swapped = true
            }
        }

        if (!swapped) {
            break
        }
        swapped = false
        end -= 1

        for index in stride(from: end-1, through: start, by: -1) {
            if (list[index] > list[index + 1]) {
                list.swapAt(index, index+1)
                swapped = true
            }
        }
        start += 1
    }
    
    return list
}

// 아래 코드는 테스트용으로 사용할 수 있습니다.

//var numbers = [2, -4, 4, 6, 1, 12, 9, 0]
//numbers = cocktailSort(numbers)
//print(numbers)
