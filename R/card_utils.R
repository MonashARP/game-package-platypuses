#' Extract Suit from a Card Vector
#'
#' Returns the suit symbols (♠, ♥, ♦, ♣) of each card in a `card` vector.
#'
#' @param x A `card` vector created using `card()`.
#'
#' @details
#' This function uses method dispatch to extract the `suit` field from the custom card class.
#' If the input is not a `card` object, an informative error is thrown.
#'
#' @return A character vector of suit symbols, one for each card.
#'
#' @examples
#' cards <- card(c("A", "10", "Q"), c("♠", "♥", "♦"))
#' card_suit(cards)  # "♠" "♥" "♦"
#'
#' @export
card_suit <- function(x) {
  UseMethod("card_suit")
}

#' @export
card_suit.card <- function(x) {
  vctrs::field(x, "suit")
}

#' @export
card_suit.default <- function(x) {
  stop("`card_suit()` requires a `card` object.", call. = FALSE)
}


#' Extract Rank from a Card Vector
#'
#' Returns the rank (face value) of each card in a `card` vector.
#'
#' @param x A `card` vector created using `card()`.
#'
#' @details
#' This function returns character values from the `rank` field of each card.
#' Input must be of class `card`; otherwise, an error is raised.
#'
#' @return A character vector of ranks ("2"–"10", "J", "Q", "K", "A").
#'
#' @examples
#' cards <- card(c("A", "10", "Q"), c("♠", "♥", "♦"))
#' card_rank(cards)  # "A" "10" "Q"
#'
#' @export
card_rank <- function(x) {
  UseMethod("card_rank")
}

#' @export
card_rank.card <- function(x) {
  vctrs::field(x, "rank")
}

#' @export
card_rank.default <- function(x) {
  stop("`card_rank()` requires a `card` object.", call. = FALSE)
}


#' Identify Face Cards
#'
#' Determines whether each card in a `card` vector is a face card (J, Q, or K).
#'
#' @param x A `card` vector created using `card()`.
#'
#' @details
#' Returns a logical vector indicating whether each card is a face card. Non-card inputs will throw an error.
#'
#' @return A logical vector: `TRUE` for face cards, `FALSE` otherwise.
#'
#' @examples
#' cards <- card(c("J", "5", "Q"), c("♣", "♦", "♥"))
#' is_face_card(cards)  # TRUE FALSE TRUE
#'
#' @export
is_face_card <- function(x) {
  UseMethod("is_face_card")
}

#' @export
is_face_card.card <- function(x) {
  r <- vctrs::field(x, "rank")
  r %in% c("J", "Q", "K")
}

#' @export
is_face_card.default <- function(x) {
  stop("`is_face_card()` requires a `card` object.", call. = FALSE)
}

#' Extract Numeric Value from a Card Vector
#'
#' Returns the Blackjack numeric value of each card.
#'
#' @param x A `card` vector created using `card()`.
#'
#' @return A numeric vector: 2–10 for number cards, 10 for face cards, 11 for Aces.
#'
#' @examples
#' cards <- card(c("A", "K", "5"), c("♠", "♥", "♦"))
#' card_value(cards)  # 11 10 5
#'
#' @export
card_value <- function(x) {
  UseMethod("card_value")
}

#' @export
card_value.card <- function(x) {
  rank <- card_rank(x)

  as.numeric(
    dplyr::case_when(
      rank == "A" ~ "11",
      rank %in% c("K", "Q", "J") ~ "10",
      rank %in% as.character(2:10) ~ rank,
      TRUE ~ NA_character_
    )
  )
}


#' @export
card_value.default <- function(x) {
  stop("`card_value()` requires a `card` object.", call. = FALSE)
}

