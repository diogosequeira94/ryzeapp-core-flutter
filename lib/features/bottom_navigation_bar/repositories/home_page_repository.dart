class HomePageRepository {
  String _data;

  Future<void> fetchData() async {
    await Future.delayed(Duration(milliseconds: 500));
    _data = 'Home Page';
  }

  String get data => _data;
}
