import 'package:farmapp_mobile/user/view/registration_screen.dart';
import 'package:farmapp_mobile/user/view_model/userregistration_viewmodel.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    final vvm = context.watch<UserRegistrationViewModel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              vvm.error,
              style: TextStyle(color: Colors.red),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "username",
                prefixIcon: Icon(Icons.perm_identity_sharp),
              ),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "password",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            TextButton(
              onPressed: () {
                vvm.loginUser(
                    _usernameController.text, _passwordController.text);
                setState(() {
                  vvm.error = "";
                });
              },
              child: Text("Login"),
            ),
            Row(
              children: [
                Text(
                  "Don't have an account?",
                ),
                TextButton(
                  child: Text(
                    "Sign up",
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(RegistrationScreen.routeName);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
