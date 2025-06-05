#' Deal a Hand of Blackjack Cards
#'
#' Randomly selects a specified number of cards from a given deck.
#' This function is typically used to deal the initial hand to a player or the dealer
#' in a round of Blackjack.
#'
#' @param deck A `card` vector representing the deck to deal from, typically `deck_cards()$cards`.
#' @param n Integer. Number of cards to deal (default is 2).
#'
#' @details
#' This function samples cards from a shuffled `card` vector. It does not remove dealt cards
#' from the original deck — if needed, you can manage deck state manually using indexing.
#'
#' @return A `card` vector containing the dealt hand.
#'
#' @examples
#' deck <- deck_cards()
#' hand <- deal_hand(deck$cards, 2)
#' print(hand)
#'
#' @export
deal_hand <- function(deck, n = 2) {
  sample(deck, n)
}


