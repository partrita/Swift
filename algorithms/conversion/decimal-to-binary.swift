/// 이 함수는 음이 아닌 정수를 입력받아 이진수 형태의 문자열로 반환합니다.
public func convertDecimalToBinary(decimal: Int) -> String {
    var binary = ""
    var decimal = decimal

    while decimal != 0 {
        binary.insert(decimal % 2 == 0 ? "0" : "1", at: binary.startIndex)
        decimal /= 2
    }

    return binary
}