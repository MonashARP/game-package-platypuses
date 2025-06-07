#' Create a Shuffled Blackjack Deck
#'
#' Generates a shuffled deck of cards for use in Blackjack games.
#' Supports combining multiple standard 52-card decks into one.
#'
#' @param no_of_decks Integer. Number of standard decks to include (default is 1).
#'
#' @details
#' Each card is represented using the custom `card` vector class. The returned object includes
#' a shuffled vector of cards and metadata about the number of decks used. This function is typically
#' used as the starting point for dealing hands in the game.
#'
#' @return An object of class `"blackjack_deck"`, which is a list with two elements:
#' \describe{
#'   \item{cards}{A shuffled `card` vector.}
#'   \item{decks}{The number of decks used to create the full shoe.}
#' }
#'
#' @examples
#' deck <- deck_cards()
#' print(deck)
#' print(deck$cards)
#' head(deck$cards)
#'
#' @export
deck_cards <- function(no_of_decks = 1) {
  if (!is.numeric(no_of_decks) || no_of_decks < 1 || no_of_decks %% 1 != 0) {
    stop("no_of_decks must be a positive whole number")
  }

  suits <- c("♠", "♥", "♦", "♣")
  ranks <- c(as.character(2:10), "J", "Q", "K", "A")

  all_cards <- paste0(rep(ranks, times = length(suits)), rep(suits, each = length(ranks)))
  full_deck <- rep(all_cards, no_of_decks)
  shuffled <- sample(full_deck)

  card_ranks <- substr(shuffled, 1, nchar(shuffled) - 1)
  card_suits <- substr(shuffled, nchar(shuffled), nchar(shuffled))

  card_obj <- card(card_ranks, card_suits)

  structure(
    list(cards = card_obj, decks = no_of_decks),
    class = "blackjack_deck"
  )
}








