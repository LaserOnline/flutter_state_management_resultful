import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../api/config.dart';
import '../controller/LoginController.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final LoginController _loginController = Get.put(LoginController());
  final TextEditingController UsernameController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  bool _isShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 500,
                  height: 400,
                  color: Color.fromARGB(255, 255, 187, 0),
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  width: 250,
                  child: Column(
                    children: [
                      TextField(
                        controller: UsernameController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 3, color: Color.fromARGB(255, 2, 2, 2)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 3, color: Color.fromARGB(255, 2, 2, 2)),
                          ),
                          fillColor: Color.fromARGB(206, 248, 248, 250),
                          filled: true,
                          hintText: 'Username',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                          prefixIcon: const Icon(
                            Icons.account_circle,
                            color: Color.fromARGB(255, 5, 5, 5),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      TextField(
                        obscureText: _isShow,
                        controller: PasswordController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 3, color: Color.fromARGB(255, 2, 2, 2)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(
                                width: 3, color: Color.fromARGB(255, 2, 2, 2)),
                          ),
                          fillColor: Color.fromARGB(206, 248, 248, 250),
                          filled: true,
                          hintText: 'Password',
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 8, 8, 8)),
                          prefixIcon: const Icon(
                            Icons.password,
                            color: Color.fromARGB(255, 5, 5, 5),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(_isShow
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isShow = !_isShow;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 100,
                  child: Center(
                    child: InkWell(
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () {
                        FutureBuilder(
                          future: _loginController.checkAuthen(
                            UsernameController.text,
                            PasswordController.text,
                          ),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            return const CircularProgressIndicator();
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
