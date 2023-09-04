import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/auth/log_in_screen.dart';

import '../providers.dart';
import '../utils/coustom_button.dart';
import '../utils/coustom_textfild.dart';

class SingUpScreen extends StatelessWidget {
  SingUpScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text("SignUp"),
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
              "Create account",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          CustTextFiled(
            labelText: 'Name',
            controlle: nameController,
          ),
          CustTextFiled(
            labelText: 'Email',
            controlle: emailController,
          ),
          CustTextFiled(
            labelText: 'Password',
            controlle: passController,
          ),
          // CustTextFiled(
          //   labelText: 'Conform Password',
          //   controlle: confPassController,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer(builder: (context, ref, child) {
              final auth = ref.watch(authProvider);
              return auth.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : CustBtn(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      text: "SingUp",
                      onPressed: () {
                        auth.signup(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passController.text.trim(),context: context);
                      },
                    );
            }),
          ),
        ],
      ),
    );
  }
}
