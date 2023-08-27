double calculateSeries(int n) {
  if (n < 2) {
    throw ArgumentError('Invalid input');
  }

  double cur = 0;
  for (int i = 2; i <= n; i++) {
    cur += 1 / (i * (i - 1));
  }

  return cur;
}

void question3() {
  //you can change the input here!
  final n = 5;
  final result = calculateSeries(n);
  print(result);
}
