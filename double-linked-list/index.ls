require! './list': {List}

main = do ->
  List [1, 2, 3]
  |> console.log
