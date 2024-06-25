class Urls {
  //api constants
  static const String _baseUrl = 'https://task.teamrabbil.com/api/v1/';

  static const String signUpUrl = '$_baseUrl/registration';
  static const String signInUrl = '$_baseUrl/login';
  static const String recoverEmailUrl = '$_baseUrl/RecoverVerifyEmail';
  static const String verifyOTPUrl = '$_baseUrl/RecoverVerifyOTP';
  static const String resetPasswordUrl = '$_baseUrl/RecoverResetPass';
  static const String taskStatusCountUrl = '$_baseUrl/taskStatusCount';
  static const String listTaskByStatusUrl = '$_baseUrl/listTaskByStatus';
  static const String deleteTaskUrl = '$_baseUrl/deleteTask';
  static const String createTaskUrl = '$_baseUrl/createTask';
  static const String updateTaskUrl = '$_baseUrl/updateTaskStatus';
  static const String profileUpdateUrl = '$_baseUrl/profileUpdate';
}
