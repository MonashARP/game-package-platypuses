% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/print_blackjack_game.R
\name{print.blackjack_game}
\alias{print.blackjack_game}
\title{Print a Blackjack Game Summary}
\usage{
\method{print}{blackjack_game}(x, ...)
}
\arguments{
\item{x}{An object of class \code{blackjack_game} returned by \code{\link{simulate_blackjack_game}}.}

\item{...}{Additional arguments passed to internal print methods (not used).}
}
\value{
Invisibly returns the original \code{blackjack_game} object.
}
\description{
Displays the dealer’s hand and score, followed by each player's hand, score, and result.
This function is called automatically when printing objects of class \code{blackjack_game}.
}
\details{
This method provides a clean summary of a simulated game round. It is especially helpful
for quick inspection when calling a game object in the console.
}
\examples{
game <- simulate_blackjack_game(num_players = 2, seed = 42)
print(game)

}
