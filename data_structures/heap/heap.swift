struct Heap<Element> {
    let compare: (Element, Element) -> Bool
    private var items : [Element]

    init(_ items : [Element], compare: @escaping (Element, Element) -> Bool) {
        self.compare = compare
        self.items = items
        for index in (0 ..< count / 2).reversed() {
            heapify(index)
        }
    }

    /// 이 힙의 최소 항목이거나 힙이 비어 있으면 nil입니다.
    var min: Element? {
        return items.first
    }

    /// 이 힙의 항목 수
    var count: Int {
        return items.count
    }

    /// 이 힙이 비어 있으면 true
    var isEmpty: Bool {
        return items.isEmpty
    }

    /// 힙에서 최소 항목을 제거하고 반환합니다.
    /// - 반환값: 힙의 최소 항목이거나 힙이 비어 있으면 nil입니다.
    mutating func extractMin() -> Element? {
        guard let result = items.first else { return nil }

        items.removeFirst()
        heapify(0)
        return result

    }

    /// 이 힙에 새 항목을 삽입합니다.
    /// - 매개변수 item: 삽입할 새 항목
    mutating func insert(item : Element) {
        items.append(item)
        var i = items.count - 1
        while i > 0 && compare(items[i], items[parent(i)]) {
            items.swapAt(i, parent(i))
            i = parent(i)
        }
    }

    /// 지정된 인덱스에서 시작하여 힙 속성을 복원합니다.
    /// - 매개변수 index: 시작할 인덱스
    private mutating func heapify(_ index : Int) {
        var minimumIndex = index
        if left(index) < count && compare(items[left(index)], items[minimumIndex]) {
            minimumIndex = left(index)
        }

        if right(index) < count && compare(items[right(index)], items[minimumIndex]) {
            minimumIndex = right(index)
        }

        if minimumIndex != index {
            items.swapAt(minimumIndex, index)
            heapify(minimumIndex)
        }
    }

    /// 항목의 왼쪽 자식 인덱스를 반환합니다.
    private func left(_ index : Int) -> Int {
        return 2 * index + 1
    }

    /// 항목의 오른쪽 자식 인덱스를 반환합니다.
    private func right(_ index: Int) -> Int {
        return 2 * index + 2
    }

    /// 항목의 부모 인덱스를 반환합니다.
    private func parent(_ index: Int) -> Int {
        return (index - 1) / 2
    }
}


extension Heap: ExpressibleByArrayLiteral where Element: Comparable {
    init(arrayLiteral elements: Element...) {
        self.init(elements, compare: <)
    }

    init(_ elements: [Element]) {
        self.init(elements, compare: <)
    }
}
