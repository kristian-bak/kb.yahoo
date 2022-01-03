devtools::document()

devtools::load_all()

usethis::use_package("dplyr")
usethis::use_package("quantmod")

renv::status()
renv::snapshot()

devtools::test()

devtools::test_coverage()

usethis::use_version()
