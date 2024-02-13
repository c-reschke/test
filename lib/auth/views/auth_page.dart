import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:auth/auth/views/sign_up_view.dart';
import 'package:auth/domain/strings.dart';
import 'package:auth/domain/themes.dart';
import 'package:auth/home/views/home_page.dart';
import 'package:flutter/material.dart';

import 'onboard_view.dart';
import 'sign_in_view.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      initialStep: AuthenticatorStep.onboarding,
      authenticatorBuilder: (context, state) {
        switch (state.currentStep) {
          case AuthenticatorStep.onboarding:
            return OnboardingView(state: state);
          case AuthenticatorStep.signIn:
            return SignInView(state: state);
          case AuthenticatorStep.signUp:
            return SignUpView(state: state);
          default:
            return null;
        }
      },
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        builder: Authenticator.builder(),
        home: const HomePage(title: appName),
      ),
    );
  }
}

// An onboarding widget to display to unauthenticated users on initial app launch
