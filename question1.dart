class TokenProcessor {
  List<String> collection = [];

  void ingest(String input) {
    collection.add(input);
  }

  double appearance(String prefix) {
    int count = 0;

    for (String token in collection) {
      (token.startsWith(prefix)) ? count++ : null;
    }
    return count / collection.length;
  }
}

void question1() {
  TokenProcessor tokenProcessor = TokenProcessor();
  tokenProcessor.ingest('oursky:uk:dev');
  tokenProcessor.ingest('oursky:hk:design');
  tokenProcessor.ingest('oursky:hk:pm');
  tokenProcessor.ingest('oursky:hk:dev');
  tokenProcessor.ingest('skymaker');

  print(tokenProcessor.appearance('oursky'));
  print(tokenProcessor.appearance('oursky:hk'));

  tokenProcessor.ingest('skymaker:london:ealing:dev');
  tokenProcessor.ingest('skymaker:london:croydon');
  tokenProcessor.ingest('skymaker:london:design');
  tokenProcessor.ingest('skymaker:man:pm');
  tokenProcessor.ingest('skymaker:man:pm');

  print(tokenProcessor.appearance('skymaker:man'));
}

// TokenProcessor class is O(n)
// Ingest function is O(1) 
// Appearance function is O(n)

