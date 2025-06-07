#' Print a Blackjack Game Summary
#'
#' Displays the dealer’s hand and score, followed by each player's hand, score, and result.
#' This function is called automatically when printing objects of class `blackjack_game`.
#'
#' @param x An object of class `blackjack_game` returned by \code{\link{simulate_blackjack_game}}.
#' @param ... Additional arguments passed to internal print methods (not used).
#'
#' @details
#' This method provides a clean summary of a simulated game round. It is especially helpful
#' for quick inspection when calling a game object in the console.
#'
#' @return Invisibly returns the original `blackjack_game` object.
#'
#' @examples
#' game <- simulate_blackjack_game(num_players = 2, seed = 42)
#' print(game)
#'
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
