import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

import 'amplify_configuration.dart';

class AmplifyHelper {
  static Future<void> configureAmplify() async {
    if (!Amplify.isConfigured) {
      final auth = AmplifyAuthCognito();

      try {
        Amplify.addPlugins([auth]);

        await Amplify.configure(amplifyConfig);
      } on AmplifyAlreadyConfiguredException catch (e) {
        safePrint(e);
      }
    }
  }
}
