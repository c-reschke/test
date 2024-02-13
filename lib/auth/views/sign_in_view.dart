import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:auth/auth/widgets/navigate_to_sign_up_button.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({
    super.key,
    required this.state,
  });

  final AuthenticatorState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Center(child: FlutterLogo(size: 100)),
              SignInForm(includeDefaultSocialProviders: false),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        const Divider(indent: 16.0, endIndent: 16.0),
        NavigateToSignUpButton(state: state),
      ]),
    );
  }
}

class NavigateToSignInButton extends StatelessWidget {
  const NavigateToSignInButton({
    super.key,
    required this.state,
  });

  final AuthenticatorState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account?'),
        TextButton(
          onPressed: () => state.changeStep(
            AuthenticatorStep.signIn,
          ),
          child: const Text('Sign In'),
        ),
      ],
    );
  }
}
