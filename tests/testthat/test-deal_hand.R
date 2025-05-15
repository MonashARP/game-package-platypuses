test_that("deal_hand() returns the correct number of cards", {
  deck <- deck_cards()$cards
  hand <- deal_hand(deck, 2)
  expect_length(hand, 2)
  expect_type(hand, "character")
  expect_true(all(hand %in% deck))
})

test_that("deal_hand() works with different hand sizes", {
  deck <- deck_cards()$cards
  hand_5 <- deal_hand(deck, 5)
  expect_length(hand_5, 5)

  hand_10 <- deal_hand(deck, 10)
  expect_length(hand_10, 10)
})

test_that("deal_hand() returns unique cards when n is less than deck size", {
  deck <- deck_cards()$cards
  hand <- deal_hand(deck, 10)
  expect_equal(length(unique(hand)), 10)
})

