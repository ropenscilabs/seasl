test_that("csl_styles: after files downloaded", {
  skip_on_cran()

  # tests
  invisible(csl_fetch_styles())
  aa <- csl_styles()

  expect_is(aa, "list")
  expect_length(aa, 2)
  expect_gt(length(aa$independent), 10)
  expect_gt(length(aa$dependent), 10)
})

test_that("csl_styles: files downloaded gone", {
  skip_on_cran()

  csl_cache$delete_all()
  aa <- csl_styles()

  expect_is(aa, "list")
  expect_length(aa, 2)
  expect_length(aa$independent, 0)
  expect_length(aa$dependent, 0)
})
