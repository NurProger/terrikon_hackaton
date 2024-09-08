import 'package:flutter/material.dart';
import 'package:hackaton_terricon/constance/size.dart';
import 'package:hackaton_terricon/widgets/button.dart';
import 'package:hackaton_terricon/widgets/button_border.dart';
import 'package:hackaton_terricon/widgets/text_form_field.dart';
class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordAgainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormFieldWidget(hintText: 'Email',controller: emailController,obscureText: false,visibility: false,validator: (value){
                if(value == null || value.isEmpty){
                  return 'Повторите email';
                }
                return null;
              },),
              TextFormFieldWidget(hintText: 'Пароль',controller: passwordController,obscureText: true,visibility: true,validator: (value){
                if(value == null || value.isEmpty){
                  return 'Повторите пароль';
                }
                return null;
              },),
              SizedBox(height: heightApp(context) * .02,),
              ButtonBorderWidget(text: 'Войти', onTap: () {
                if(_formKey.currentState!.validate()){
                  print('Succes');
                }
              },),
              const SizedBox(height: 10,),
              ButtonWidget(text: 'Регистрация', onTap: () {
                Navigator.pop(context);
              },)
            ],
          ),
        ),
      ),
    );
  }
}
