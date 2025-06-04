# R/print_blackjack_game.R

#' Print a Blackjack Game Summary
#'
#' @param x An object of class 'blackjack_game'
#' @export
print.blackjack_game <- function(x, ...) {
  # Print dealer’s final hand
  cat("Dealer's hand: ", paste(format(x$dealer$hand), collapse = " "), "\n")
  cat("Dealer's score: ", x$dealer$score, "\n\n")

  # Print each player’s hand, score, and result
  for (i in seq_along(x$players)) {
    player <- x$players[[i]]
    cat("Player ", i, " hand: ", paste(format(player$hand), collapse = " "), "\n", sep = "")
    cat("Player ", i, " score: ", player$score, "\n", sep = "")
    cat("Player ", i, " result: ", player$result, "\n\n", sep = "")
  }

  invisible(x)
}
