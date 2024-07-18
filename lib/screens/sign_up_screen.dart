import 'package:flutter/material.dart';
import 'package:news_application/widgets/app_bar.dart';
import 'package:news_application/widgets/text_field.dart';
import 'package:provider/provider.dart';
import '../provides/auth_provider.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: customAppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 20,),

              customTextField(controller: nameController, label: "Name"),
              const SizedBox(height: 20,),
              customTextField(controller: emailController, label: "Email"),
              const SizedBox(height: 20,),

              customTextField(controller: passwordController, label: "Password",obscureText: true),
              const SizedBox(height: 20,),

              const Expanded(child: SizedBox()),


              ElevatedButton(
                onPressed: () async {
                  final authProvider = Provider.of<AuthProvider>(context, listen: false);
                  await authProvider.signUp(
                    formKey,
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                  );
                  if (authProvider.user != null) {
                    Navigator.pushReplacementNamed(context, '/home');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Already have an account ?"),
                  TextButton(onPressed: ()=>Navigator.pushReplacementNamed(context, '/'), child: Text("Login",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}