require! './list-node': Node

List = (values) ->
  values
    .map -> Node it, null, null
    .reduceRight (next-node, prev-node) ->
      prev-node.next = next-node
      next-node.prev = prev-node
      prev-node

module.exports = {List}
