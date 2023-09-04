import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/auth/sign_up_screen.dart';

import '../providers.dart';
import '../utils/coustom_button.dart';
import '../utils/coustom_textfild.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Let's Login",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          CustTextFiled(
            labelText: 'Email',
            controlle: emailController,
          ),
          CustTextFiled(
            labelText: 'Password',
            controlle: passController,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer(builder: (context, ref, child) {
              final auth = ref.watch(authProvider);

              return auth.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : CustBtn(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      text: "Login",
                      onPressed: () {
                        print(emailController.text + " " + passController.text);

                        auth.login(
                            email: emailController.text.trim(),
                            password: passController.text.trim());
                      },
                    );
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("You have no account yet ?"),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingUpScreen()));
                  },
                  child: const Text("Signup"))
            ],
          )
        ],
      ),
    );
  }
}
