test_that("simulate_blackjack_game returns valid structure", {
  result <- simulate_blackjack_game(num_players = 2, seed = 123)

  # Dealer’s final hand must be at least 2 cards long
  expect_s3_class(result$dealer$hand, "card")
  expect_gte(length(result$dealer$hand), 2)

  # Each player’s final hand must be at least 2 cards long
  for (player in result$players) {
    expect_s3_class(player$hand, "card")
    expect_gte(length(player$hand), 2)
  }
})

test_that("simulate_blackjack_game returns correct summary for no players", {
  result <- simulate_blackjack_game(num_players = 0, seed = 123)

  # Dealer still has at least 2 cards
  expect_s3_class(result$dealer$hand, "card")
  expect_gte(length(result$dealer$hand), 2)
})

test_that("print.blackjack_game behaves correctly", {
  game <- simulate_blackjack_game(num_players = 1, seed = 456)

  output <- capture.output(print(game))
  expect_true(any(grepl("Dealer's hand:", output)))
  expect_true(any(grepl("[2-9AQJK10][♠♥♦♣]", output)))
})
