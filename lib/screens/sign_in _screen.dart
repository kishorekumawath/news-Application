import 'package:flutter/material.dart';
import 'package:news_application/widgets/app_bar.dart';
import 'package:news_application/widgets/text_field.dart';
import 'package:provider/provider.dart';

import '../provides/auth_provider.dart';


class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: customAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 20,),
              customTextField(controller: emailController, label: "Email"),
              const SizedBox(height: 20,),
              customTextField(controller: passwordController, label: "Password",obscureText: true),
              const SizedBox(height: 20,),
              const Expanded(child: SizedBox()),
              ElevatedButton(
                onPressed: () async {
                  final authProvider = Provider.of<AuthProvider>(context, listen: false);
                  await authProvider.signIn(formKey,emailController.text, passwordController.text);
                  if (authProvider.user != null) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Don't have an account ?"),
                  TextButton(onPressed: ()=>Navigator.pushReplacementNamed(context, '/signUp'), child: Text("Register",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}