import 'package:auth_app/features/personalization/models/network_response.dart';
import 'package:auth_app/features/personalization/screens/auth/sign_in_screen.dart';
import 'package:auth_app/features/personalization/widgets/bg_widget.dart';
import 'package:auth_app/features/personalization/widgets/snack_bar_message.dart';
import 'package:auth_app/utils/constants/app_regexp.dart';
import 'package:auth_app/utils/constants/colors.dart';
import 'package:auth_app/utils/constants/urls.dart';
import 'package:auth_app/utils/services/network_request.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _signUpInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
          child: SafeArea(
              child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  keyboardType: TextInputType.emailAddress,
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter Your First Name';
                    }
                    return null;
                  },
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
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter Your Last Name';
                    }
                    return null;
                  },
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
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter Your Mobile';
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
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter Your Password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Visibility(
                  visible: _signUpInProgress == false,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _signUpUser();
                      }
                    },
                    child: const Icon(Icons.arrow_circle_right_outlined),
                  ),
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
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInScreen()));
                            },
                        )
                      ])),
                )
              ],
            ),
          ),
        ),
      ))),
    );
  }

  Future<void> _signUpUser() async {
    _signUpInProgress = true;
    if (mounted) {
      setState(() {});
    }

    Map<String, dynamic> requestInput = {
      "email": _emailTEController.text.trim(),
      "firstName": _firstNameTEController.text.trim(),
      "lastName": _lastNameTEController.text.trim(),
      "mobile": _mobileTEController.text.trim(),
      "password": _passwordTEController.text,
      "photo": ""
    };

    NetworkResponse response =
        await NetworkCaller.postRequest(Urls.signUpUrl, body: requestInput);
    _signUpInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      _clearTextFields();
      if (mounted) {
        showSnackBarMessage(context, 'Sign Up Success');
        Navigator.pop(context);
      }
    } else {
      if (mounted) {
        showSnackBarMessage(
          context,
          response.errorMessage ?? 'Sign Up failed! Try again.',
          true,
        );
      }
    }
  }

  void _clearTextFields() {
    _emailTEController.clear();
    _firstNameTEController.clear();
    _lastNameTEController.clear();
    _mobileTEController.clear();
    _passwordTEController.clear();
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
