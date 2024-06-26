import 'package:auth_app/features/personalization/screens/auth/sign_in_screen.dart';
import 'package:auth_app/features/personalization/widgets/bg_widget.dart';
import 'package:auth_app/utils/constants/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SetPassScreen extends StatefulWidget {
  const SetPassScreen({super.key});

  @override
  State<SetPassScreen> createState() => _SetPassScreenState();
}

class _SetPassScreenState extends State<SetPassScreen> {
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPassTEController = TextEditingController();
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
                        height: 150,
                      ),
                      Text(
                        'Set Password',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'Minimum length password 8 character with Latter and number combination',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: _obscureText,
                        controller: _passwordTEController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              if(mounted){
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
                        height: 8,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: _obscureText,
                        controller: _confirmPassTEController,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              if(mounted){
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
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Confirm'),
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
    _passwordTEController.dispose();
    _confirmPassTEController.dispose();
    super.dispose();
  }
}