
## Document
devtools::document()

## Load
devtools::load_all()

## Checking if everything works as expected
devtools::check()

## Add package
usethis::use_package("dplyr")
usethis::use_package("quantmod")
usethis::use_package("rvest")
usethis::use_package("purrr")

usethis::use_test(name = "load_stock_price")

## Renv
renv::status()
renv::snapshot()

## Run unit tests
devtools::test()

## See test coverage (Restart R session first, alternatively Click Addins -> Calculate package test coverage)
devtools::test_coverage()

## Bump versionnumber
usethis::use_version()

## Add pipe operator
usethis::use_pipe()

## Test installing
devtools::install()
