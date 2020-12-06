class ProfilePageRepository {
  String _data;

  Future<void> fetchData() async {
    await Future.delayed(Duration(milliseconds:0));
    _data = 'Profile Page';
  }

  String get data => _data;
}
