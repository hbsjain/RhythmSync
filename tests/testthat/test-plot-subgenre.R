test_that("Test plot_subgenre function", {
  input_genre <- "nonexistent_genre"
  tryCatch(
    {
      p <- plot_subgenre(input_genre)
      expect_error()
    },
    error = function(e) {
      expect_true(grepl("subset", e$message))
    }
  )

  input_genre <- 123
  tryCatch(
    {
      p <- plot_subgenre(input_genre)
      expect_error()
    },
    error = function(e) {
      expect_true(grepl("input_genre must be a character", e$message))
    }
  )
})
