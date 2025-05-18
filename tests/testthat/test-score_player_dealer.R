test_that("blackjack_score handles regular hands correctly", {
  expect_equal(blackjack_score(c("10♠", "9♦")), 19)
  expect_equal(blackjack_score(c("J♠", "Q♦")), 20)
  expect_equal(blackjack_score(c("2♠", "5♦", "9♣")), 16)
})

test_that("blackjack_score handles Aces as 11 correctly", {
  expect_equal(blackjack_score(c("A♠", "8♣")), 19)
  expect_equal(blackjack_score(c("A♦", "9♣")), 20)
})

test_that("blackjack_score adjusts Aces to 1 when needed", {
  expect_equal(blackjack_score(c("A♠", "9♣", "4♦")), 14)
  expect_equal(blackjack_score(c("A♠", "9♣", "5♦")), 15)
})

test_that("blackjack_score handles multiple Aces correctly", {
  expect_equal(blackjack_score(c("A♠", "A♦", "9♣")), 21)
  expect_equal(blackjack_score(c("A♠", "A♦", "9♣", "3♥")), 14)
})

test_that("blackjack_score handles Blackjack (21) with two cards", {
  expect_equal(blackjack_score(c("A♠", "K♦")), 21)
})
