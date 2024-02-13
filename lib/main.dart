import 'package:auth/auth/views/auth_page.dart';
import 'package:flutter/material.dart';

import 'domain/amplify/configure_amplify.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await AmplifyHelper.configureAmplify();

  runApp(const AuthPage());
}

