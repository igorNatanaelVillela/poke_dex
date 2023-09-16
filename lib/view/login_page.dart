import 'package:flutter/material.dart';
import 'package:poke_dex/components/form_text_field.dart';
import 'package:poke_dex/components/main_button.dart';
import 'package:poke_dex/controller/acess_controller.dart';
import 'package:poke_dex/view/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 228, 104, 104),
        title: Text(
          'PodeDex',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset('assets/images/logo.jpeg'),
              ],
            ),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  FormTextField(
                    labelText: 'Usuário',
                    hintText: 'Usuário',
                    textController: _usernameController,
                    iconInput: Icon(Icons.person_outline),
                    inputValidator: (username) {
                      if (username == null || username.isEmpty) {
                        return 'Por favor preencha o campo usuário';
                      }
                      return null;
                    },
                  ),
                  FormTextField(
                    labelText: 'Senha',
                    hintText: 'Senha',
                    textController: _passwordController,
                    iconInput: Icon(Icons.security),
                    obscureText: true,
                    inputValidator: (passwd) {
                      if (passwd == null || passwd.isEmpty) {
                        return 'Por favor preencha o campo Senha';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  mainButton(
                    buttonText: 'Login',
                    buttonCollor: Color.fromARGB(255, 245, 45, 45),
                    buttonFunction: () async {
                      final navigator = Navigator.of(context);

                      final messenger = ScaffoldMessenger.of(context);

                      if (_formkey.currentState!.validate()) {
                        bool loginSucess = await AcessController.instance.login(
                            _usernameController.text, _passwordController.text);

                        if (loginSucess) {
                          navigator.pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        } else {
                          messenger.showSnackBar(
                            SnackBar(
                              content: Text('Usuário e/ou senha incorretos'),
                              backgroundColor: Color.fromARGB(255, 238, 23, 8),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
