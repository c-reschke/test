import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import 'sign_in_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    super.key,
    required this.state,
  });

  final AuthenticatorState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SIGN IN')),
      body: SingleChildScrollView(
        child: AuthenticatorForm(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Center(child: FlutterLogo(size: 100)),

                SignUpFormField.username(),
                SignUpFormField.password(),

                TermsAndConditionsCheckBox(
                  onChanged: (value) => state.setCustomAttribute(
                    const CognitoUserAttributeKey.custom(
                      'terms-and-conditions',
                    ),
                    value.toString(),
                  ),
                ),

                const SignUpButton(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(height: 16),
        const Divider(indent: 16.0, endIndent: 16.0),
        NavigateToSignInButton(state: state),
      ]),
    );
  }
}

class TermsAndConditionsCheckBox extends FormField<bool> {
  TermsAndConditionsCheckBox({
    super.key,
    required this.onChanged,
  }) : super(
    validator: (value) {
      if (value != true) {
        return 'You must agree to the terms and conditions';
      }
      return null;
    },
    initialValue: false,
    builder: (FormFieldState<bool> state) {
      return CheckboxListTile(
        dense: true,
        title: Row(
          children: [
            const Text('I agree to the'),
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 4),
              ),
              onPressed: () {
                // Navigator.of(state.context).push(
                //   MaterialPageRoute<void>(
                //     builder: (BuildContext context) =>
                //     const TermsAndConditionsView(),
                //   ),
                // );
              },
              child: const Text('terms and conditions'),
            ),
          ],
        ),
        value: state.value,
        onChanged: (value) {
          onChanged(value);
          state.didChange(value);
        },
        subtitle: state.hasError
            ? Builder(
          builder: (BuildContext context) => Text(
            state.errorText!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        )
            : null,
        controlAffinity: ListTileControlAffinity.leading,
      );
    },
  );
  final void Function(bool?) onChanged;
}
