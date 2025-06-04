#' Create a card vector
#'
#' Constructs an S3 record (`rcrd`) object of class `"card"` with validated `rank` and `suit` fields.
#' This function is the user-facing constructor for creating custom card objects.
#'
#' @param rank Character vector of ranks (e.g. "A", "2", ..., "K")
#' @param suit Character vector of suits (e.g. "♠", "♥", "♦", "♣")
#'
#' @return An object of class 'card'
#'
#' @examples
#' card(c("A", "10", "Q"), c("♠", "♥", "♦"))
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

#' Internal constructor for card class (not exported).
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

#' @export
vec_ptype2.card.card <- function(x, y, ...) {
  new_card()
}

#' @export
vec_ptype2.card.character <- function(x, y, ...) character()

#' @export
vec_ptype2.character.card <- function(x, y, ...) character()

#' @export
vec_cast.card.card <- function(x, to, ...) x

#' @export
vec_cast.card.character <- function(x, to, ...) {
  rank <- substr(x, 1, nchar(x) - 1)
  suit <- substr(x, nchar(x), nchar(x))
  card(rank, suit)
}

#' @export
vec_cast.character.card <- function(x, to, ...) format(x)

#' Combine card vectors with c()
#'
#' @param ... One or more objects of class 'card'
#' @param recursive (ignored)
#' @return A single 'card' vector containing all inputs
#' @export
c.card <- function(..., recursive = FALSE) {
  # Delegate to vctrs::vec_c so that fields stay aligned
  vctrs::vec_c(!!!list(...))
}

#' Repair a card vector after a vctrs operation (subsetting, etc.)
#'
#' @param x A proxied data frame or record of fields rank + suit
#' @param to   A prototype 'card' vector (ignored here)
#' @return A new 'card' object with the same rank + suit fields as x
#' @export
vec_restore.card <- function(x, to, ...) {
  # x already has fields 'rank' and 'suit'; just wrap them back into a card
  new_card(vctrs::field(x, "rank"), vctrs::field(x, "suit"))
}

#' Expose the record data frame underlying a card
#'
#' @param x A 'card' object
#' @return A tibble/data.frame with columns rank and suit
#' @export
vec_proxy.card <- function(x) {
  # Create a simple data frame so that vctrs operations (like sorting, subsetting)
  # know how to handle a card record
  data.frame(
    rank = vctrs::field(x, "rank"),
    suit = vctrs::field(x, "suit"),
    stringsAsFactors = FALSE
  )
}

