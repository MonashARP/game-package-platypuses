#' Print Method for blackjack_game Objects
#'
#' Nicely formats the output of a simulated Blackjack game.
#'
#' @param x An object of class 'blackjack_game'.
#' @param ... Additional arguments (ignored).
#'
#' @export
print.blackjack_game <- function(x, ...) {
  cat("=== Dealer ===\n")
  cat("Hand:", paste(x$dealer$hand, collapse = " "), "\n")
  cat("Score:", x$dealer$score, "\n\n")

  for (i in seq_along(x$players)) {
    p <- x$players[[i]]
    cat(paste0("=== Player ", i, " ===\n"))
    cat("Hand:", paste(p$hand, collapse = " "), "\n")
    cat("Score:", p$score, "\n")
    cat("Result:", p$result, "\n\n")
  }

  invisible(x)
}
