import 'package:e_commerce_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTEControler = TextEditingController();

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
                  'Enter OTP Code',
                  style: TextTheme.titleLarge,
                ),
                Text(
                  'A 6 digit OTP code has been send to your email',
                  style: TextTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                  ),
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  onChanged: (value) {},
                  appContext: context,
                  controller: _otpTEControler,
                ),
                FilledButton(
                  onPressed: _onTapVerifyButton,
                  child: Text('SignUp'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextButton(
                    onPressed: _onTapBackToLogInButton,
                    child: Text('Back to Login')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapVerifyButton() {
    Navigator.pushNamed(context, VerifyOtpScreen.name);
  }

  void _onTapBackToLogInButton() {
    Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (p) => false);
  }

  @override
  void dispose() {
    _otpTEControler.dispose();
    super.dispose();
  }
}
