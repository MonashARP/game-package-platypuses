% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_soft_17.R
\name{is_soft_17}
\alias{is_soft_17}
\title{Check if a Hand is a Soft 17}
\usage{
is_soft_17(hand)
}
\arguments{
\item{hand}{A \code{card} vector representing a Blackjack hand (e.g. \code{card(c("A", "6"), c("♠", "♣"))}).}
}
\value{
A logical value: \code{TRUE} if the hand is a soft 17, \code{FALSE} otherwise.
}
\description{
Determines whether a Blackjack hand qualifies as a "soft 17".
A soft 17 is a total of 17 where an Ace is being counted as 11.
This distinction affects the dealer's behavior — dealers typically hit on soft 17.
}
\details{
The function uses the \code{blackjack_score()} to calculate the hand’s value assuming optimal Ace handling,
and then checks if lowering the Ace(s) to 1 would reduce the total below 17. If so, the hand is a soft 17.
}
\examples{
is_soft_17(card(c("A", "6"), c("♠", "♣")))   # TRUE
is_soft_17(card(c("10", "7"), c("♠", "♦")))  # FALSE

}
