EmptyNode = {}
Node = (val, left, right) ->
  val: val
  left: left ? EmptyNode
  right: right ? EmptyNode

insert = (node, val) ->
  | node == EmptyNode => Node val
  | val == node.val   => node
  | val < node.val    => Node node.val, (insert node.left, val), node.right
  | val > node.val    => Node node.val, node.left, (insert node.right, val)

Tree = (root, ...rest) ->
  root-node = Node root, EmptyNode, EmptyNode
  rest.reduce insert, root-node

main = do ->
  Tree 1, 2, 3
  |> insert _, 0
  |> console.log
