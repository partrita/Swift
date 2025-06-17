import Foundation

public class TreeNode<T> {
    public var value: T

    public weak var parent: TreeNode?
    public var children = [TreeNode<T>]()

    public init(value: T) {
        self.value = value
    }

    public func addChild(_ node: TreeNode<T>) {
        children.append(node)
        node.parent = self
    }
}

/* 노드의 값 속성을 확인하고, 일치하는 항목이 없으면 자식 노드를 확인합니다.
동일한 과정을 재귀적으로 반복합니다. */
extension TreeNode where T: Equatable {
    func search(_ value: T) -> TreeNode? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value) {
                return found
            }
        }
        return nil
    }
}

// 아래 코드는 테스트용으로 사용할 수 있습니다.
let tree = TreeNode<String>(value: "animals")

let reptilesNode = TreeNode<String>(value: "reptiles")
let mammalsNode = TreeNode<String>(value: "mammals")

let lizardsNode = TreeNode<String>(value: "lizards")
let snakesNode = TreeNode<String>(value: "snakes")

let dogsNode = TreeNode<String>(value: "dogs")
let humansNode = TreeNode<String>(value: "humans")

tree.addChild(reptilesNode)
tree.addChild(mammalsNode)

reptilesNode.addChild(lizardsNode)
reptilesNode.addChild(snakesNode)

mammalsNode.addChild(dogsNode)
mammalsNode.addChild(humansNode)

print(tree.search("humans")?.value)
print(tree.search("lizards")?.value)
print(tree.search("dragons")?.value)
