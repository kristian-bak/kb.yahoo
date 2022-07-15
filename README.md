
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
devtools::install_github("kristian-bak/kb.yahoo")
```

## Example

``` r
library(kb.yahoo)
load_data(ticker = "NOVO-B.CO", from = "2022-01-01")
#> Registered S3 method overwritten by 'quantmod':
#>   method            from
#>   as.zoo.data.frame zoo
#> # A tibble: 132 x 9
#>    Date        Open  High   Low Close Adjusted Change ChangeSinceStart  Volume
#>    <date>     <dbl> <dbl> <dbl> <dbl>    <dbl>  <dbl>            <dbl>   <dbl>
#>  1 2022-01-03  737.  744.  712.  712.     706.  NA                0    1514930
#>  2 2022-01-04  714   715.  682.  691.     685.  -3.05            -3.05 3391956
#>  3 2022-01-05  691.  696.  686.  686.     679.  -0.82            -3.89 2195967
#>  4 2022-01-06  672.  681.  659.  667.     661.  -2.79            -6.79 2515442
#>  5 2022-01-07  668   670.  658.  664.     658.  -0.5             -7.32 2674677
#>  6 2022-01-10  666.  671.  653.  655.     649.  -1.31            -8.73 1816211
#>  7 2022-01-11  664.  675.  655.  655.     649.  -0.03            -8.76 1949872
#>  8 2022-01-12  657.  664.  651.  658.     651.   0.4             -8.33 2019817
#>  9 2022-01-13  655   656.  649.  651.     644.  -1.09            -9.51 1492940
#> 10 2022-01-14  647.  650   625.  625.     619.  -4.15           -14.1  2927179
#> # ... with 122 more rows
```
