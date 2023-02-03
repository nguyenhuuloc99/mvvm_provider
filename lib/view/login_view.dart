import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/utils.dart';
import 'package:mvvm_provider/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  focusColor: Colors.white,
                  //add prefix icon
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                    color: Colors.grey,
                  ),
                  hintText: "Email",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                obscureText: true,
                obscuringCharacter: "*",
                controller: passWordController,
                decoration: const InputDecoration(
                  focusColor: Colors.white,
                  //add prefix icon
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                    color: Colors.grey,
                  ),
                  suffixIcon: Icon(Icons.visibility),
                  hintText: "Password",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isEmpty) {
                      Utils.showToast("email");
                    } else if (passWordController.text.isEmpty) {
                      Utils.showToast("pass");
                    } else {
                      Map data = {
                        'email': emailController.text.toString(),
                        'password': passWordController.text.toString()
                      };
                      authProvider.loginApi(data);
                    }
                  },
                  child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
