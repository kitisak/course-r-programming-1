library('testthat')
source('./src/hello.R')
test_dir('./tests', reporter = 'Summary')