class LocalCache {
  static final LocalCache _instance = LocalCache._internal();

  factory LocalCache() {
    return _instance;
  }

  LocalCache._internal();

  String _userMobNo;

  String get userMobNo => _userMobNo;

  void setUserMobNo(String value) {
    _userMobNo = value;
  }
}
