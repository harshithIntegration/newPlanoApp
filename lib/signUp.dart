import 'package:csc_picker/csc_picker.dart';
import 'package:ono/forgotPassword.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool passToggle = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('SignUp'),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.0, // Adjust the height of TextFields
                  child: TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        // fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Icon(Icons.perm_identity,
                          color: Color.fromARGB(255, 65, 63, 63)),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  height: 50.0, // Adjust the height of TextFields
                  child: TextFormField(
                    controller: _mobileController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                        return 'Please enter a valid 10-digit mobile number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Mobile Number',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        // fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Icon(Icons.phone,
                          color: Color.fromARGB(255, 65, 63, 63)),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  height: 50.0, // Adjust the height of TextFields
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        // fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Icon(Icons.email,
                          color: Color.fromARGB(255, 65, 63, 63)),
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
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  height: 50.0, // Adjust the height of TextFields
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        // fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Icon(Icons.lock_outlined,
                          color: Color.fromARGB(255, 65, 63, 63)),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  height: 110.0, // Adjust the height of CSCPicker
                  child: CSCPicker(
                    onCountryChanged: (country) {},
                    onStateChanged: (state) {},
                    onCityChanged: (city) {},
                    layout: Layout.horizontal,
                    countrySearchPlaceholder: "Country",
                    stateSearchPlaceholder: "State",
                    citySearchPlaceholder: "City",
                    defaultCountry: CscCountry.India,
                    showStates: true,
                    showCities: false,
                  ),
                ),

// Container(
//   height: 150.0,
//   decoration: BoxDecoration(
//     border: Border.all(
//       color: Colors.black, // Set the border color to black
//     ),
//   ),
//   child: CSCPicker(
//     onCountryChanged: (country) {},
//     onStateChanged: (state) {},
//     onCityChanged: (city) {},
//     layout: Layout.horizontal,
//     countrySearchPlaceholder: "Country",
//     stateSearchPlaceholder: "State",
//     citySearchPlaceholder: "City",
//     defaultCountry: CscCountry.India,
//     showStates: true,
//     showCities: false,
//   ),
// ),

// import 'package:flutter/material.dart';

// class MyCustomDropdown extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.black, // Set the border color to black
//         ),
//         borderRadius: BorderRadius.circular(5.0), // Optional: Add border radius
//       ),
//       child: DropdownButton<String>(
//         // Modify this to suit your data and functionality
//         items: <String>['Country', 'State', 'City'].map((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//         onChanged: (String? newValue) {
//           // Handle onChanged event
//         },
//       ),
//     );
//   }
// }

// // Usage:
// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text('Custom Dropdown Example'),
//       ),
//       body: Center(
//         child: MyCustomDropdown(),
//       ),
//     ),
//   ));
// }

                const SizedBox(height: 10.0),

                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPasswordPage()),
                        );
                      }
                    },
                    child: Text('SignUp'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade900,
                      foregroundColor: Colors.white,
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
