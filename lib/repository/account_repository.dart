import 'package:riverpod_test/model/account.dart';

class AccountRepository {
  static Future<List<Account>> get() async {
    return [
      Account(
          id: '1',
          name: 'ユーザー1'
      ),
      Account(
          id: '2',
          name: 'ユーザー2'
      ),
      Account(
          id: '3',
          name: 'ユーザー3'
      ),
    ];
  }
}