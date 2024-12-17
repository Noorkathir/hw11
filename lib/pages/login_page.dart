import 'package:flutter/material.dart';
import 'package:day11/pages/signup_page.dart';
import 'package:day11/pages/list_page.dart';
import 'package:day11/extension/nav.dart';
import 'package:day11/services/database.dart';
import 'package:day11/widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 249, 144, 237),
        // title: const Text('Login Page', style: TextStyle(color: Colors.white)), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Login",
              style: TextStyle(fontSize: 24, color: Colors.white), 
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              controller: emailController,
              text: "enter email",
    
            ),
            
            const SizedBox(height: 20),
            TextFieldWidget(
              controller: passwordController,
              text: "enter password",
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "If you don't have an account? ",
                  style: TextStyle(color: Colors.white), 
                ),
                TextButton(
                  onPressed: () {
                    context.pushAndRemoveUntil(
                      const SignupPage(),
                    );
                  },
                  child: const Text(
                    "Signup",
                    style: TextStyle(color: Color.fromARGB(255, 67, 25, 52)), 
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  await Database().login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListPage()),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 87, 37, 69), 
              ),
              child: const Text(
                "Login",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
