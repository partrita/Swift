class UnionFindNode {
    var rank = 0

    private var parent: UnionFindNode? = nil

    func findRoot() -> UnionFindNode {
        var x = self
        while let parent = x.parent {
            x.parent = parent.parent ?? parent
            x = parent
        }
        return x
    }

    @discardableResult
    static func union(_ x: UnionFindNode, _ y: UnionFindNode) -> UnionFindNode {
        var x = x.findRoot()
        var y = y.findRoot()

        guard x !== y else { return x }

        if x.rank < y.rank {
            swap(&x, &y)
        }

        y.parent = x
        if x.rank == y.rank {
            x.rank = y.rank + 1
        }
        
        return x
    }

    static func inSameSet(_ x: UnionFindNode, _ y: UnionFindNode) -> Bool {
        return x.findRoot() === y.findRoot()
    }
}


func testUnionFind() {
    let a = UnionFindNode()
    let b = UnionFindNode()
    let c = UnionFindNode()

    print("a, b", UnionFindNode.inSameSet(a, b))
    print("b, c", UnionFindNode.inSameSet(b, c))
    print("a, c", UnionFindNode.inSameSet(a, c))

    print("a, b 결합 중")

    UnionFindNode.union(a, b)
    print("a, b", UnionFindNode.inSameSet(a, b))
    print("b, c", UnionFindNode.inSameSet(b, c))
    print("a, c", UnionFindNode.inSameSet(a, c))

    print("b, c 결합 중")

    UnionFindNode.union(b, c)
    print("a, b", UnionFindNode.inSameSet(a, b))
    print("b, c", UnionFindNode.inSameSet(b, c))
    print("a, c", UnionFindNode.inSameSet(a, c))


    print("새 노드 d")
    let d = UnionFindNode()

    print("a, d", UnionFindNode.inSameSet(a, d))

    print("d, c 결합 중")
    UnionFindNode.union(d, c)
    print("a, d", UnionFindNode.inSameSet(a, d))

}
