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
