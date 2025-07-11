% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/card_class.R
\name{card}
\alias{card}
\title{Create a Card Vector}
\usage{
card(rank = character(), suit = character())
}
\arguments{
\item{rank}{A character vector of ranks (e.g., "A", "2", ..., "K").}

\item{suit}{A character vector of suits (e.g., "♠", "♥", "♦", "♣").}
}
\value{
An object of class \code{"card"} representing the provided cards.
}
\description{
Constructs a custom S3 \code{rcrd} object of class \code{"card"}, with validated \code{rank} and \code{suit} fields.
Used as the foundation for representing cards in the Blackjack game package.
}
\details{
This constructor performs input validation to ensure ranks and suits are valid and of equal length.
Use this function to create cards manually or when writing helper functions that build decks or hands.
}
\examples{
card(c("A", "10", "Q"), c("♠", "♥", "♦"))

}
