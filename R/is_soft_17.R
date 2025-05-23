#' Check if Dealer Has a Soft 17
#'
#' A soft 17 means the hand totals 17 with an Ace counted as 11.
#'
#' @param hand Character vector of cards (e.g. c("A♠", "6♣")).
#'
#' @return Logical. TRUE if the hand is a soft 17, FALSE otherwise.
#' @export
#'
#' @examples
#' is_soft_17(c("A♠", "6♣"))  # TRUE
#' is_soft_17(c("10♠", "7♦")) # FALSE
is_soft_17 <- function(hand) {
  ranks <- gsub("[♠♥♦♣]", "", hand)
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
