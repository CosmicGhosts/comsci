stocks = []
stocks[0] = 200
stocks[1] = 100
stocks[2] = 300
stocks[3] = 150
stocks[4] = 125
stocks[5] = 500
stocks[6] = 90
stocks[7] = 350
stocks[8] = 450


trade = (stocks) ->
  max-profit = stocks[1] - stocks[0]
  min-price = stocks[0]

  for price, idx in stocks
    potential-profit = price - min-price
    max-profit = Math.max max-profit, potential-profit
    min-price = Math.min min-price, price

  max-profit

console.log trade stocks
