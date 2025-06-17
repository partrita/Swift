class Node : CustomStringConvertible {
    // 각 노드에 필요한 고유 식별자
    var identifier : Int
    var distance : Int = Int.max
    var edges = [Edge]()
    var visited = false
    
    var description: String {
        var edgesString = String()
        edges.forEach{  edgesString.append($0.description)}
        return "{ Node, identifier: \(identifier.description) +  Edges: \(edgesString) + }"
    }
    
    init(visited: Bool, identifier: Int, edges: [Edge]) {
        self.visited = visited
        self.identifier = identifier
        self.edges = edges
    }
    
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

class Edge {
    var from: Node // 실제로 저장할 필요는 없습니다!
    var to: Node
    var weight: Int
    var description : String {
        return "{ Edge, from: \(from.identifier), to: \(to.identifier), weight: \(weight) }"
        
    }
    init(to: Node, from: Node, weight: Int) {
        self.to = to
        self.weight = weight
        self.from = from
    }
}

class Graph {
    var nodes: [Node] = []
}


// 아래 quickestWayUp 함수를 완성하세요.
func setupGraphwith(edges: [[Int]]) -> Graph {
    let graph = Graph()
    
    // 모든 노드 생성
    // 첫 번째와 마지막 노드를 포함해야 하므로 "to"와 "from"의 노드가 필요합니다.
    let nodeNames = Set ( edges.map{ $0[0] } + edges.map{ $0[1]} )
    for node in nodeNames {
        let newNode = Node(visited: false, identifier: node, edges: [])
        graph.nodes.append(newNode)
    }
    
    // 노드를 연결하기 위한 모든 간선 생성
    for edge in edges {
        if let fromNode = graph.nodes.first(where: { $0.identifier == edge[0] }) {
            if let toNode = graph.nodes.first(where: { $0.identifier == edge[1] }) {
                let forwardEdge = Edge(to: toNode, from: fromNode, weight: edge[2])
                fromNode.edges.append(forwardEdge)
            }
        }
    }
    return graph
}

func shortestPath (source: Int, destination: Int, graph: Graph) -> Int {

    var currentNode = graph.nodes.first{ $0.identifier == source }!
    currentNode.visited = true
    currentNode.distance = 0
    var toVisit = [Node]()
    toVisit.append(currentNode)
    while ( !toVisit.isEmpty) {
        toVisit = toVisit.filter{ $0.identifier != currentNode.identifier }
        currentNode.visited = true
        // 각 인접 정점으로 이동하여 경로 길이 업데이트
        for connectedEdge in currentNode.edges {
            let dist = currentNode.distance + connectedEdge.weight
            
            if (dist < connectedEdge.to.distance) {
                
                connectedEdge.to.distance = dist
                toVisit.append(connectedEdge.to)
                if (connectedEdge.to.visited == true) {
                    
                    connectedEdge.to.visited = false
                }
            }
        }
        
        currentNode.visited = true
        // 현재 노드를 가장 작은 정점으로 설정
        if !toVisit.isEmpty {
            currentNode = toVisit.min(by: { (a, b) -> Bool in
                return a.distance < b.distance
            })!
        }
        
        if (currentNode.identifier == destination) {
            return currentNode.distance
        }
    }
    
    return -1
}
