#' Simulate a Multiplayer Blackjack Game
#'
#' This function simulates a complete round of Blackjack between one or more players and a dealer.
#' Each player is dealt two cards and follows a simple decision strategy (e.g., hit on low scores).
#' The dealer plays according to standard rules, including hitting on soft 17.
#'
#' @param num_players Integer. Number of players in the game (default is 1).
#' @param seed Optional integer. If provided, sets the random seed for reproducibility.
#'
#' @details
#' Each player acts independently and uses a basic AI decision rule:
#' hit below 12, stand at 17+, and probabilistic decisions between 12–16.
#' The dealer continues hitting until reaching 17 or more, and hits on a soft 17.
#'
#' @return A structured list of class `"blackjack_game"` containing:
#' \describe{
#'   \item{players}{A list of player results. Each contains the player's hand, final score, and outcome message.}
#'   \item{dealer}{A list with the dealer's final hand and score.}
#' }
#'
#' @examples
#' simulate_blackjack_game(num_players = 2, seed = 123)
#'
#' @importFrom stats runif
#' @export
simulate_blackjack_game <- function(num_players = 1, seed = NULL) {
  if (!is.null(seed)) set.seed(seed)

  # Create and shuffle deck
  deck_obj <- deck_cards()
  deck <- deck_obj$cards
  deck_index <- 1

  # Draw cards from deck
  draw_cards <- function(n) {
    cards <- deck[deck_index:(deck_index + n - 1)]
    deck_index <<- deck_index + n
    return(cards)
  }

  # Deal 2 cards to dealer
  dealer_hand <- draw_cards(2)

  # Deal 2 cards to each player
  player_hands <- vector("list", num_players)
  for (i in seq_len(num_players)) {
    player_hands[[i]] <- draw_cards(2)
  }

  # Player turns — simulate decisions
  for (i in seq_len(num_players)) {
    repeat {
      score <- blackjack_score(player_hands[[i]])
      if (score >= 21) break  # Stop on Blackjack or Bust

      if (score < 12) {
        decision <- "hit"
      } else if (score <= 16) {
        decision <- ifelse(runif(1) < 0.7, "hit", "stand")
      } else {
        decision <- "stand"
      }

      if (decision == "stand") break
      player_hands[[i]] <- c(player_hands[[i]], draw_cards(1))
    }
  }

  # Dealer turn — hit until 17+, hit on soft 17
  dealer_score <- blackjack_score(dealer_hand)
  while (dealer_score < 17 || (dealer_score == 17 && is_soft_17(dealer_hand))) {
    dealer_hand <- c(dealer_hand, draw_cards(1))
    dealer_score <- blackjack_score(dealer_hand)
  }

  # Compute all player scores once
  player_scores <- lapply(player_hands, blackjack_score)

  # Results
  results <- character(num_players)
  dealer_bust <- dealer_score > 21

  for (i in seq_len(num_players)) {
    player_score <- player_scores[[i]]

    if (player_score > 21) {
      results[i] <- "Player busts! Dealer wins."
    } else if (dealer_bust) {
      results[i] <- "Dealer busts! Player wins."
    } else if (player_score > dealer_score) {
      results[i] <- "Player wins!"
    } else if (player_score < dealer_score) {
      results[i] <- "Dealer wins!"
    } else {
      results[i] <- "Tie!"
    }
  }

  # Return summary
  endgame <- structure(
    list(
      players = lapply(seq_len(num_players), function(i) {
        list(
          hand = player_hands[[i]],
          score = player_scores[[i]],
          result = results[i]
        )
      }),
      dealer = list(
        hand = dealer_hand,
        score = dealer_score
      )
    ),
    class = "blackjack_game"
  )

  return(endgame)
}
