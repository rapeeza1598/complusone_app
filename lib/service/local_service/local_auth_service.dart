import 'package:hive/hive.dart';

import '../../model/user.dart';

class LocalAuthService {
  late Box<String> _tokenBox;
  late Box<String> _refreshTokenBox;
  late Box<User> _userBox;

  Future<void> init() async {
    // _tokenBox = await Hive.openBox<String>('token');
    // _refreshTokenBox = await Hive.openBox<String>('refreshToken');
    // _userBox = await Hive.openBox<User>('user');
  }

  Future<void> addToken({required String token}) async {
    await Hive.box('token').put('token', token);
  }

  Future<void> addRefreshToken({required String refreshToken}) async {
    await Hive.box('refreshToken').put('refreshToken', refreshToken);
  }

  Future<void> addUser({required User user}) async {
    await Hive.box("user").put('user', user);
  }

  Future<void> clear() async {
    await Hive.box('token').clear();
    await Hive.box('refreshToken').clear();
    await Hive.box("user").clear();
  }

  String? getToken() => Hive.box('token').get('token');
  String? getRefreshToken() => Hive.box('refreshToken').get('refreshToken');
  User? getUser() => Hive.box("user").get('user');
}
