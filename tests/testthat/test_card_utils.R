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

test_that("card_* functions handle empty card vectors", {
  empty <- card()
  expect_equal(card_suit(empty), character(0))
  expect_equal(card_rank(empty), character(0))
  expect_equal(is_face_card(empty), logical(0))
})

test_that("card_* functions handle repeated cards", {
  repeated <- card(c("K", "K", "2"), c("♠", "♠", "♣"))
  expect_equal(card_rank(repeated), c("K", "K", "2"))
  expect_equal(card_suit(repeated), c("♠", "♠", "♣"))
})

test_that("card_suit and card_rank preserve order", {
  mixed <- card(c("5", "J", "A"), c("♦", "♣", "♥"))
  expect_identical(card_rank(mixed), c("5", "J", "A"))
  expect_identical(card_suit(mixed), c("♦", "♣", "♥"))
})

test_that("is_face_card handles all face cards", {
  all_faces <- card(c("J", "Q", "K"), c("♠", "♠", "♠"))
  expect_true(all(is_face_card(all_faces)))
})

test_that("card() accepts numeric-looking strings as ranks", {
  test_cards <- card(c("2", "10"), c("♠", "♥"))
  expect_equal(card_rank(test_cards), c("2", "10"))
  expect_equal(card_suit(test_cards), c("♠", "♥"))
})

test_that("card_value() returns correct numeric values", {
  x <- card(c("2", "10", "K", "Q", "A", "3"), c("♠", "♦", "♣", "♥", "♠", "♣"))
  expect_equal(card_value(x), c(2, 10, 10, 10, 11, 3))
})

test_that("card_value() handles single face card and ace", {
  face <- card("J", "♣")
  ace <- card("A", "♦")
  expect_equal(card_value(face), 10)
  expect_equal(card_value(ace), 11)
})

test_that("card_value() handles empty input", {
  empty <- card()
  expect_equal(card_value(empty), numeric(0))
})

test_that("card_value() errors on non-card input", {
  expect_error(card_value(1:3), "`card_value\\(\\)` requires a `card` object\\.")
})

