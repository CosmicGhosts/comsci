queue = (...values) ->
  Array ...values

pop = (queue) ->
  queue.slice 1

push = (queue, val) ->
  Array val, ...queue

peek = (queue) ->
  queue[0]

main = do ->
  queue 1, 2, 3
  |> push _, 0
  |> peek
  |> console.log
