import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ic_creame_app/core/Responsive/sizeconfig.dart';
import 'package:ic_creame_app/core/constants/app_color.dart';
import 'package:ic_creame_app/core/constants/static_constants.dart';
import 'package:ic_creame_app/core/hive.dart';
import 'package:ic_creame_app/features/authentication%20/providers/sign_in_provider.dart';
import 'package:ic_creame_app/features/catalouge/main_catalouge.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _phone;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            Image.asset(
                "assets/icons/biometric-authentication-2600572-2179757.png",
                height: SizeConfig.getHeight - 500),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Phone'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _phone = value!;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value!;
                      },
                    ),
                    const SizedBox(height: 60),
                    SizedBox(
                      height: SizeConfig.getHeight * 0.1 - 30,
                      width: SizeConfig.getWidth,
                      child: ElevatedSignUpButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              // TODO: Authenticate user with email and password
                            }
                          },
                          text: "Sign Up With SuddenPlans"),
                    ),
                    const SizedBox(height: 20),
                    const OrDivider(),
                    const SizedBox(height: 20),
                    const GoogleSignInButton(),
                    const SizedBox(height: 20),
                    const FacebookLogInButton()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  GoogleSignInAccount? _currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        context.read<SignUpProvider>().handleGetContact(_currentUser!);
      }
    });
    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.getWidth,
      height: SizeConfig.getHeight * 0.1 - 30,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.grey229, elevation: 0.6),
        icon: Image.asset(
          'assets/icons/GOOG-0ed88f7c.png',
          height: 35.0,
        ),
        label: const Text(
          'Sign Up with Google',
          style: TextStyle(
              color: AppColors.grey70,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          try {
            GoogleSignInAccount? account = await _googleSignIn.signIn();
            final token = await account?.authentication;
            if (token?.accessToken != null) {
              await LocalStorageHive.storeToken(token?.accessToken);
            }
            setState(() async {
              await LocalStorageHive.getStoredToken();
            });
          } catch (error) {
            log(error.toString());
          }
        },
      ),
    );
  }
}

class ElevatedSignUpButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const ElevatedSignUpButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.getHeight * 0.1 - 30,
      width: SizeConfig.getWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary.withOpacity(0.9),
            elevation: 0.4),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class FacebookLogInButton extends StatefulWidget {
  const FacebookLogInButton({Key? key}) : super(key: key);

  @override
  State<FacebookLogInButton> createState() => _FacebookLogInButtonState();
}

class _FacebookLogInButtonState extends State<FacebookLogInButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.getHeight * 0.1 - 30,
      width: SizeConfig.getWidth,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.violet, elevation: 0.6),
        icon: Image.asset(
          'assets/icons/facebook-logo-icon-file-facebook-icon-svg-wikimedia-commons-4.png',
          height: 40.0,
        ),
        label: const Text(
          'Sign Up with Facebook',
          style: TextStyle(
              color: AppColors.whiteFF,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          try {
            final token = await context.read<SignUpProvider>().facebookLogIn();
            if (token != null) {
              await LocalStorageHive.storeToken(token.token);
            }
            setState(() async {
              await LocalStorageHive.getStoredToken();
            });
          } catch (error) {
            log(error.toString());
          }
        },
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: Divider(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text("OR"),
        ),
        Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
