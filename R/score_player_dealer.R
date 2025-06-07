#' Calculate the Score of a Blackjack Hand
#'
#' This function computes the total value of a Blackjack hand using a C++ backend for efficient scoring.
#' Aces are treated as 11 unless doing so causes the hand to bust, in which case they are treated as 1.
#'
#' @param hand A `card` vector representing the hand to be scored (e.g., `card(c("A","10"), c("♠","♦"))`).
#'
#' @details
#' This function calls an underlying C++ function (`score_hand_cpp`) for performance.
#' It automatically adjusts Ace values and supports hands of any length.
#'
#' @return A numeric value between 2 and 31 representing the total score of the hand.
#'
#' @examples
#' blackjack_score(card(c("A", "10"), c("♠", "♦")))       # returns 21
#' blackjack_score(card(c("A", "9", "2"), c("♠", "♣", "♦"))) # returns 12
#'
#' @useDynLib Blackjack, .registration = TRUE
#' @importFrom Rcpp evalCpp
#' @export
blackjack_score <- function(hand) {
  if (!inherits(hand, "card")) {
    stop("`hand` must be a card vector.")
  }

  ranks <- card_rank(hand)
  score_hand_cpp(ranks)
}

