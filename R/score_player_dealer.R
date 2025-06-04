#' Score a Blackjack Hand
#'
#' This function calculates the total score of a given Blackjack hand using a C++ backend
#' Aces are treated as 11 unless it causes the hand to bust, in which case
#' they are treated as 1.
#'
#' @param hand A `card` vector (e.g., `card(c("A","10"), c("♠","♦"))`).
#' @useDynLib Blackjack, .registration = TRUE
#' @importFrom Rcpp evalCpp
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
  score_hand_cpp(ranks)
}

