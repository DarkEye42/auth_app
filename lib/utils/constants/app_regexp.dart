import 'package:auth_app/utils/constants/app_strings.dart';

class AppRegExp {
  static RegExp emailRegExp = RegExp(AppStrings.emailRegEx);
  static RegExp nameRegExp = RegExp(AppStrings.nameRegEX);
  static RegExp digitsRegExp = RegExp(AppStrings.digitsRegEx);
}