import 'package:flutter/material.dart';
import 'package:flutter_project1/config/router/route_names.dart';
import 'package:flutter_project1/models/custom_error.dart';
import 'package:flutter_project1/pages/content/change_password/change_password_provider.dart';
import 'package:flutter_project1/pages/widgets/buttons.dart';
import 'package:flutter_project1/pages/widgets/form_field.dart';
import 'package:flutter_project1/repositories/auth/auth_repository_provider.dart';
import 'package:flutter_project1/utils/error_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ChangePasswordPage extends ConsumerStatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangePasswordPageState();
}

class _ChangePasswordPageState extends ConsumerState<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _passwordController = TextEditingController();
  final _changePasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _changePasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;

    ref
        .read(changePasswordProvider.notifier)
        .changePassword(password: _confirmPasswordController.text.trim());

    ref.read(authRepositoryProvider).signout();
    GoRouter.of(context).goNamed(RouteNames.signin);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(changePasswordProvider, (prev, next) {
      next.whenOrNull(
          error: (e, st) => errorDialog(context, e as CustomError),
          data: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Changed Password')));
            Navigator.of(context).pop();
          });
    });

    final changePwdState = ref.watch(changePasswordProvider);

    return GestureDetector(
      onTap: () => Focus.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('패스워드 재설정'),
          leading: IconButton(
              onPressed: () => GoRouter.of(context).goNamed(RouteNames.home),
              icon: Icon(Icons.arrow_left)),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _formKey,
              autovalidateMode: _autovalidateMode,
              child: ListView(
                shrinkWrap: true,
                reverse: true,
                children: [
                  const FlutterLogo(
                    size: 150,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordFormField(passwordController: _passwordController),
                  const SizedBox(
                    height: 20,
                  ),
                  PasswordFormField(
                      passwordController: _changePasswordController),
                  const SizedBox(
                    height: 20,
                  ),
                  ConfirmPasswordFormField(
                    passwordController: _confirmPasswordController,
                    confirmPasswordController: _changePasswordController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFilledButton(
                      onPressed: changePwdState.maybeWhen(
                        loading: () => null,
                        orElse: () => _submit,
                      ),
                      fontsize: 20,
                      fontWeight: FontWeight.w600,
                      child: Text(changePwdState.maybeWhen(
                          loading: () => 'Submitting...',
                          orElse: () => 'Change Password'))),
                ].reversed.toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
