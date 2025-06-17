import Foundation

func linearSearch<T: Equatable>(_ array: [T], _ object: T) -> Int? {
  for (index, obj) in array.enumerated() where obj == object {
    return index
  }
  return nil
}

// 아래 코드는 테스트용으로 사용할 수 있습니다.

// var numbers = [10, 119, 13, 24, 53, 17, 31, 7, 19, 627, 47, 163, 37, 611, 29, 43, 51, 41, 32]
// if let searchIndex = linearSearch(numbers,31) {
//     print("요소를 다음 인덱스에서 찾았습니다: \(searchIndex)")
// }
// else {
// print("요소를 찾을 수 없습니다")
// }
