require! './list-node': Node

List = (values) ->
  values
    .map -> Node it
    .reduceRight ((acc, fn) -> fn acc), null

find = (list, field, val) ->
  return list if list[field] is val
  find (rest list), field, val

first = (list) -> list.val
rest  = (list) -> list.next

prepend = (list, val) -> Node val, list

append = (list, val) ->
  node = find list, 'next', null
  node.next = Node val, null
  list

insert-after = (list, val) ->
  list.next = Node val, list.next
  list

remove = (list, val) ->
  head = first list
  tail = rest list
  return tail if head.val is val

  {prev, node} = reduce ((acc, node) ->
    return acc if acc.node
    return {prev: node} if node.val isnt val
    {node, prev: acc.prev}), {prev: head}, tail

  prev.next = node.next if node?
  list

reduce = (fn, acc, list) ->
  return fn acc, list if list.next is null
  reduce fn, (fn acc, list), (rest list)

map = (fn, list) ->
  initial = Node (fn list.val), null

  reduce ((acc, {val}) ->
    insert-after acc, fn val
    |> (.next)), initial, rest list

  initial

concat = (list-a, list-b) ->
  node = find list-a, 'next', null
  node.next = list-b
  list-a

module.exports = {
  map
  rest
  first
  reduce
  concat
  append
  prepend
  remove
  insert-after
  List: List
}
