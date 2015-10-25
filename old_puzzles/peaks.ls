require! 'prelude-ls': { floor, sqrt }

array = [1, 2, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2]

main = do ->
  points = array
  length = points.length
  peaks = [0] * length

  for index in [1 to length - 1]
    point = points[index]
    left  = points[index - 1]
    right = points[index + 1]
    peaks[index] = left

    if left < point and point > right
      peaks[index] += 1

  if length < 3 or peaks[-2] is 0 then return 0

  peaks[-1] = peaks[-2]

  max-partitions = 0

  x = floor (sqrt(length))

  console.log x

  for candidate in [1 to x]
    if length % candidate is 0
      blocks = candidate
      block-size = length / candidate

      if candidate * candidate is length
        # If candidate is equal to sqrt(A_len) exactly,
        # candidate would equal to A_len//candidate.
        continue

      if peaks[0] < peaks[block-size - 1]
        for each-block in [1 to length]
          if peaks[each-block - 1] is peaks[each-block + block-size - 1]
            break
          else
            max-partitions = blocks

  max-partitions
  console.log max-partitions
