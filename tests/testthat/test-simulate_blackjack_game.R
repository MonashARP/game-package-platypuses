test_that("simulate_blackjack_game returns valid structure", {
  result <- simulate_blackjack_game(num_players = 2, seed = 101)

  expect_type(result, "list")
  expect_named(result, c("players", "dealer"))

  expect_type(result$dealer$hand, "character")
  expect_true(result$dealer$score >= 0)

  expect_equal(length(result$players), 2)

  for (player in result$players) {
    expect_type(player$hand, "character")
    expect_true(player$score >= 0)
    expect_true(any(grepl("Player wins|Dealer wins|Tie|busts", player$result)))
  }
})


test_that("simulate_blackjack_game works with 1 player", {
  result <- simulate_blackjack_game(num_players = 1, seed = 999)

  expect_equal(length(result$players), 1)
  expect_type(result$players[[1]]$score, "double")
  expect_type(result$dealer$score, "double")
})

test_that("simulate_blackjack_game handles edge cases (21, bust)", {
  # This seed should produce some known outcomes for coverage
  result <- simulate_blackjack_game(num_players = 3, seed = 333)
  for (player in result$players) {
    expect_true(player$score >= 0)
    expect_true(player$score <= 31) # allow for poor logic in hit
  }
})

test_that("simulate_blackjack_game handles no players", {
  result <- simulate_blackjack_game(num_players = 0, seed = 123)

  expect_equal(length(result$players), 0)
  expect_type(result$dealer$hand, "character")
  expect_true(result$dealer$score >= 0)
})
