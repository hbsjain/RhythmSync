test_that("Test cases for polynomial_equation function", {

  # Test case 1: Quadratic equation with two real roots
  expect_error(expect_s3_class(list(1,2,3), "numeric", label = "Argument should be a numeric vector"))

  # Test case 2: Quadratic equation with two real roots
  expect_error(expect_s3_class(c("1", "-3", "2"), "numeric", label = "Argument should be a numeric vector"))

  # Test case 3: Quadratic equation with two real roots
  expect_error(expect_s3_class(c("1 + 2i", -3, 2), "numeric", label = "Argument should be a numeric vector"))

  # Test case 4: Quadratic equation with two real roots
  expect_output(polynomial_equation(c(1, -3, 2)), "Two real roots: 2 and 1")

  # Test case 5: Quadratic equation with one real root
  expect_output(polynomial_equation(c(1, -4, 4)), "One real root: 2")

  # Test case 6: Quadratic equation with complex roots
  expect_output(polynomial_equation(c(1, 2, 5)), "No real roots")

  # Test input validation: Not enough coefficients
  expect_output(polynomial_equation(c(1, 2)), "Coefficients out of range. Enter at least 3 coefficients or less than 7 coefficients")

  # Test input validation: Too many coefficients
  expect_output(polynomial_equation(c(1, 2, 3, 4, 5, 6)), "Coefficients out of range. Enter at least 3 coefficients or less than 7 coefficients")

  # Test input validation: Zero as the leading coefficient
  expect_error(polynomial_equation(c(0, 2, 3)))
})
