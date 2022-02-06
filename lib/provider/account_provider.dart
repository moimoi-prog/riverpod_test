import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/model/account.dart';
import 'package:riverpod_test/repository/account_repository.dart';

final accountProvider = FutureProvider<List<Account>>((_) async {
  return await AccountRepository.get();
});