#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
int score_hand_cpp(CharacterVector ranks) {
  int total = 0;
  int num_aces = 0;

  for (int i = 0; i < ranks.size(); ++i) {
    String rank = ranks[i];
    if (rank == "A") {
      total += 11;
      num_aces += 1;
    } else if (rank == "K" || rank == "Q" || rank == "J" || rank == "10") {
      total += 10;
    } else {
      total += std::stoi(rank);
    }
  }

  while (total > 21 && num_aces > 0) {
    total -= 10;
    num_aces -= 1;
  }

  return total;
}
