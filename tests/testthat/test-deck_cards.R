test_that("deck_cards() returns correct structure and standard deck", {
  d <- deck_cards(1)

  expect_s3_class(d, "blackjack_deck")
  expect_s3_class(d$cards, "card")
  expect_length(d$cards, 52)

  ranks <- card_rank(d$cards)
  suits <- card_suit(d$cards)
  combos <- paste0(ranks, suits)
  expect_equal(length(unique(combos)), 52)
  expect_true(all(table(combos) == 1))
})

test_that("deck_cards works with multiple decks", {
  d2 <- deck_cards(2)
  expect_s3_class(d2$cards, "card")
  expect_length(d2$cards, 104)

  ranks2 <- card_rank(d2$cards)
  suits2 <- card_suit(d2$cards)
  combos2 <- paste0(ranks2, suits2)
  expect_true(all(table(combos2) == 2))
})

test_that("deck_cards() shows an error for invalid input values", {
  expect_error(deck_cards(0), "must be a positive whole number")
  expect_error(deck_cards(-1), "must be a positive whole number")
  expect_error(deck_cards(1.5), "must be a positive whole number")
  expect_error(deck_cards("two"), "must be a positive whole number")
})
