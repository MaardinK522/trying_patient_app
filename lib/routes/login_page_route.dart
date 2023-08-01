import 'package:flutter/material.dart';

import '../main.dart';
import 'home_page_route.dart';
import 'sign_up_page_route.dart';

class LoginPageRoute extends StatefulWidget {
  const LoginPageRoute({Key? key}) : super(key: key);

  @override
  State<LoginPageRoute> createState() => _LoginPageRouteState();
}

class _LoginPageRouteState extends State<LoginPageRoute> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _phoneTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  late OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide:
        BorderSide(color: Theme.of(context).colorScheme.primaryContainer),
  );
  var buttonRoundness = ButtonStyle(
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    )),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  const Center(
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
                  const SizedBox(height: 50),
                  Hero(
                    tag: "email",
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        controller: _emailTextEditingController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: outlineInputBorder,
                          hintText: "Email",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text("Or"),
                  const SizedBox(height: 10),
                  Hero(
                    tag: "phone",
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        controller: _phoneTextEditingController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: outlineInputBorder,
                          hintText: "Phone",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Hero(
                    tag: "password",
                    child: Material(
                      color: Colors.transparent,
                      child: TextField(
                        controller: _passwordTextEditingController,
                        textInputAction: TextInputAction.done,
                        autofillHints: const [AutofillHints.password],
                        decoration: InputDecoration(
                          border: outlineInputBorder,
                          hintText: "Password",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Hero(
                    tag: "signup",
                    child: OutlinedButton(
                      style: buttonRoundness,
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const SignupPageRoute(),
                        ),
                      ),
                      child: const Text("Signup"),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Hero(
                    tag: "login",
                    child: FilledButton.tonal(
                      style: buttonRoundness,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePageRoute(),
                          ),
                        );
                      },
                      child: const Text("Login"),
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
