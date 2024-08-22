import 'package:flutter/material.dart';
import 'package:flutter_project1/config/router/route_names.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/models/custom_error.dart';
import 'package:flutter_project1/pages/profile/profile_provider.dart';
import 'package:flutter_project1/repositories/auth/auth_repository_provider.dart';
import 'package:flutter_project1/utils/error_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final uid = fbAuth.currentUser!.uid;
    final profileState = ref.watch(profileProvider(uid));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () async {
              try {
                await ref.read(authRepositoryProvider).signout();
              } on CustomError catch (e) {
                if (!context.mounted) return;
                errorDialog(context, e);
              }
            },
            icon: const Icon(Icons.logout),
          ),
          IconButton(
            onPressed: () {
              ref.invalidate(profileProvider);
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: profileState.when(
          skipLoadingOnRefresh: false,
          data: (user) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome ${user.email}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                      onPressed: () => GoRouter.of(context)
                          .goNamed(RouteNames.changePassword),
                      child: const Text('패스워드 재설정')),
                  OutlinedButton(
                      onPressed: () => GoRouter.of(context)
                          .goNamed(RouteNames.reauthenticate),
                      child: const Text('재인증')),
                ],
              ),
            );
          },
          error: (e, st) {
            final error = e as CustomError;
            return Center(
              child: Text(
                  'code : ${error.code}\nplugin : ${error.plugin}\nmessage : ${error.message}'),
            );
          },
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
