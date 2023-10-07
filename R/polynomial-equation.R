#' Calculate the Roots of the Polynomial Equation
#'
#' @description
#' This function is used to solve polynomial equations, including quadratic equations.
#'
#' It takes a vector of coefficients as input and determines the nature of the roots
#' of the polynomial equation. The function provides informative messages indicating
#' whether the equation has real or complex roots and, if real, how many roots there are.
#'
#' @param coefficients A list of numbers depending upon the degree of polynomial equation.
#'  (Combined list of numbers using c(). List should not be more than 6 numbers long meaning
#'   only 5 degrees of freedom allowed. If you want to find roots of a quadratic equation(degrees = 2),
#'   number of coefficients should be degrees+1 i.e. 3)
#'
#' @return Prints a message consisting of roots of the polynomial equation
#'
#' @examples
#' # Example 1
#' quadratic <- c(1, 4, 4)
#' polynomial_equation(quadratic)
#'
#' # Example 2
#' fourth_order <- c(1, -4, 7, -5, 2)
#' polynomial_equation(fourth_order)
#'
#' # Example 3
#' third_order <- c(1, -4, 7, -5)
#' polynomial_equation(third_order)
#'
#' @seealso \code{\link{polyroot}}
#'
#' @keywords polynomial quadratic equation roots
#' @export

polynomial_equation <- function(coefficients) {
  if (!is.numeric(coefficients)) {
    stop("Input coefficients must be a numeric vector")
  }
  if (coefficients[1] == 0) {
    stop("First coefficient must be greater than 0")
  }
  if (length(coefficients) <= 2 | length(coefficients) >= 6) {
    print("Coefficients out of range. Enter at least 3 coefficients or less than 7 coefficients")
  } else {
    if (length(coefficients) == 3) {
      a <- as.numeric(coefficients[1])
      b <- as.numeric(coefficients[2])
      c <- as.numeric(coefficients[3])
      discriminant <- b^2 - 4 * a * c
      if (discriminant < 0) {
        cat("No real roots\n")
      } else if (discriminant == 0) {
        root <- -b / (2 * a)
        cat("One real root:", root, "\n")
      } else {
        root1 <- (-b + sqrt(discriminant)) / (2 * a)
        root2 <- (-b - sqrt(discriminant)) / (2 * a)
        cat("Two real roots:", root1, "and", root2, "\n")
      }
    } else {
      roots <- polyroot(coefficients)
      cat("Complex roots:", roots, "\n")
    }
  }
}
