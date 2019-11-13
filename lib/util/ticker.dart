class Ticker {
  Stream<int> tick({int ticks}) {
    return Stream.periodic(Duration(minutes: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}
