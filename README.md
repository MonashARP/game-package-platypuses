
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Blackjack

`Blackjack` is an R package that simulates a multiplayer game of
Blackjack between players and a dealer. It implements realistic
Blackjack rules such as dealer behavior on soft 17 and bust detection,
with players making hit/stand decisions using a simplified strategy.

## Installation

You can install the development version of the package using `devtools`:

``` r
# Install devtools if not already installed
install.packages("devtools")

# Install Blackjack from GitHub
devtools::install_github("MonashARP/game-package-platypuses")
```

## Features

- Simulate 1 or more players in a Blackjack game
- Dealer hits on soft 17 (e.g., Ace + 6)
- Players make decisions using a basic strategy
- Handles busts, ties, and win/loss logic
- Fully documented and unit-tested

## Main Functions

| Function                    | Description                                  |
|-----------------------------|----------------------------------------------|
| `deck_cards()`              | Create and shuffle one or more 52-card decks |
| `deal_hand(deck, n)`        | Deal `n` cards from a deck                   |
| `blackjack_score(hand)`     | Calculate Blackjack score for a hand         |
| `is_soft_17(hand)`          | Check if a hand is a soft 17                 |
| `simulate_blackjack_game()` | Simulate a full multiplayer Blackjack game   |

------------------------------------------------------------------------

## Example

``` r
library(Blackjack)

# Simulate a 2-player game
game <- simulate_blackjack_game(num_players = 2, seed = 123)

# Dealer results
game$dealer
#> $hand
#> [1] "5♦" "2♥" "Q♥"
#> 
#> $score
#> [1] 17

# Player 1 results
game$players[[1]]
#> $hand
#> [1] "A♥" "3♠" "J♦"
#> 
#> $score
#> [1] 14
#> 
#> $result
#> [1] "Dealer wins!"
```

## Testing

This package includes a full test suite using `testthat`. Run:

``` r
devtools::test()
#> ℹ Testing Blackjack
#> ✔ | F W  S  OK | Context
#> 
#> ⠏ |          0 | deal_hand                                                      
#> ✔ |          6 | deal_hand
#> 
#> ⠏ |          0 | deck_cards                                                     
#> ✔ |          9 | deck_cards
#> 
#> ⠏ |          0 | score_player_dealer                                            
#> ✔ |         10 | score_player_dealer
#> 
#> ⠏ |          0 | simulate_blackjack_game                                        
#> ✔ |         26 | simulate_blackjack_game
#> 
#> ══ Results ═════════════════════════════════════════════════════════════════════
#> [ FAIL 0 | WARN 0 | SKIP 0 | PASS 51 ]
```

Tests include:

- Return structure

- Score correctness

- Bust handling

- Dealer soft 17 behavior

- Edge cases like 0 players or 21

------------------------------------------------------------------------

## Authors

- Min Hong
- Vaishnavi Amuda
- Shivesh Palanisamy

------------------------------------------------------------------------

## License

MIT License

------------------------------------------------------------------------

## Learn More

For more details and examples, see the vignette or visit the package
website []().
