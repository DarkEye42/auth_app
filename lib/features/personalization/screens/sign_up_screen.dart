import 'package:auth_app/features/personalization/screens/set_pass_screen.dart';
import 'package:auth_app/features/personalization/screens/sign_in_screen.dart';
import 'package:auth_app/features/personalization/widgets/bg_widget.dart';
import 'package:auth_app/utils/constants/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  bool _obscureText = true;

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
                        height: 100,
                      ),
                      Text(
                        'Join With Us',
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
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _firstNameTEController,
                        decoration: const InputDecoration(
                          hintText: 'First Name',
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _lastNameTEController,
                        decoration: const InputDecoration(
                          hintText: 'Last Name',
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _mobileTEController,
                        decoration: const InputDecoration(
                          hintText: 'Mobile',
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        controller: _passwordTEController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
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
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SetPassScreen()));
                        },
                        child: const Icon(Icons.arrow_circle_right_outlined),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Center(
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.4,
                                  fontSize: 14,
                                ),
                                text: 'Have account? ',
                                children: [
                                  TextSpan(
                                    text: 'Sign In',
                                    style: const TextStyle(
                                      color: AppColors.themeColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer: TapGestureRecognizer()..onTap = () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                                    },
                                  )
                                ])),
                      )
                    ],
                  ),
                ),
              ))),
    );
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
