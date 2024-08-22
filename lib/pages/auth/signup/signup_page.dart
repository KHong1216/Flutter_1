import 'package:flutter/material.dart';
import 'package:flutter_project1/config/router/route_names.dart';
import 'package:flutter_project1/models/custom_error.dart';
import 'package:flutter_project1/pages/auth/signup/signup_provider.dart';
import 'package:flutter_project1/pages/widgets/buttons.dart';
import 'package:flutter_project1/pages/widgets/form_field.dart';
import 'package:flutter_project1/utils/error_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });
    final _form = _formKey.currentState;

    if (_form == null || !_form.validate()) return;

    ref.read(signupProvider.notifier).signup(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(signupProvider, (prev, next) {
      next.whenOrNull(error: (e, st) => errorDialog(context, e as CustomError));
    });

    final signupState = ref.watch(signupProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
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
                    height: 20.0,
                  ),
                  NameFormField(nameController: _nameController),
                  const SizedBox(
                    height: 20.0,
                  ),
                  EmailFormField(emailController: _emailController),
                  const SizedBox(
                    height: 20.0,
                  ),
                  PasswordFormField(passwordController: _passwordController),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ConfirmPasswordFormField(
                    passwordController: _confirmPasswordController,
                    confirmPasswordController: _passwordController,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomFilledButton(
                      onPressed: signupState.maybeWhen(
                          loading: () => null, orElse: () => _submit),
                      fontsize: 20,
                      fontWeight: FontWeight.w600,
                      child: Text(signupState.maybeWhen(
                          loading: () => 'Submitting...',
                          orElse: () => 'Sign Up'))),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already a member?'),
                      const SizedBox(
                        width: 10.0,
                      ),
                      CustomTextButton(
                          onPressed: signupState.maybeWhen(
                              loading: () => null,
                              orElse: () => () => GoRouter.of(context)
                                  .goNamed(RouteNames.signin)),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          child: Text('Sign In!'))
                    ],
                  )
                ].reversed.toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
