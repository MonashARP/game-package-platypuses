
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

You can also explore function documentation without attaching the full
package by using `?Blackjack::function_name`. For example:

``` r
??Blackjack::blackjack_score
# or
?Blackjack::blackjack_score
```

## Example

``` r
library(Blackjack)

# Set seed for reproducibility
set.seed(123)

# Simulate a 2-player game
game <- simulate_blackjack_game(num_players = 2)

# Dealer results
game$dealer
#> $hand
#> <card[3]>
#> [1] 6♦ 3♥ A♥
#> 
#> $score
#> [1] 20

# Player 1 results
game$players[[1]]
#> $hand
#> <card[4]>
#> [1] 2♥ 4♠ Q♦ Q♣
#> 
#> $score
#> [1] 26
#> 
#> $result
#> [1] "Player busts! Dealer wins."
```

## Getting helpb

For more details and examples, see the vignette or visit the package
website
[Blackjack](https://monasharp.github.io/game-package-platypuses/) on the
**Get Started** page !
