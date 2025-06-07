#' Create a Card Vector
#'
#' Constructs a custom S3 `rcrd` object of class `"card"`, with validated `rank` and `suit` fields.
#' Used as the foundation for representing cards in the Blackjack game package.
#'
#' @param rank A character vector of ranks (e.g., "A", "2", ..., "K").
#' @param suit A character vector of suits (e.g., "♠", "♥", "♦", "♣").
#'
#' @importFrom vctrs vec_ptype2
#'
#' @details
#' This constructor performs input validation to ensure ranks and suits are valid and of equal length.
#' Use this function to create cards manually or when writing helper functions that build decks or hands.
#'
#' @return An object of class `"card"` representing the provided cards.
#'
#' @examples
#' card(c("A", "10", "Q"), c("♠", "♥", "♦"))
#'
#' @export
card <- function(rank = character(), suit = character()) {
  valid_ranks <- c(as.character(2:10), "J", "Q", "K", "A")
  valid_suits <- c("♠", "♥", "♦", "♣")

  vctrs::vec_assert(rank, character())
  vctrs::vec_assert(suit, character())
  stopifnot(all(rank %in% valid_ranks))
  stopifnot(all(suit %in% valid_suits))
  stopifnot(length(rank) == length(suit))

  new_card(rank, suit)
}

#' Internal constructor for card class.
#'
#' Constructs a new card vector using rank and suit without performing checks.
#' @noRd
new_card <- function(rank = character(), suit = character()) {
  vctrs::new_rcrd(fields = list(rank = rank, suit = suit), class = "card")
}

#' @export
format.card <- function(x, ...) {
  paste0(vctrs::field(x, "rank"), vctrs::field(x, "suit"))
}

#' @method vec_ptype2 card.card
#' @noRd
#' @export
vec_ptype2.card.card <- function(x, y, ...) {
  new_card()
}

#' @method vec_ptype2 card.character
#' @noRd
#' @export
vec_ptype2.card.character <- function(x, y, ...) character()


#' @method vec_ptype2 character.card
#' @noRd
#' @export
vec_ptype2.character.card <- function(x, y, ...) character()

#' @export
#' @noRd
vec_cast.card.card <- function(x, to, ...) x

#' @export
#' @importFrom vctrs vec_cast
vec_cast.card.character <- function(x, to, ...) {
  rank <- substr(x, 1, nchar(x) - 1)
  suit <- substr(x, nchar(x), nchar(x))
  card(rank, suit)
}

#' @export
vec_cast.character.card <- function(x, to, ...) format(x)

#' Combine Multiple Card Vectors
#'
#' Method for `c()` that combines one or more `card` vectors into a single vector.
#'
#' @param ... One or more objects of class `"card"`.
#'
#' @return A combined `card` vector.
#'
#' @examples
#' hand1 <- card(c("A", "10"), c("♠", "♦"))
#' hand2 <- card(c("Q"), c("♥"))
#' c(hand1, hand2)
#'
#' @export
c.card <- function(...) {
  vctrs::vec_c(...)
}
