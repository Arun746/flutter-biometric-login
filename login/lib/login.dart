// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isBiometricAvailable = false;

  @override
  void initState() {
    super.initState();
    _checkBiometricsAvailability();
  }

  Future<void> _checkBiometricsAvailability() async {
    final localAuth = LocalAuthentication();
    bool isAvailable = await localAuth.canCheckBiometrics;
    setState(() {
      _isBiometricAvailable = isAvailable;
    });
  }

  Future<void> _authenticateWithBiometrics() async {
    final localAuth = LocalAuthentication();
    try {
      final bool authenticated = await localAuth.authenticate(
        localizedReason: 'Please authenticate to log in.',
      );

      if (authenticated) {
        Navigator.pushReplacementNamed(context, '/Home');
      } else {
        FlutterError('Authentication failed');
      }
    } on PlatformException catch (e) {
      FlutterError('Failed to authenticate: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Center(
                child: Text(
                  'This is login screen where we implement biometric login',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 310,
              ),
              GestureDetector(
                onTap: () {
                  _isBiometricAvailable
                      ? _authenticateWithBiometrics()
                      : FlutterError('Device ot compatible');
                },
                child: Icon(
                  Icons.fingerprint,
                  size: 70,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text('Login Using Fingerprint'),
            ],
          ),
        ),
      ),
    );
  }
}
