import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:korbil_mobile/nav/router.dart';

class AuthRepo {
  Future<void> configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException catch (e) {
      print(e);
    }
  }

  Future<bool> signIn({required String email, required String password}) async {
    try {
      await Amplify.Auth.signOut();

      final result =
          await Amplify.Auth.signIn(username: email, password: password);
      await _handleSignInResult(result, email, password);
      return result.isSignedIn;
    } on AuthException catch (e) {
      print('Error signing in: ${e.message}');
      rethrow;
    }
  }

  Future<CognitoUserPoolTokens> fetchCognitoAuthSession() async {
    try {
      final cognitoPlugin =
          Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
      final result = await cognitoPlugin.fetchAuthSession();
      final identityId = result.identityIdResult.value;
      final token = result.userPoolTokensResult.value;

      safePrint("Current user's identity ID: $identityId");
      safePrint("Current user's token: $token");
      return token;
    } on AuthException catch (e) {
      safePrint('Error retrieving auth session: ${e.message}');
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

  Future<void> signUp({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required String phoneNumber,
  }) async {
    try {
      final userAttributes = {
        AuthUserAttributeKey.email: email,
        AuthUserAttributeKey.givenName: firstname,
        AuthUserAttributeKey.familyName: lastname,
        AuthUserAttributeKey.phoneNumber: phoneNumber,
      };

      final result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: SignUpOptions(
          userAttributes: userAttributes,
        ),
      );
      return _handleSignUpResult(result);
    } on AuthException catch (e) {
      safePrint('Error signing up user: ${e.message}');
      final error = e.message as Error;
      throw error;
    }
  }

  Future<void> updateUserAttributes({
    String? email,
    String? firstname,
    String? lastname,
    String? phoneNumber,
  }) async {
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
    } on AuthException catch (e) {
      // rethrow;
      final error = e.message as Error;
      throw error;
    }
  }

  Future<void> _handleSignUpResult(SignUpResult result) async {
    switch (result.nextStep.signUpStep) {
      case AuthSignUpStep.confirmSignUp:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        await _handleCodeDelivery(
          codeDeliveryDetails,
        );
      case AuthSignUpStep.done:
        safePrint('Sign up is complete');
    }
  }

  Future<void> _handleSignInResult(
      SignInResult result, String username, String password) async {
    switch (result.nextStep.signInStep) {
      // ···
      case AuthSignInStep.confirmSignUp:
        final resendResult = await Amplify.Auth.resendSignUpCode(
          username: username,
        );
        await _handleCodeDelivery(
          resendResult.codeDeliveryDetails,
        );
      case AuthSignInStep.confirmSignInWithNewPassword:
        safePrint('Enter a new password to continue signing in');
        await Amplify.Auth.confirmSignIn(confirmationValue: password);

      // ···
      case AuthSignInStep.continueSignInWithMfaSelection:
      // TODO(dmgcoding): Handle this case.
      case AuthSignInStep.continueSignInWithTotpSetup:
      // TODO(dmgcoding): Handle this case.
      case AuthSignInStep.confirmSignInWithSmsMfaCode:
      // TODO(dmgcoding): Handle this case.
      case AuthSignInStep.confirmSignInWithTotpMfaCode:
      // TODO(dmgcoding): Handle this case.

      case AuthSignInStep.confirmSignInWithCustomChallenge:
      // TODO(dmgcoding): Handle this case.
      case AuthSignInStep.resetPassword:
      // TODO(dmgcoding): Handle this case.
      case AuthSignInStep.done:
      // TODO(dmgcoding): Handle this case.
    }
  }

  Future<void> _handleCodeDelivery(
    AuthCodeDeliveryDetails codeDeliveryDetails,
  ) {
    print(
      'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
      'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.',
    );

    return showDialog(
      context: rootNavKey.currentContext!,
      builder: (context) => AlertDialog(
        content: Text('''
A confirmation code has been sent to ${codeDeliveryDetails.destination}.
      Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.'''),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close')),
        ],
      ),
    );
  }

  static const amplifyconfig = '''
 {
  "UserAgent": "aws-amplify-cli/2.0",
  "Version": "1.0",
  "auth": {
    "plugins": {
      "awsCognitoAuthPlugin": {
        "IdentityManager": {
          "Default": {}
        },
        "CredentialsProvider": {
          "CognitoIdentity": {
            "Default": {
              "PoolId": "eu-north-1_SXrqspKfU",
              "Region": "eu-north-1"
            }
          }
        },
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
            "authenticationFlowType": "USER_SRP_AUTH",
            "OAuth": {
              "WebDomain": "[YOUR COGNITO DOMAIN ]",
              "AppClientId": "41ohaedagbaa97hv41dv2gesr3",
              "SignInRedirectURI": "[CUSTOM REDIRECT SCHEME AFTER SIGN IN, e.g. myapp://]",
              "SignOutRedirectURI": "[CUSTOM REDIRECT SCHEME AFTER SIGN OUT, e.g. myapp://]",
              "Scopes": [
                "phone",
                "email",
                "openid",
                "profile",
                "aws.cognito.signin.user.admin"
              ]
            }
          }
        }
      }
    }
  }
}''';
}
