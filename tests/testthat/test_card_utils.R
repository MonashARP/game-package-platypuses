test_that("card_suit() returns the suit field", {
  x <- card(c("A", "10", "Q"), c("♠", "♦", "♥"))
  expect_equal(card_suit(x), c("♠", "♦", "♥"))
})

test_that("card_rank() returns the rank field", {
  x <- card(c("A", "10", "Q"), c("♠", "♦", "♥"))
  expect_equal(card_rank(x), c("A", "10", "Q"))
})

test_that("is_face_card() identifies J/Q/K correctly", {
  x <- card(c("J", "5", "K", "2"), c("♣", "♦", "♥", "♠"))
  expect_equal(is_face_card(x), c(TRUE, FALSE, TRUE, FALSE))
})

test_that("default methods error on non-card input", {
  expect_error(card_suit(letters), "`card_suit\\(\\)` requires a `card` object\\.")
  expect_error(card_rank(1:3), "`card_rank\\(\\)` requires a `card` object\\.")
  expect_error(is_face_card(NULL), "`is_face_card\\(\\)` requires a `card` object\\.")
})

test_that("card_suit/card_rank handle single-card vectors", {
  single <- card("7", "♦")
  expect_equal(card_suit(single), "♦")
  expect_equal(card_rank(single), "7")
  expect_false(is_face_card(single))
})
