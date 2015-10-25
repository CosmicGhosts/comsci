array = [1, 7, 3, 4]

main = do ->
  results = []
  for n, i in array
    if i is 0
      results.push 1
      continue

    results[i - 1] = n 

  console.log results
