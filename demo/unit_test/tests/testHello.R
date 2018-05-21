context("TDD with R")
  test_that("Hello World", {
    expect_equal("Hello somkiat", say_hi("somkiat"))
  })
