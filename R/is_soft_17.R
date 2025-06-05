#' Check if a Hand is a Soft 17
#'
#' Determines whether a Blackjack hand qualifies as a "soft 17".
#' A soft 17 is a total of 17 where an Ace is being counted as 11.
#' This distinction affects the dealer's behavior — dealers typically hit on soft 17.
#'
#' @param hand A `card` vector representing a Blackjack hand (e.g. `card(c("A", "6"), c("♠", "♣"))`).
#'
#' @details
#' The function uses the `blackjack_score()` to calculate the hand’s value assuming optimal Ace handling,
#' and then checks if lowering the Ace(s) to 1 would reduce the total below 17. If so, the hand is a soft 17.
#'
#' @return A logical value: `TRUE` if the hand is a soft 17, `FALSE` otherwise.
#'
#' @examples
#' is_soft_17(card(c("A", "6"), c("♠", "♣")))   # TRUE
#' is_soft_17(card(c("10", "7"), c("♠", "♦")))  # FALSE
#'
#' @export
is_soft_17 <- function(hand) {
  if (!inherits(hand, "card")) {
    stop("`hand` must be a card vector.")
  }

  ranks <- card_rank(hand)
  if (!"A" %in% ranks) return(FALSE)

  total <- blackjack_score(hand)

  # Convert Aces to 1s and sum
  rank_values_low <- c(
    "2" = 2, "3" = 3, "4" = 4, "5" = 5, "6" = 6,
    "7" = 7, "8" = 8, "9" = 9, "10" = 10,
    "J" = 10, "Q" = 10, "K" = 10, "A" = 1
  )
  values_low <- sum(rank_values_low[ranks])

  return(total == 17 && values_low < 17)
}
