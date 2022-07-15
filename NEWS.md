# kb.yahoo 2.2.2

* Exporting `price_change`
* Setting minimum version for `quantmod` (v0.4.20)
* Updating README

# kb.yahoo 2.2.1

* Updating to `quantmod` v0.4.20 (fixing bug "could not establish session after 5 attempts")

# kb.yahoo 2.2.0

* Adding sector and industry functions

# kb.yahoo 2.1.0

* Adding these functions:

  - `load_tradingview_pe`: loading multiple PE based on url for a given sector/industry
  - `load_yahoo_eps`: loading single EPS based on ticker code
  - `load_yahoo_pe`: loading multiple PE based on ticker codes

# kb.yahoo 2.0.0

* Allowing multiple ticker inputs in `load_data`

# kb.yahoo 1.5.4

* Loading day 3 if both day 1 and 2 are missing in `load_stock_price`

# kb.yahoo 1.5.3

* Fixing bug in `load_stock_price` related to missing data

# kb.yahoo 1.5.2

* Bug fix related to `load_data` where quantmod returns rownames having ambiguous dates

# kb.yahoo 1.5.1

* Adjusting calculation in `prince_change_since_start`

# kb.yahoo 1.5.0

* Adding `prefix` parameter to `load_data`
* Removing start up message from `quantmod`

# kb.yahoo 1.4.0

* Adding column ChangeFromStart to output of `load_data`
* Added a `NEWS.md` file to track changes to the package.
