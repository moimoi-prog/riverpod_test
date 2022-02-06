import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_test/model/account.dart';
import 'package:riverpod_test/provider/account_provider.dart';
import 'package:riverpod_test/repository/account_repository.dart';

class AccountListView extends HookConsumerWidget {
  const AccountListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: AccountRepository.get(),
      builder: (BuildContext context, AsyncSnapshot<List<Account>> snapshot) {
        if (!snapshot.hasData) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        return ListView.separated(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            Account account = snapshot.data![index];

            return ListTile(
              title: Text(account.name),
            );
          },
          separatorBuilder: (_, __) => const Divider(
            height: 1,
          ),
        );
      },
    );
  }
}