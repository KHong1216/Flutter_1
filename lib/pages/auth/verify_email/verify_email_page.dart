import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_project1/config/router/route_names.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/models/custom_error.dart';
import 'package:flutter_project1/repositories/auth/auth_repository_provider.dart';
import 'package:flutter_project1/utils/error_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class VerifyEmailPage extends ConsumerStatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyEmailPageState();
}

class _VerifyEmailPageState extends ConsumerState<VerifyEmailPage> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    sendEmailVerification();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> sendEmailVerification() async {
    try {
      await ref.read(authRepositoryProvider).sendEmailVerification();
    } on CustomError catch (e) {
      if (!mounted) return;
      errorDialog(context, e);
    }
  }

  Future<void> checkEmailVerified() async {
    final goRouter = GoRouter.of(context);

    void errorDialogRef(CustomError e) {
      errorDialog(context, e);
    }

    try {
      await ref.read(authRepositoryProvider).reloadUer();
      if (fbAuth.currentUser!.emailVerified == true) {
        timer?.cancel();
        goRouter.goNamed(RouteNames.home);
      }
    } on CustomError catch (e) {
      if (!mounted) return;
      errorDialogRef(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Verification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text('해당 이메일을 확인해주세요'),
                  Text('${fbAuth.currentUser?.email}'),
                ],
              ),
            ),
            OutlinedButton(
                onPressed: () async {
                  try {
                    await ref.read(authRepositoryProvider).signout();
                    timer?.cancel();
                  } on CustomError catch (e) {
                    if (!mounted) return;
                    errorDialog(context, e);
                  }
                },
                child: Text(
                  'CANCEL',
                  style: TextStyle(fontSize: 20.0),
                ))
          ],
        ),
      ),
    );
  }
}
