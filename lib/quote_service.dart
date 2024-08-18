class QuoteService {
  static final List<String> _quotes = [
    "Dream, Dream, Dream. Dreams transform into thoughts and thoughts result in action.",
    "You only live once, but if you do it right, once is enough.",
    "In the end, we only regret the chances we didn't take.",
    "Don't take rest after your first victory because if you fail in the second, more lips are waiting to say that your first victory was just luck.",
    "If you want to shine like a sun, first burn like a sun.",
  ];

  static String getRandomQuote() {
    _quotes.shuffle();
    return _quotes.first;
  }
}
