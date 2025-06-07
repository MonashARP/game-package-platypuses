test_that("deal_hand() returns the correct number of cards", {
  deck <- deck_cards(1)$cards
  hand <- deal_hand(deck, n = 2)
  expect_s3_class(hand, "card")
  expect_length(hand, 2)

  expect_true(all(format(hand) %in% format(deck)))

  hand3 <- deal_hand(deck, n = 3)
  expect_s3_class(hand3, "card")
  expect_length(hand3, 3)
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

