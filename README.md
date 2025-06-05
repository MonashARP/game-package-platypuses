
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
#> Installing package into '/private/var/folders/0f/278m3zyd4p1gctcvm2dk_j0m0000gn/T/RtmpAnJMos/temp_libpath3eb1111f142f'
#> (as 'lib' is unspecified)
#> 
#> The downloaded binary packages are in
#>  /var/folders/0f/278m3zyd4p1gctcvm2dk_j0m0000gn/T//RtmpceTDFn/downloaded_packages

# Install Blackjack from GitHub
devtools::install_github("MonashARP/game-package-platypuses")
#> Downloading GitHub repo MonashARP/game-package-platypuses@HEAD
#> rlang    (1.1.5  -> 1.1.6 ) [CRAN]
#> cli      (3.6.4  -> 3.6.5 ) [CRAN]
#> utf8     (1.2.4  -> 1.2.5 ) [CRAN]
#> pillar   (1.10.1 -> 1.10.2) [CRAN]
#> generics (0.1.3  -> 0.1.4 ) [CRAN]
#> Installing 5 packages: rlang, cli, utf8, pillar, generics
#> Installing packages into '/private/var/folders/0f/278m3zyd4p1gctcvm2dk_j0m0000gn/T/RtmpAnJMos/temp_libpath3eb1111f142f'
#> (as 'lib' is unspecified)
#> 
#> The downloaded binary packages are in
#>  /var/folders/0f/278m3zyd4p1gctcvm2dk_j0m0000gn/T//RtmpceTDFn/downloaded_packages
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#> * checking for file ‘/private/var/folders/0f/278m3zyd4p1gctcvm2dk_j0m0000gn/T/RtmpceTDFn/remotes86f948f1b51c/MonashARP-game-package-platypuses-3f815eb/DESCRIPTION’ ... OK
#> * preparing ‘Blackjack’:
#> * checking DESCRIPTION meta-information ... OK
#> * cleaning src
#> * checking for LF line-endings in source and make files and shell scripts
#> * checking for empty or unneeded directories
#> * building ‘Blackjack_0.0.1.tar.gz’
#> Installing package into '/private/var/folders/0f/278m3zyd4p1gctcvm2dk_j0m0000gn/T/RtmpAnJMos/temp_libpath3eb1111f142f'
#> (as 'lib' is unspecified)
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

## Learn More

For more details and examples, see the vignette or visit the package
website
[Blackjack](https://monasharp.github.io/game-package-platypuses/) on the
**Get Started** page !
