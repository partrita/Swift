// 회문은 앞에서부터 읽으나 뒤에서부터 읽으나 동일한 문자열입니다.
//
// 예시: "level", "radar", "madam", "A man, a plan, a canal: Panama".

extension String {
    
    /// 문자열의 시작과 끝에서 문자를 재귀적으로 비교합니다. 문자 및 숫자만 포함합니다.
    /// - 복잡도: O(n), 새로운 공간을 할당하지 않음.
    func isPalindrome() -> Bool {
        isPalindromeRecursion(
            leftIndex: startIndex,
            rightIndex: index(before: endIndex)
        )
    }
    
    private func isPalindromeRecursion(
        leftIndex: String.Index,
        rightIndex: String.Index
    ) -> Bool {
        guard leftIndex < rightIndex else {
            return true
        }
        guard self[leftIndex].isLetter || self[leftIndex].isNumber else {
            return isPalindromeRecursion(
                leftIndex: index(after: leftIndex),
                rightIndex: rightIndex
            )
        }
        guard self[rightIndex].isLetter || self[rightIndex].isNumber else {
            return isPalindromeRecursion(
                leftIndex: leftIndex,
                rightIndex: index(before: rightIndex)
            )
        }
        guard self[leftIndex].lowercased() == self[rightIndex].lowercased() else {
            return false
        }
        
        return isPalindromeRecursion(
            leftIndex: index(after: leftIndex),
            rightIndex: index(before: rightIndex)
        )
    }
}
