stack = (...values) ->
  array = Array ...values

pop = (stack) ->
  n = stack.length - 1
  stack.slice 0, n

push = (stack, val) ->
  Array ...stack, val

peek = (stack) ->
  n = stack.length - 1
  stack[n]

main = do ->
  stack 1, 2, 3
  |> push _, 4
  |> console.log

