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

  suits <- c("♠", "♥", "♦", "♣")
  ranks <- c("A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K")

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








