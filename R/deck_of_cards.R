#' Create a Blackjack Deck
#'
#' Generates a shuffled deck used in Blackjack.
#' You can specify the number of standard 52-card decks to include.
#'
#' @param no_of_decks Number of standard decks to include (default is 1)
#' @return An object of class blackjack_deck, which is a list containing the shuffled cards and number of decks.
#' @export
#' @examples
#' deck <- deck_cards()

deck_cards <- function(no_of_decks = 1) {
  if (!is.numeric(no_of_decks) || no_of_decks < 1 || no_of_decks %% 1 != 0) {
    stop("no_of_decks must be a positive whole number")
  }
  symbols <- c("♠", "♥", "♦", "♣")
  cards <- c("A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K")
  deck <- paste(cards, rep(symbols, each = 13), sep = "")
  full_deck <- rep(deck, no_of_decks)
  shuffled <- sample(full_deck)

  structure(
    list(cards = shuffled, decks = no_of_decks),
    class = "blackjack_deck"
  )
}







