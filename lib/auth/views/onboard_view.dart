import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key, required this.state});

  final AuthenticatorState state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const FlutterLogo(size: 200),
            const SizedBox(height: 32),
            Text(
              'Teste',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  state.changeStep(
                    AuthenticatorStep.signUp,
                  );
                },
                child: const Text('SIGN UP'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: (){
                  state.changeStep(
                    AuthenticatorStep.signUp,
                  );
                },
                child: const Text('SIGN IN'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
