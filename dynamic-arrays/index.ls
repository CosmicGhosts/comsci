DynamicArray = (len, ...args) ->
  array = Array ...args
  Object.defineProperty array, 'capacity', {
    enumerable: false
    writable: true
    value: len
  }
  array

push = (dyn, val) ->
  dyn.capacity *= 2 if dyn.length >= dyn.capacity
  dyn.push val
  dyn

main = do ->
  DynamicArray 4, 1, 2, 3, 4
  |> (dyn) -> push dyn, 5
  |> (dyn) -> console.log dyn.capacity
