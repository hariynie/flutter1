import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Login Page"),
          ),
          backgroundColor: Colors.black,
        ),
        body: const Login(),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHidden = true;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Center(
          child: Container(
            height: 500,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter name',
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.length < 10 || value.isEmpty) {
                      return 'insufficient characters';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: const Icon(Icons.lock),
                    hintText: 'Enter Password',
                    labelText: 'Password',
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(Icons.visibility),
                    ),
                  ),
                  obscureText: _isHidden,
                  validator: (value) {
                    if (value == null || value.length < 10 || value.isEmpty) {
                      return 'insufficient characters';
                    }
                    return null;
                  },
                ),
                Container(
                    height: 40,
                    width: 75,
                    decoration: BoxDecoration(color: Colors.black),
                    child: Center(
                      child:
                          Text("Submit", style: TextStyle(color: Colors.white)),
                    ))
              ],
            ),
          ),
        ));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
