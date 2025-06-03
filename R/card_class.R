#' Internal constructor for card class
#'
#' Constructs a new card vector using rank and suit without performing checks.
#' This function is intended for internal use only.
#'
#' @param rank A character vector of card ranks.
#' @param suit A character vector of card suits.
#'
#' @return An object of class 'card'
#' @noRd
new_card <- function(rank = character(), suit = character()) {
  vctrs::new_rcrd(fields = list(rank = rank, suit = suit), class = "card")
}

#
# User-facing constructor

#' Create a card vector
#'
#' Constructs a custom card object with validated rank and suit fields.
#'
#' @param rank Character vector of ranks (e.g. "A", "2", ..., "K")
#' @param suit Character vector of suits (e.g. "♠", "♥", "♦", "♣")
#'
#' @return An object of class 'card'
#' @export
#'
#' @examples
#' card(c("A", "10", "Q"), c("♠", "♥", "♦"))
#' card("7", "♣")
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
