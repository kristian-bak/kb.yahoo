test_that("Load yahoo data works", {

  data <- load_data(ticker = "NOVO-B.CO", from = "2021-01-01")

  cols <- c("Date", "Open", "High", "Low", "Close", "Adjusted", "Change", "ChangeFromStart", "Volume")

  ## Expecting identical column names
  expect_identical(names(data), cols)

  price <- data %>%
    dplyr::filter(Date == "2021-01-05") %>%
    dplyr::pull(Close) %>%
    round(2)

  ## Expecting a certain closing value in the first row
  expect_equal(price, 423.95)

  ## Expecting failure for unknown ticker
  expect_error(
    load_data(ticker = "Unknown", from = "2021-01-01"),
    "Load data failed for Unknown"
  )

})

test_that("Load FRED data works", {

  data <- load_data(ticker = "MORTGAGE30US", src = "FRED")

  cols <- c("Date", "Close", "Change", "ChangeFromStart")

  ## Expecting identical column names
  expect_identical(names(data), cols)

  price <- data %>%
    dplyr::filter(Date == "2022-01-06") %>%
    dplyr::pull(Close) %>%
    round(2)

  ## Expecting a certain closing value in the first row
  expect_equal(price, 3.22)

})
