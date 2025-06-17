// 피보나치 수는 일반적으로 F(n)으로 표시되며, 각 숫자가
// 이전 두 숫자의 합이 되는 수열인 피보나치 수열을 형성합니다.
// 0과 1부터 시작합니다. 즉,
//
// F(0) = 0, F(1) = 1
// n > 1일 때 F(n) = F(n - 1) + F(n - 2)
//
// n이 주어졌을 때 F(n)을 계산합니다.
//
// @leticiafaleia
func fibonacci(_ number: Int) -> Int {
    guard number > 1 else { return number }
    return fibonacci(number - 1) + fibonacci(number - 2)
}

fibonacci(5)
