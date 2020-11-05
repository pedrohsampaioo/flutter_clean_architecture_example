import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: RaisedButton(
              child: Text('Sign in anonymous'),
              onPressed: () => Modular.to.pushNamed('/sign-in-anonymous'),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: RaisedButton(
              child: Text('Sign in phone number'),
              onPressed: () => Modular.to.pushNamed('/sign-in-phone-number'),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: RaisedButton(
              child: Text('Sign in google'),
              onPressed: () => Modular.to.pushNamed('/sign-in-google'),
            ),
          ),
        ],
      ),
    );
  }
}
