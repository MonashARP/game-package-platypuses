#' Score a Blackjack Hand
#'
#' This function calculates the total score of a given Blackjack hand.
#' Aces are treated as 11 unless it causes the hand to bust, in which case
#' they are treated as 1.
#'
#' @param hand A `card` vector (e.g., `card(c("A","10"), c("♠","♦"))`).
#'
#' @return A numeric value representing the score of the hand.
#' @examples
#' blackjack_score(card(c("A","10"), c("♠","♦")))   # returns 21
#' blackjack_score(card(c("A","9","2"), c("♠","♣","♦")))  # returns 12
#' @export
blackjack_score <- function(hand) {
  if (!inherits(hand, "card")) {
    stop("`hand` must be a card vector.")
  }

  ranks <- card_rank(hand)

  # Define the value for each card rank
  rank_values <- c(
    "2" = 2, "3" = 3, "4" = 4, "5" = 5, "6" = 6,
    "7" = 7, "8" = 8, "9" = 9, "10" = 10,
    "J" = 10, "Q" = 10, "K" = 10, "A" = 11
  )

  values <- rank_values[ranks]
  total <- sum(values)

  # Adjust for Aces if total is over 21
  num_aces <- sum(ranks == "A")
  while (total > 21 && num_aces > 0) {
    total <- total - 10
    num_aces <- num_aces - 1
  }

  return(total)
}
