import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:korbil_mobile/nav/nav_service.dart';
import 'package:korbil_mobile/repository/api_service/api_service.dart';

class AuthRepo {
  final ApiService apiService = ApiService();

  // AuthCategory getAuth() => Amplify.Auth;

  Future<void> signIn({required String email, required String password}) async {
    try {
      final result =
          await Amplify.Auth.signIn(username: email, password: password);
          print(result);
      return _handleSignInResult(result, email);
    } on AuthException catch (e) {
      safePrint('Error signing in: ${e.message}');
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      final result = await Amplify.Auth.signOut();
      if (result is CognitoCompleteSignOut) {
        safePrint('Sign out completed successfully');
      } else if (result is CognitoFailedSignOut) {
        safePrint('Error signing user out: ${result.exception.message}');
        throw Exception(result.exception.message);
      }
    } on AuthException {
      rethrow;
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      final result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        // options: SignUpOptions(
        //   userAttributes: userAttributes,
        // ),
      );
      return _handleSignUpResult(result);
    } on AuthException catch (e) {
      safePrint('Error signing up user: ${e.message}');
    }
  }

  Future<void> updateUserAttributes(
      {String? email,
      String? firstname,
      String? lastname,
      String? phoneNumber}) async {
    final attributes = [
      AuthUserAttribute(
        userAttributeKey: AuthUserAttributeKey.email,
        value: email ?? '',
      ),
      AuthUserAttribute(
        userAttributeKey: AuthUserAttributeKey.name,
        value: firstname ?? '',
      ),
      AuthUserAttribute(
        userAttributeKey: AuthUserAttributeKey.familyName,
        value: lastname ?? '',
      ),
      AuthUserAttribute(
        userAttributeKey: AuthUserAttributeKey.phoneNumber,
        value: phoneNumber ?? '',
      ),
    ];
    try {
      final result = await Amplify.Auth.updateUserAttributes(
        attributes: attributes,
      );
      result.forEach((key, value) {
        switch (value.nextStep.updateAttributeStep) {
          case AuthUpdateAttributeStep.confirmAttributeWithCode:
            final destination = value.nextStep.codeDeliveryDetails?.destination;
            safePrint('Confirmation code sent to $destination for $key');
          case AuthUpdateAttributeStep.done:
            safePrint('Update completed for $key');
        }
      });
    } on AuthException catch (e) {
      safePrint('Error updating user attributes: ${e.message}');
    }
  }

  Future<AuthUser> getUser() async {
    try {
      final user = await Amplify.Auth.getCurrentUser();
      return user;
    } on AuthException {
      rethrow;
    }
  }

  Future<void> _handleSignUpResult(SignUpResult result) async {
    switch (result.nextStep.signUpStep) {
      case AuthSignUpStep.confirmSignUp:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        _handleCodeDelivery(codeDeliveryDetails);
      case AuthSignUpStep.done:
        safePrint('Sign up is complete');
    }
  }

  Future<void> _handleSignInResult(SignInResult result, String username) async {
    switch (result.nextStep.signInStep) {
      // ···
      case AuthSignInStep.confirmSignUp:
        // Resend the sign up code to the registered device.
        final resendResult = await Amplify.Auth.resendSignUpCode(
          username: username,
        );
        _handleCodeDelivery(resendResult.codeDeliveryDetails);
      // ···
      case AuthSignInStep.continueSignInWithMfaSelection:
      // TODO(dmgcoding): Handle this case.
      case AuthSignInStep.continueSignInWithTotpSetup:
      // TODO(dmgcoding): Handle this case.
      case AuthSignInStep.confirmSignInWithSmsMfaCode:
      // TODO(dmgcoding): Handle this case.
      case AuthSignInStep.confirmSignInWithTotpMfaCode:
      // TODO(dmgcoding): Handle this case.
      case AuthSignInStep.confirmSignInWithNewPassword:
      // TODO(dmgcoding): Handle this case.
      case AuthSignInStep.confirmSignInWithCustomChallenge:
      // TODO(dmgcoding): Handle this case.
      case AuthSignInStep.resetPassword:
      // TODO(dmgcoding): Handle this case.
      case AuthSignInStep.done:
      // TODO(dmgcoding): Handle this case.
    }
  }

  void _handleCodeDelivery(AuthCodeDeliveryDetails codeDeliveryDetails) {
    safePrint(
      'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
      'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.',
    );
  }

  // Future<bool> isUserAuthenticated(){}
  // Future<String> getAuthorization(){}
}

// abstract class AuthenticationService {
//   Future<bool> signIn(String email, String password);
//   Future<void> signOut();
//   Future<bool> isUserAuthenticated();
//   Future<String> getAuthorization();
// }

// class AmplifyService {
//   Future<void> addPlugin(AmplifyPluginInterface plugin) =>
//       Amplify.addPlugin(plugin);

//   Future<void> configure(String configuration) =>
//       Amplify.configure(configuration);

//   AuthCategory getAuth() => Amplify.Auth;
// }

class AuthenticationService {
  AuthenticationService._(
    // required this.navigationService
    );
  // {NavigationService? navigationService})
  // : navigationService = navigationService ?? locator<NavigationService>();
  // final AmplifyService amplifyService;

  // final NavigationService navigationService;

  static const cognitoConfig = '''
 {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "IdentityManager": {
                "Default": {}
            },
            "awsCognitoAuthPlugin": {
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "eu-north-1_SXrqspKfU",
                        "AppClientId": "41ohaedagbaa97hv41dv2gesr3",
                        "AppClientSecret": "qoq7cd5ci045rnckr335b3vl47l0k4ss9db00696dpkscofsb2o",
                        "Region": "eu-north-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                }
            }
        }
    }
}
''';

  static Future<AuthenticationService> init(
      
        
        // required NavigationService navigationService
        ) async {
    // if (amplifyService == null) {
    //   amplifyService = AmplifyService();
    //   await amplifyService.addPlugin(AmplifyAuthCognito());
    //   await amplifyService.configure(cognitoConfig);
    // }
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.configure(cognitoConfig);
    return AuthenticationService._(
      // navigationService: navigationService
      );
  }
}
