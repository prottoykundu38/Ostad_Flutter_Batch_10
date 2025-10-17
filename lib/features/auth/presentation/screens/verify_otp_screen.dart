import 'dart:async';
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

  Timer? _timer;
  int _remainingSeconds = 0; // initially no countdown
  bool _canResend = false; // resend button state
  bool _timerStarted = false; // to track if timer started or not

  void _startTimer() {
    _timer?.cancel();
    _remainingSeconds = 120;
    _canResend = false;
    _timerStarted = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        timer.cancel();
        setState(() {
          _canResend = true;
        });
      }
    });
  }

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
                const SizedBox(height: 24),
                const AppLogo(width: 80),
                const SizedBox(height: 12),
                Text(
                  'Enter OTP Code',
                  style: TextTheme.titleLarge,
                ),
                Text(
                  'A 6 digit OTP code has been sent to your email',
                  style: TextTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 10),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                  ),
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  onChanged: (value) {},
                  appContext: context,
                  controller: _otpTEControler,
                ),
                FilledButton(
                  onPressed: _onTapVerifyButton,
                  child: const Text('SignUp'),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: _onTapBackToLogInButton,
                  child: const Text('Back to Login'),
                ),
                const SizedBox(height: 30),

                // 👇 Only show countdown section after pressing SignUp
                if (_timerStarted) ...[
                  Text(
                    'This code will resend in $_remainingSeconds sec',
                    style: TextTheme.bodyMedium?.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _canResend ? _onTapResendOtp : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _canResend ? Colors.blue : Colors.grey,
                    ),
                    child: const Text('Resend OTP'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapVerifyButton() {
    // Start countdown when user presses SignUp
    if (!_timerStarted) {
      _startTimer();
    }
  }

  void _onTapBackToLogInButton() {
    Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (p) => false);
  }

  void _onTapResendOtp() {

    _startTimer(); 
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpTEControler.dispose();
    super.dispose();
  }
}
