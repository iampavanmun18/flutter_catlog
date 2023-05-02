import 'package:flutter/material.dart';
import 'package:flutter_catlog/pages/home_page.dart';

import 'home_page_grid_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // color: Colors.white,
      appBar: AppBar(
        title: const Center(child: Text("Login Page")),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Image.asset("../../assets/images/login_image2.png",
                  fit: BoxFit.contain),
              const SizedBox(height: 20),
              Text(
                "Welcome $name",
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              //   child: Column(
              //     children: [
              //       TextFormField(
              //         decoration: const InputDecoration(
              //             hintText: "Enter Username", labelText: "Username"),
              //         onChanged: (value) {
              //           name = value;
              //           setState(() {});
              //         },
              //       ),
              //       TextFormField(
              //         obscureText: true,
              //         decoration: const InputDecoration(
              //             hintText: "Enter Password", labelText: "Password"),
              //       ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter UserName'),
                  // onChanged: (value) => {name = value, setState(() => {})},
                  validator: (value) {
                    if (value!.isEmpty) {
                      RequestFocusAction();
                      return "UserName cannot be empty";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password cannot be empty";
                    } else if (value.length <= 6) {
                      return "Password length should be greater than 6";
                    }
                    return null;
                  },
                  // onChanged: (value) => {name = value, setState(() => {})},
                ),
              ),
              const SizedBox(height: 20),
              Material(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  // onTap: () async {
                  //   await Future.delayed(Duration(seconds: 3));
                  //   // ignore: use_build_context_synchronously
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => const HomePage()));
                  // },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: changeButton ? 50 : 150,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () async {
                          moveToHome(context);
                        },
                        style: TextButton.styleFrom(),
                        child: changeButton
                            ? const Icon(Icons.done)
                            : const Text("Login")),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));

      // ignore: use_build_context_synchronously
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePageGrid()));
      setState(() {
        changeButton = false;
      });
    }
  }
}
