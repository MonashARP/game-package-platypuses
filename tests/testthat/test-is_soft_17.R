test_that("is_soft_17 correctly identifies soft 17 hands", {
  # Valid soft 17 hand: A + 6
  hand1 <- card(c("A", "6"), c("♠", "♣"))
  expect_true(is_soft_17(hand1))

  # Not a soft 17: 10 + 7
  hand2 <- card(c("10", "7"), c("♦", "♣"))
  expect_false(is_soft_17(hand2))

  # Valid soft 17: A + 3 + 3 (Ace = 11)
  hand3 <- card(c("A", "3", "3"), c("♠", "♦", "♥"))
  expect_true(is_soft_17(hand3))

  # Valid soft 17: A + 2 + 4 (Ace = 11)
  hand4 <- card(c("A", "2", "4"), c("♠", "♣", "♦"))
  expect_true(is_soft_17(hand4))

  # Same hand: test both score and soft17
  hand5 <- card(c("A", "2", "4"), c("♠", "♣", "♦"))
  expect_equal(blackjack_score(hand5), 17)
  expect_true(is_soft_17(hand5))

  # Edge case: A + 2 + 3 + A = 17, Ace counted as 11
  hand6 <- card(c("A", "2", "3", "A"), c("♠", "♥", "♣", "♦"))
  expect_true(is_soft_17(hand6))

  # Invalid input: non-card object
  expect_error(is_soft_17(c("A♠", "6♣")), "`hand` must be a card vector")
})
