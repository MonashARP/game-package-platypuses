test_that("blackjack_score handles regular hands correctly", {
  hand <- card(c("10", "9"), c("♠", "♦"))
  expect_equal(blackjack_score(hand), 19)
})

test_that("blackjack_score handles Aces as 11 correctly", {
  hand <- card(c("A", "8"), c("♠", "♣"))
  expect_equal(blackjack_score(hand), 19)
})

test_that("blackjack_score adjusts Aces to 1 when needed", {
  hand <- card(c("A", "9", "4"), c("♠", "♣", "♦"))
  expect_equal(blackjack_score(hand), 14)
})

test_that("blackjack_score handles multiple Aces correctly", {
  hand <- card(c("A", "A", "9"), c("♠", "♦", "♣"))
  expect_equal(blackjack_score(hand), 21)
})

test_that("blackjack_score handles Blackjack (21) with two cards", {
  hand <- card(c("A", "K"), c("♠", "♦"))
  expect_equal(blackjack_score(hand), 21)
})

test_that("blackjack_score handles empty hand", {
  hand <- card()
  expect_equal(blackjack_score(hand), 0)
})

test_that("blackjack_score treats all face cards as 10", {
  hand <- card(c("J", "Q", "K"), c("♠", "♥", "♦"))
  expect_equal(blackjack_score(hand), 30)
})

test_that("blackjack_score handles three Aces properly", {
  hand <- card(c("A", "A", "A"), c("♠", "♥", "♦"))
  expect_equal(blackjack_score(hand), 13)
})

test_that("blackjack_score reduces Aces to avoid bust", {
  hand <- card(c("A", "K", "9"), c("♠", "♦", "♣"))  # Should be 20 (11 + 10 + 9 = 30 -> Ace to 1)
  expect_equal(blackjack_score(hand), 20)
})

test_that("blackjack_score errors on invalid input", {
  expect_error(blackjack_score("A, K"), "`hand` must be a card vector")
})


