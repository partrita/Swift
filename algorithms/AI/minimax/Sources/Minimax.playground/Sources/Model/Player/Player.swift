public struct Player {
    // MARK: -- 공개 변수
    public var type: PlayerType

    public var symbol: PlayerSymbol

    // MARK: -- 공개 함수
    public init(type: PlayerType, symbol: PlayerSymbol) {
        self.type = type
        self.symbol = symbol
    }
}
