// 회문은 앞에서부터 읽으나 뒤에서부터 읽으나 동일한 문자열입니다.
//
// 예시: "level", "radar", "madam", "A man, a plan, a canal: Panama".

extension String {
    
    /// `reverse()` 메서드를 사용하여 문자열을 뒤집고 원본과 비교합니다. 문자 및 숫자만 포함합니다.
    /// - 복잡도: O(n), O(n) 공간 할당.
    func isPalindrome() -> Bool {
        let input = lowercased().filter { $0.isLetter || $0.isNumber }
        return input == String(input.reversed())
    }
}
