defmodule Pricer do
  def add_totals(orders, tax_rates) do
    Enum.map orders, &(add_total &1, tax_rates)
  end

  def add_total(order, tax_rates) do
    rate = Keyword.get(tax_rates, order[:ship_to], 0)
    total = order[:net_amount] + order[:net_amount] * rate
    total = Float.round(total, 2)
    Keyword.put_new(order, :total, total)
  end
end

# tests
tax_rates = [ NC: 0.075, TX: 0.08 ]

orders = [
  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ id: 124, ship_to: :OK, net_amount:  35.50 ],
  [ id: 125, ship_to: :TX, net_amount:  24.00 ],
  [ id: 126, ship_to: :TX, net_amount:  44.00 ],
  [ id: 127, ship_to: :NC, net_amount:  25.00 ],
  [ id: 128, ship_to: :MA, net_amount:  10.00 ],
  [ id: 129, ship_to: :CA, net_amount: 102.00 ],
  [ id: 120, ship_to: :NC, net_amount:  50.00 ],
]

expected = [
  [ total: 107.50, id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ total:  35.50, id: 124, ship_to: :OK, net_amount:  35.50 ],
  [ total:  25.92, id: 125, ship_to: :TX, net_amount:  24.00 ],
  [ total:  47.52, id: 126, ship_to: :TX, net_amount:  44.00 ],
  [ total:  26.88, id: 127, ship_to: :NC, net_amount:  25.00 ],
  [ total:  10.00, id: 128, ship_to: :MA, net_amount:  10.00 ],
  [ total: 102.00, id: 129, ship_to: :CA, net_amount: 102.00 ],
  [ total:  53.75, id: 120, ship_to: :NC, net_amount:  50.00 ]
]

^expected = Pricer.add_totals(orders, tax_rates)
