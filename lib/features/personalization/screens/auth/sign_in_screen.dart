import 'dart:convert';

import 'package:auth_app/features/personalization/controllers/auth_controller.dart';
import 'package:auth_app/features/personalization/models/login_model.dart';
import 'package:auth_app/features/personalization/models/network_response.dart';
import 'package:auth_app/features/personalization/screens/auth/email_verify_screen.dart';
import 'package:auth_app/features/personalization/screens/auth/sign_up_screen.dart';
import 'package:auth_app/features/personalization/screens/main_bottom_nav_screen.dart';
import 'package:auth_app/features/personalization/widgets/bg_widget.dart';
import 'package:auth_app/features/personalization/widgets/snack_bar_message.dart';
import 'package:auth_app/utils/constants/app_regexp.dart';
import 'package:auth_app/utils/constants/colors.dart';
import 'package:auth_app/utils/constants/urls.dart';
import 'package:auth_app/utils/services/network_request.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  bool _obscureText = true;
  bool _signInInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
          child: SafeArea(
              child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 150,
              ),
              Text(
                'Get Started With',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailTEController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter Your Email';
                  }
                  if (AppRegExp.emailRegExp.hasMatch(value!) == false) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: _obscureText,
                controller: _passwordTEController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (mounted) {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      }
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Visibility(
                visible: _signInInProgress == false,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _signInUser();
                  },
                  child: const Icon(Icons.arrow_circle_right_outlined),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EmailVerifyScreen()));
                      },
                      child: const Text('Forgot Password?'),
                    ),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.4,
                              fontSize: 14,
                            ),
                            text: 'Don\'t have an account? ',
                            children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: const TextStyle(
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpScreen()));
                              },
                          )
                        ])),
                  ],
                ),
              )
            ],
          ),
        ),
      ))),
    );
  }

  Future<void> _signInUser() async {
    _signInInProgress = true;
    if (mounted) {
      setState(() {});
    }

    Map<String, dynamic> requestInput = {
      "email": _emailTEController.text.trim(),
      "password": _passwordTEController.text,
    };

    NetworkResponse response =
        await NetworkCaller.postRequest(Urls.signInUrl, body: requestInput);
    _signInInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      _clearTextFields();
      LoginModel loginModel = LoginModel.fromJson(response.responseData);
      await AuthController.saveUserAccessToken(loginModel.token!);
      await AuthController.saveUserData(loginModel.userModel!);

      if (mounted) {
        Map<String, dynamic> jsonData = response.responseData;
        String firstName = jsonData['data']['firstName'];
        showSnackBarMessage(context, 'Welcome! $firstName');

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainBottomNavScreen(),
          ),
        );
      }
    } else {
      if (mounted) {
        showSnackBarMessage(
          context,
          response.errorMessage ?? 'Invalid login credential! Try again.',
          true,
        );
      }
    }
  }

  void _clearTextFields() {
    _emailTEController.clear();
    _passwordTEController.clear();
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
