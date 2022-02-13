import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var creatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: null,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.purple,
            title: const Text(
              'My Books to Read',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: Container(
            color: Colors.black12,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        creatingAccount == false ? 'Login' : 'Sign in',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextField(
                        controller: widget.emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.purple,
                          ),
                          hintText: 'Email',
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        obscureText: true,
                        controller: widget.passwordController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: Colors.purple,
                          ),
                          hintText: 'Password',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        errorMessage,
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (creatingAccount == true) {
                              try {
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: widget.emailController.text,
                                        password:
                                            widget.passwordController.text);
                              } catch (error) {
                                setState(() {
                                  errorMessage = 'Something went wrong!';
                                });
                                widget.emailController.clear();
                                widget.passwordController.clear();
                              }
                            } else {
                              try {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: widget.emailController.text,
                                  password: widget.passwordController.text,
                                );
                                widget.emailController.clear();
                                widget.passwordController.clear();
                                // widget.onCreate();
                              } catch (error) {
                                setState(() {
                                  errorMessage = 'Wrong email or password!';
                                });
                                widget.emailController.clear();
                                widget.passwordController.clear();
                              }
                            }
                          },
                          child: Text(
                            creatingAccount == false ? 'Login' : 'Register',
                          ),
                          style:
                              ElevatedButton.styleFrom(primary: Colors.purple)),
                      const SizedBox(
                        height: 20,
                      ),
                      if (creatingAccount == false) ...[
                        TextButton(
                          onPressed: () {
                            setState(() {
                              creatingAccount = true;
                              errorMessage = '';
                            });
                          },
                          child: const Text(
                            'Create account',
                            style: TextStyle(color: Colors.purple),
                          ),
                        )
                      ],
                      if (creatingAccount == true) ...[
                        TextButton(
                          onPressed: () {
                            setState(() {
                              creatingAccount = false;
                            });
                          },
                          child: const Text('Already have account?',
                              style: TextStyle(color: Colors.purple)),
                        ),
                      ]
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
