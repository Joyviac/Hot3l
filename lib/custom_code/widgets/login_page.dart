// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:web_ffi/web_ffi.dart';
import 'package:agent_dart/agent_dart.dart';

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

import 'package:magic_sdk/magic_sdk.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Magic magic = Magic.instance;

  final myController = TextEditingController(text: 'your.email@example.com');

  @override
  void initState() {
    super.initState();

    /// Checks if the user is already loggedIn
    var future = magic.user.isLoggedIn();
    future.then((isLoggedIn) {
      if (isLoggedIn) {
        /// Navigate to home page
        //   Navigator.push(context,
        //       MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Magic Demo Login'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: TextFormField(
              controller: myController,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () async {
              var token =
                  await magic.auth.loginWithEmailOTP(email: myController.text);
              debugPrint('token, $token');

              if (token.isNotEmpty) {
                /// Navigate to home page
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const HomePage()));
              }
            },
            child: const Text('Login With Magic Email OTP'),
          ),
        ])));
  }
}
