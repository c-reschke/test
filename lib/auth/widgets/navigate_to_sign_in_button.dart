import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

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