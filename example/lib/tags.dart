import 'package:shepherd_tag/shepherd_tag.dart';

@ShepherdTag(id: 'US-001', description: 'Sample Login Flow')
@ShepherdPageTag(id: 'login-page')
class LoginPageTags {
  static const String emailField = 'auth_email_field';
  static const String loginButton = 'login_button';
  static const String forgotPassword = 'forgot_password';
}

@ShepherdTag(id: "US-002", description: "Sample Signup Flow")
class SignupPageTags {
  static const String signupButton = 'signup_button';
}
