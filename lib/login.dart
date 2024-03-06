import 'dart:convert';
import 'package:ono/signUp.dart';
import 'package:ono/forgotPassword.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

// Define a data model for the Login credentials
class LoginCredentials {
  final String userEmail;
  final String userPassword;

  LoginCredentials({
    required this.userEmail,
    required this.userPassword,
  });

  // Serialize the data model into JSON format
  Map<String, dynamic> toJson() {
    return {
      'userEmail': userEmail,
      'userPassword': userPassword,
    };
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //    leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          title: const Text('LOGIN'),
          centerTitle: true,
          backgroundColor: Colors.red,
          titleTextStyle: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9,a-zA-Z0-9,!#$%&'*+-/=?^_`{|~}]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: passToggle,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                          passToggle ? Icons.visibility_off : Icons.visibility),
                    ),
                  ),
                  // obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 8.0), // Adjust spacing as needed
                TextButton(
                  onPressed: () {
                    // Add your forgot password logic here
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResetPasswordPage()));
                    print('Forgot Password pressed');
                  },
                  child: const Text('Forgot Password?'),
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform Login
                      // For demonstration, print email and password
                      print('userEmail: ${_emailController.text}');
                      print('userPassword: ${_passwordController.text}');

                      LoginCredentials credentials = LoginCredentials(
                        userEmail: _emailController.text,
                        userPassword: _passwordController.text,
                      );
                      //  print(credentials.userEmail);
                      //  print( credentials.userPassword);
                      String jsonData = jsonEncode(credentials.toJson());
                      print('JSON Data: $jsonData');
                      http
                          .post(
                        Uri.parse("http://10.0.2.2:4040/userLogin"),
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: jsonData,
                      )
                          .then((response) {
                        if (response.statusCode == 200) {
                          // Login successful
                          var res = json.decode(response.body);
                          debugPrint(res);
                          debugPrint(response.body);

                          // print('Login successful');
                        } else {
                          // Login failed
                          print('Login failed');
                        }
                      }).catchError((error) {
                        // Handle error
                        print('Error: $error');
                      });
                    }
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0), // Adjust spacing as needed
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        // Add your sign-up navigation logic here
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                        print('Sign up now pressed');
                      },
                      child: const Text('Sign up'),
                    ),
                    const SizedBox(height: 32.0),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ));
  }
}
