test_that("card() creates valid card objects", {
  x <- card(c("A", "10", "Q"), c("♠", "♥", "♦"))

  expect_s3_class(x, "card")
  expect_equal(format(x), c("A♠", "10♥", "Q♦"))
})

test_that("card() throws error for invalid rank", {
  expect_error(card(c("A", "11"), c("♠", "♦")), "all\\(rank %in% valid_ranks\\)")
})

test_that("card() throws error for invalid suit", {
  expect_error(card(c("A", "10"), c("♠", "X")), "all\\(suit %in% valid_suits\\)")
})

test_that("card() throws error for mismatched lengths", {
  expect_error(card(c("A", "10", "Q"), c("♠", "♥")), "length\\(rank\\) == length\\(suit\\)")
})

test_that("vec_cast.character.card() works", {
  x <- card(c("A", "10"), c("♠", "♥"))
  expect_equal(vec_cast(x, character()), c("A♠", "10♥"))
})

test_that("vec_cast.card.character() works", {
  x <- vec_cast(c("A♠", "10♥"), to = new_card())
  expect_s3_class(x, "card")
  expect_equal(format(x), c("A♠", "10♥"))
})

test_that("c.card() combines card vectors", {
  a <- card("A", "♠")
  b <- card("10", "♦")
  result <- c(a, b)
  expect_s3_class(result, "card")
  expect_equal(format(result), c("A♠", "10♦"))
})
