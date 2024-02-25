import 'package:flutter/material.dart';
import 'package:shop_app/common/widgets/custom_button.dart';
import 'package:shop_app/common/widgets/custom_textfield.dart';
import 'package:shop_app/constants/global_variables.dart';

enum Auth{
  signIn,
  signUp,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ListTile(
                tileColor: _auth==Auth.signUp ? GlobalVariables.backgroundColor:GlobalVariables.greyBackgroundColor,
                title: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signUp, 
                  groupValue: _auth, 
                  onChanged: (Auth? val){
                    setState(() {
                      _auth = val!;
                    });
                  }
                ),
              ),
              if(_auth == Auth.signUp)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key:_signUpFormKey,
                    child:Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: 'Name',
                        ),
                        const SizedBox(height : 10),
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height : 10),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                        ),
                        const SizedBox(height : 10),
                        CustomButton(text: 'Sign Up', onTap: (){
                          
                        }),
                      ],
                    ), 
                  ),
                ),
              ListTile(
                title: const Text(
                  'Sign-In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signIn, 
                  groupValue: _auth, 
                  onChanged: (Auth? val){
                    setState(() {
                      _auth = val!;
                    });
                  }
                ),
              ),
              if(_auth == Auth.signIn)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key:_signUpFormKey,
                    child:Column(
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height : 10),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: 'Password',
                        ),
                        const SizedBox(height : 10),
                        CustomButton(text: 'Sign Up', onTap: (){
                          
                        }),
                      ],
                    ), 
                  ),
                ),
            ],
          ),
        )
      )
    );
  }
}