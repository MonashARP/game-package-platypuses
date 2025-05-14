test_that("deck_cards() returns correct structure and standard deck", {
  deck1 <- deck_cards(1)
  expect_s3_class(deck1, "blackjack_deck")
  expect_type(deck1$cards, "character")
  expect_length(deck1$cards, 52)
})

test_that("deck_cards() works with multiple decks", {
  deck2 <- deck_cards(3)
  expect_s3_class(deck2, "blackjack_deck")
  expect_length(deck2$cards, 156)
})

test_that("deck_cards() shows an error for invalid input values", {
  expect_error(deck_cards(0), "must be a positive whole number")
  expect_error(deck_cards(-2), "must be a positive whole number")
  expect_error(deck_cards(1.5), "must be a positive whole number")
  expect_error(deck_cards("two"), "must be a positive whole number")
})

