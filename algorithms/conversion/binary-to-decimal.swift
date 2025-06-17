import Foundation

/// 이 함수는 이진수 문자열을 입력받아 10진수 정수로 변환합니다.
/// 유효한 이진수가 아니면 (즉, 숫자로만 구성되지 않은 경우) nil을 반환합니다.
public func convertBinaryToDecimal(binary: String) -> Int? {
    if let _ = Int(binary) {
        var decimal = 0

        let digits = binary.map { Int(String($0))! }.reversed()
        print(digits)
        var power = 1

        for digit in digits {
            decimal += digit * power

            power *= 2
        }

        return decimal
    }

    return nil
}