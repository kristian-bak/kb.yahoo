
<!-- README.md is generated from README.Rmd. Please edit that file -->

# kb.yahoo

<!-- badges: start -->
<!-- badges: end -->

The goal of kb.yahoo is to create a simple wrapper for `quantmod` in
order to load stock data and data from FRED.

## Installation

You can install the development version of kb.yahoo from
[GitHub](https://github.com/) with:

``` r
devtools::install_github("kristian-bak/yahoo")
```

## Example

``` r
library(kb.yahoo)
load_data(ticker = "NOVO-B.CO", from = "2022-01-01")
#> Registered S3 method overwritten by 'quantmod':
#>   method            from
#>   as.zoo.data.frame zoo
#> 'getSymbols' currently uses auto.assign=TRUE by default, but will
#> use auto.assign=FALSE in 0.5-0. You will still be able to use
#> 'loadSymbols' to automatically load data. getOption("getSymbols.env")
#> and getOption("getSymbols.auto.assign") will still be checked for
#> alternate defaults.
#> 
#> This message is shown once per session and may be disabled by setting 
#> options("getSymbols.warning4.0"=FALSE). See ?getSymbols for details.
#> # A tibble: 45 x 8
#>    Date        Open  High   Low Close Adjusted Change  Volume
#>    <date>     <dbl> <dbl> <dbl> <dbl>    <dbl>  <dbl>   <dbl>
#>  1 2022-01-03  737.  744.  712.  712.     712.  NA    1514930
#>  2 2022-01-04  714   715.  682.  691.     691.  -3.05 3391956
#>  3 2022-01-05  691.  696.  686.  686.     686.  -0.82 2195967
#>  4 2022-01-06  672.  681.  659.  667.     667.  -2.79 2515442
#>  5 2022-01-07  668   670.  658.  664.     664.  -0.5  2674677
#>  6 2022-01-10  666.  671.  653.  655.     655.  -1.31 1816211
#>  7 2022-01-11  664.  675.  655.  655.     655.  -0.03 1949872
#>  8 2022-01-12  657.  664.  651.  658.     658.   0.4  2019817
#>  9 2022-01-13  655   656.  649.  651.     651.  -1.09 1492940
#> 10 2022-01-14  647.  650   625.  625.     625.  -4.15 2927179
#> # ... with 35 more rows
```
