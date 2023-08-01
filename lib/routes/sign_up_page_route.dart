import 'package:flutter/material.dart';
import 'package:phyzzicare/main.dart';

import 'login_page_route.dart';

class SignupPageRoute extends StatefulWidget {
  const SignupPageRoute({Key? key}) : super(key: key);

  @override
  State<SignupPageRoute> createState() => _SignupPageRouteState();
}

class _SignupPageRouteState extends State<SignupPageRoute> {
  var buttonRoundness = ButtonStyle(
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    )),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    Center(
                      child: Hero(
                        tag: "applogo",
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            MyApp.appName,
                            style: TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    TextField(
                      autofillHints: [AutofillHints.givenName],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "First name..",
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      autofillHints: [AutofillHints.familyName],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Last name...",
                      ),
                    ),
                    SizedBox(height: 20),
                    Hero(
                      tag: "email",
                      child: Material(
                        color: Colors.transparent,
                        child: TextField(
                          autofillHints: [AutofillHints.email],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Email",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Hero(
                      tag: "phone",
                      child: Material(
                        color: Colors.transparent,
                        child: TextField(
                          autofillHints: [AutofillHints.email],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Phone",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Hero(
                      tag: "password",
                      child: Material(
                        color: Colors.transparent,
                        child: TextField(
                          obscureText: true,
                          autofillHints: [AutofillHints.email],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Password",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Hero(
                    tag: "login",
                    child: OutlinedButton(
                      style: buttonRoundness,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPageRoute(),
                          ),
                        );
                      },
                      child: const Text("Login"),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Hero(
                    tag: "signup",
                    child: FilledButton.tonal(
                      style: buttonRoundness,
                      onPressed: () {},
                      child: const Text("Signup"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
