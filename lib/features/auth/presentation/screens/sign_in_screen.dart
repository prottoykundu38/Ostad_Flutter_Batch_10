import 'package:e_commerce_app/app/extensions/localizations_extensions.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEControler = TextEditingController();
  final TextEditingController _passwordTEControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  height: 48,
                ),
                AppLogo(
                  width: 90,
                ),
                Text(
                  context.Localizations.welcomeBack,
                  style: TextTheme.titleLarge,
                ),
                Text(
                  context.Localizations.loginHeadline,
                  style: TextTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _emailTEControler,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _passwordTEControler,
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                FilledButton(
                  onPressed: _onTapLoginButton,
                  child: Text('Login'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                    onPressed: _onTapSignUpButton, child: Text('sign up')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapLoginButton() {}

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose() {
    _emailTEControler.dispose();
    _passwordTEControler.dispose();
  }
}
