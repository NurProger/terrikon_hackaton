import 'package:flutter/material.dart';
import 'package:hackaton_terricon/constance/color.dart';
import 'package:hackaton_terricon/constance/size.dart';
import 'package:hackaton_terricon/view/email_confirm_view.dart';
import 'package:hackaton_terricon/view/sign_in_view.dart';
import 'package:hackaton_terricon/widgets/button.dart';
import 'package:hackaton_terricon/widgets/button_border.dart';
import 'package:hackaton_terricon/widgets/text_form_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
              TextFormFieldWidget(
                hintText: 'Email',
                controller: emailController,
                obscureText: false,
                visibility: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите email';
                  }
                  // Дополнительная проверка email можно добавить тут
                  return null;
                },
              ),
              TextFormFieldWidget(
                hintText: 'Пароль',
                controller: passwordController,
                obscureText: true,
                visibility: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Введите пароль';
                  }
                  if (value.length < 6) {
                    return 'Пароль должен быть не менее 6 символов';
                  }
                  return null;
                },
              ),
              TextFormFieldWidget(
                hintText: 'Повторите пароль',
                controller: passwordAgainController,
                obscureText: true,
                visibility: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Повторите пароль';
                  }
                  if (value != passwordController.text) {
                    return 'Пароли не совпадают';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: heightApp(context) * .02,
              ),
              ButtonBorderWidget(
                text: 'Регистрация',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmailConfirmView(email: emailController.text,)),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonWidget(
                text: 'Войти',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInView()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
