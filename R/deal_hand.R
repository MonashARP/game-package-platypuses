#' Deal a Hand of Blackjack Cards
#'
#' Randomly selects a specified number of cards from a given deck.
#' This function is typically used to deal an initial hand to a player or dealer
#' in a round of Blackjack.
#'
#' @param deck A character vector of cards (default: deck_cards())
#' @param n Number of cards to deal (default is 2)
#' @return A character vector containing the dealt cards
#' @export
#' @examples
#' deal_hand(deck_cards()$cards, 2)
deal_hand <- function(deck, n = 2) {
  sample(deck, n)
}


