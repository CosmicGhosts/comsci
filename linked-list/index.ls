require! './list': {
  List
  map
  concat
  append
  prepend
  insert-after
  remove
}

main = do ->
  List [1, 2, 3]
  |> (list) -> append list, 4
  |> (list) -> prepend list, 0
  |> (list) -> concat list, (List [5, 6, 7])
  |> (list) -> map (+ 1), list
  |> (list) -> remove list, 3
  |> (list) -> map console.log, list
