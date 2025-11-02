import 'package:e_commerce_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/controllers/sign_up_controller.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/widgets/app_logo.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/widgets/centered_circular_progress.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEControler = TextEditingController();
  final TextEditingController _firstNameTEControler = TextEditingController();
  final TextEditingController _lastNameTEControler = TextEditingController();
  final TextEditingController _mobileTEControler = TextEditingController();
  final TextEditingController _addressTEControler = TextEditingController();
  final TextEditingController _passwordTEControler = TextEditingController();

  final SignUpController _signUpController = Get.find<SignUpController>();

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
                  height: 24,
                ),
                AppLogo(
                  width: 80,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Create New Account',
                  style: TextTheme.titleLarge,
                ),
                Text(
                  'Please enter your details for new account',
                  style: TextTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _emailTEControler,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _firstNameTEControler,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'First name',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _lastNameTEControler,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Last name',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _mobileTEControler,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Mobile',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _addressTEControler,
                  decoration: InputDecoration(
                    hintText: 'Address',
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
                GetBuilder<SignUpController>(builder: (controller) {
                  return Visibility(
                    visible: controller.signUpInProgress == false,
                    replacement: CenteredCircularProgress(),
                    child: FilledButton(
                      onPressed: _onTapSignUpButton,
                      child: Text('SignUp'),
                    ),
                  );
                }),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                    onPressed: _onTapBackToLogInButton,
                    child: Text('Back to log in')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    //TODO: Validate form
    _signUp();
  }

  Future<void> _signUp() async {
    SignUpRequestModel model = SignUpRequestModel(
        firstname: _firstNameTEControler.text.trim(),
        lastname: _lastNameTEControler.text.trim(),
        email: _emailTEControler.text.trim(),
        password: _passwordTEControler.text,
        city: _addressTEControler.text.trim(),
        phone: _mobileTEControler.text.trim());
    final bool isSuccess = await _signUpController.signUp(model);
    if (isSuccess) {
      showSnackBarMessage(context, 'Sign up successful! Please Login');
      Navigator.pushNamed(context, VerifyOtpScreen.name);
    } else {
      showSnackBarMessage(context, _signUpController.errorMessage!);
    }
  }

  void _onTapBackToLogInButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEControler.dispose();
    _firstNameTEControler.dispose();
    _lastNameTEControler.dispose();
    _mobileTEControler.dispose();
    _addressTEControler.dispose();
    _passwordTEControler.dispose();
    super.dispose();
  }
}
