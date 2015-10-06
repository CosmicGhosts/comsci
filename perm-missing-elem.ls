"""
Given an array of N integers,
which contains integers in the range 1 to N + 1.
That means we're missing a number in the range. e.g. 1 to 100 could be missing 55.
Write a function to find the missing number from the range.

Sample Data: [2, 5, 1, 3, 4, 6, 8]

P.S.
Don't worry about negative numbers.
The array has distinct values.
All numbers are in the range of 1 to N + 1.
"""

array = [2, 5, 1, 3, 4, 6, 8]

missing-elem = (array, n) ->
  sum = (n+1) * (n+2) / 2

  for x, i in array
    sum -= x

  sum

main = do ->
  res = missing-elem array, array.length
  console.log res
