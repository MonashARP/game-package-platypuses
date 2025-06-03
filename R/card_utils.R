#' Extract the suit of a card
#'
#' @param x A `card` vector (vctrs record with fields `rank` and `suit`).
#' @return A character vector of suit symbols (one of "♠", "♥", "♦", "♣").
#' @examples
#' cards <- card(c("A", "10", "Q"), c("♠", "♥", "♦"))
#' card_suit(cards)
#' @export
card_suit <- function(x) {
  # Dispatch to method based on class(x)
  UseMethod("card_suit")
}

#' @export
card_suit.card <- function(x) {
  vctrs::field(x, "suit")
}

#' Extract the rank (value) of a card
#'
#' @param x A `card` vector.
#' @return A character vector of ranks ("2", "3", …, "10", "J", "Q", "K", "A").
#' @examples
#' cards <- card(c("A", "10", "Q"), c("♠", "♥", "♦"))
#' card_rank(cards)
#' @export
card_rank <- function(x) {
  UseMethod("card_rank")
}

#' @export
card_rank.card <- function(x) {
  vctrs::field(x, "rank")
}

#' Is this card a face card (J, Q, or K)?
#'
#' @param x A `card` vector.
#' @return A logical vector (TRUE if rank is "J", "Q", or "K").
#' @examples
#' cards <- card(c("J", "5", "Q"), c("♣", "♦", "♥"))
#' is_face_card(cards)  # TRUE, FALSE, TRUE
#' @export
is_face_card <- function(x) {
  UseMethod("is_face_card")
}

#' @export
is_face_card.card <- function(x) {
  r <- vctrs::field(x, "rank")
  r %in% c("J", "Q", "K")
}
