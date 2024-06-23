import 'package:auth_app/features/personalization/screens/auth/sign_in_screen.dart';
import 'package:auth_app/features/personalization/screens/auth/update_profile.dart';
import 'package:auth_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

AppBar profileAppBar(BuildContext context, [bool fromUpdateProfile = false]) {
  return AppBar(
    backgroundColor: AppColors.themeColor,
    leading: const Padding(
      padding: EdgeInsets.all(8.0),
      child: CircleAvatar(
          //child: NetworkCachedImage(url: '',),
          ),
    ),
    title: GestureDetector(
      onTap: () {
        if (fromUpdateProfile) {
          return;
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const UpdateProfile(),
          ),
        );
      },
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nazmul Islam',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Text(
            'email@example.com',
            style: TextStyle(
                fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            ),
          );
        },
        icon: const Icon(
          Icons.logout_rounded,
          color: Colors.white,
        ),
      )
    ],
  );
}
