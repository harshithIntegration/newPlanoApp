import 'package:flutter/material.dart';

class viewProfilePage extends StatefulWidget {
  const viewProfilePage();

  @override
  _viewProfilePageState createState() => _viewProfilePageState();
}

class _viewProfilePageState extends State<viewProfilePage> {
  String _name = 'abc';
  String _phone = '1234567890';
  String _address = ' BANGALORE';
  String _email = 'abc@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PROFILE PAGE',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              itemProfile('Name', _name, Icons.person),
              const SizedBox(height: 10),
              itemProfile('Phone', _phone, Icons.phone),
              const SizedBox(height: 10),
              itemProfile('Address', _address, Icons.location_on),
              const SizedBox(height: 10),
              itemProfile('Email', _email, Icons.email),
              const SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditviewProfilePage(
                        name: _name,
                        phone: _phone,
                        address: _address,
                        email: _email,
                        onProfileUpdated: (name, phone, address, email) {
                          setState(() {
                            _name = name;
                            _phone = phone;
                            _address = address;
                            _email = email;
                          });
                        },
                      ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Edit Profile'),
                ),    
              )
            ],
          ),
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.indigo.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 10
          )
        ]
      ),
      child: ListTile(
        title: Text(title),
        subtitle: TextFormField(
          initialValue: subtitle,
          readOnly: true, // Make it read-only
          decoration: InputDecoration(
            border: InputBorder.none, // Remove the border
          ),
        ),
        leading: Icon(icon),
        tileColor: Colors.white,
      ),
    );
  }
}

class EditviewProfilePage extends StatefulWidget {
  final String name;
  final String phone;
  final String address;
  final String email;
  final Function(String, String, String, String) onProfileUpdated;

  const EditviewProfilePage({
    required this.name,
    required this.phone,
    required this.address,
    required this.email,
    required this.onProfileUpdated,
  });

  @override
  _EditviewProfilePageState createState() => _EditviewProfilePageState();
}

class _EditviewProfilePageState extends State<EditviewProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _phoneController = TextEditingController(text: widget.phone);
    _addressController = TextEditingController(text: widget.address);
    _emailController = TextEditingController(text: widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
    
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onProfileUpdated(
                      _nameController.text,
                      _phoneController.text,
                      _addressController.text,
                      _emailController.text,
                    );
                    Navigator.pop(context);
                  },
                  child: Text('Save Changes'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}








// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class viewProfilePage extends StatefulWidget {
//   const viewProfilePage();

//   @override
//   _viewProfilePageState createState() => _viewProfilePageState();
// }

// class _viewProfilePageState extends State<viewProfilePage> {
//   String _userName = '';
//   String _userMobile = '';
//   String _usercity = '';
//   String _userEmail = '';

//   @override
//   void initState() {
//     super.initState();
//     // Fetch user details when the widget initializes
//     fetchUserDetails();
//   }

//   // Function to fetch user details from the API
//   Future<void> fetchUserDetails() async {
//     try {
//       final response = await http.post(Uri.parse('http://192.168.1.114:4040/userDetails'));
//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         setState(() {
//           _userName = jsonData['userName'];
//           _userMobile = jsonData['userMobile'];
//           _usercity = jsonData['usercity'];
//           _userEmail = jsonData['userEmail'];
//         });
//       } else {
//         throw Exception('Failed to load user details');
//       }
//     } catch (error) {
//       print('Error fetching user details: $error');
//       // Handle error appropriately, e.g., show a snackbar
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'PROFILE PAGE',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.indigo,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               const SizedBox(height: 40),
//               itemProfile('Name', _userName, Icons.person),
//               const SizedBox(height: 10),
//               itemProfile('Phone', _userMobile, Icons.phone),
//               const SizedBox(height: 10),
//               itemProfile('Address', _usercity, Icons.location_on),
//               const SizedBox(height: 10),
//               itemProfile('Email', _userEmail, Icons.email),
//               const SizedBox(height: 20,),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => EditviewProfilePage(
//                         name: _userName,
//                         phone: _userMobile,
//                         address: _usercity,
//                         email: _userEmail,
//                         onProfileUpdated: (name, phone, address, email) {
//                           setState(() {
//                             _userName = name;
//                             _userMobile = phone;
//                             _usercity = address;
//                             _userEmail = email;
//                           });
//                         },
//                       ),
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.all(15),
//                     backgroundColor: Colors.indigo,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   child: const Text('Edit Profile'),
//                 ),    
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget itemProfile(String title, String subtitle, IconData icon) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0, 5),
//             color: Colors.indigo.withOpacity(.2),
//             spreadRadius: 2,
//             blurRadius: 10
//           )
//         ]
//       ),
//       child: ListTile(
//         title: Text(title),
//         subtitle: TextFormField(
//           initialValue: subtitle,
//           readOnly: true, // Make it read-only
//           decoration: InputDecoration(
//             border: InputBorder.none, // Remove the border
//           ),
//         ),
//         leading: Icon(icon),
//         tileColor: Colors.white,
//       ),
//     );
//   }
// }

// class EditviewProfilePage extends StatefulWidget {
//   final String name;
//   final String phone;
//   final String address;
//   final String email;
//   final Function(String, String, String, String) onProfileUpdated;

//   const EditviewProfilePage({
//     required this.name,
//     required this.phone,
//     required this.address,
//     required this.email,
//     required this.onProfileUpdated,
//   });

//   @override
//   _EditviewProfilePageState createState() => _EditviewProfilePageState();
// }

// class _EditviewProfilePageState extends State<EditviewProfilePage> {
//   late TextEditingController _nameController;
//   late TextEditingController _phoneController;
//   late TextEditingController _addressController;
//   late TextEditingController _emailController;

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.name);
//     _phoneController = TextEditingController(text: widget.phone);
//     _addressController = TextEditingController(text: widget.address);
//     _emailController = TextEditingController(text: widget.email);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile',
//         style: TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.bold,
//         ),),
//         centerTitle: true,
//           backgroundColor: Colors.indigo,
//         ),
    
      
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _phoneController,
//                 decoration: InputDecoration(
//                   labelText: 'Phone',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _addressController,
//                 decoration: InputDecoration(
//                   labelText: 'Address',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     widget.onProfileUpdated(
//                       _nameController.text,
//                       _phoneController.text,
//                       _addressController.text,
//                       _emailController.text,
//                     );
//                     Navigator.pop(context);
//                   },
//                   child: Text('Save Changes'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.indigo,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _phoneController.dispose();
//     _addressController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }
// }






// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:plano/service.dart';

// class ViewProfilePage extends StatefulWidget {
//   const ViewProfilePage();

//   @override
//   _ViewProfilePageState createState() => _ViewProfilePageState();
// }

// class _ViewProfilePageState extends State<ViewProfilePage> {

//    late List <User> futureUsers;

//   @override
//   void initState() {
//     super.initState();
//     futureUsers = User.fetchAllUsers() as List<User>;
    
    
//   }

//   String _userName = '';
//   String _userMobile = '';
//   String _userCity = '';
//   String _userEmail = '';

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   // Fetch user details when the widget initializes
//   //   fetchUserDetails();
//   // }

//   // Function to fetch user details from the API
//   Future<void> fetchUserDetails() async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://10.0.2.2:4040/userDetails'),
//         // You may need to add headers or body parameters if required
//       );

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         setState(() {
//           _userName = jsonData['userName'];
//           _userMobile = jsonData['userMobile'];
//           _userCity = jsonData['userCity'];
//           _userEmail = jsonData['userEmail'];
//         });
//       } else {
//         throw Exception('Failed to load user details: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error fetching user details: $error');
//       // Handle error appropriately, e.g., show a snackbar
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'PROFILE PAGE',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.indigo,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               const SizedBox(height: 40),
//               itemProfile('Name', _userName, Icons.person),
//               const SizedBox(height: 10),
//               itemProfile('Phone', _userMobile, Icons.phone),
//               const SizedBox(height: 10),
//               itemProfile('Address', _userCity, Icons.location_on),
//               const SizedBox(height: 10),
//               itemProfile('Email', _userEmail, Icons.email),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => EditViewProfilePage(
//                           name: _userName,
//                           phone: _userMobile,
//                           address: _userCity,
//                           email: _userEmail,
//                           onProfileUpdated: (name, phone, address, email) {
//                             setState(() {
//                               _userName = name;
//                               _userMobile = phone;
//                               _userCity = address;
//                               _userEmail = email;
//                             });
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.all(15),
//                     backgroundColor: Colors.indigo,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                   child: const Text('Edit Profile'),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget itemProfile(String title, String subtitle, IconData icon) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0, 5),
//             color: Colors.indigo.withOpacity(.2),
//             spreadRadius: 2,
//             blurRadius: 10,
//           )
//         ],
//       ),
//       child: ListTile(
//         title: Text(title),
//         subtitle: TextFormField(
//           initialValue: subtitle,
//           readOnly: true, // Make it read-only
//           decoration: InputDecoration(
//             border: InputBorder.none, // Remove the border
//           ),
//         ),
//         leading: Icon(icon),
//         tileColor: Colors.white,
//       ),
//     );
//   }
// }

// class EditViewProfilePage extends StatefulWidget {
//   final String name;
//   final String phone;
//   final String address;
//   final String email;
//   final Function(String, String, String, String) onProfileUpdated;

//   const EditViewProfilePage({
//     required this.name,
//     required this.phone,
//     required this.address,
//     required this.email,
//     required this.onProfileUpdated,
//   });

//   @override
//   _EditViewProfilePageState createState() => _EditViewProfilePageState();
// }

// class _EditViewProfilePageState extends State<EditViewProfilePage> {
//   late TextEditingController _nameController;
//   late TextEditingController _phoneController;
//   late TextEditingController _addressController;
//   late TextEditingController _emailController;

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.name);
//     _phoneController = TextEditingController(text: widget.phone);
//     _addressController = TextEditingController(text: widget.address);
//     _emailController = TextEditingController(text: widget.email);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Edit Profile',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.indigo,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _phoneController,
//                 decoration: InputDecoration(
//                   labelText: 'Phone',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _addressController,
//                 decoration: InputDecoration(
//                   labelText: 'Address',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     widget.onProfileUpdated(
//                       _nameController.text,
//                       _phoneController.text,
//                       _addressController.text,
//                       _emailController.text,
//                     );
//                     Navigator.pop(context);
//                   },
//                   child: Text('Save Changes'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.indigo,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _phoneController.dispose();
//     _addressController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }
// }









// import 'package:flutter/material.dart';
// import 'package:plano/service.dart';

// class UserPage extends StatefulWidget {
//   UserPage(String userPosition);

//   @override
//   _UserPageState createState() => _UserPageState();
// }

// class _UserPageState extends State<UserPage> {
//   late Future<List<User>> futureUsers;

//   @override
//   void initState() {
//     super.initState();
//     futureUsers = User.fetchAllUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Details'),
//       ),
//       body: Center(
//         child: FutureBuilder<List<User>>(
//           future: futureUsers,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   User user = snapshot.data![index];
//                   // print(userPosition);
//                   return Card(
//                     child: ListTile(
//                       title: Text('Name: ${user.userName}'),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Email: ${user.userEmail}'),
//                           Text('Country: ${user.userCountry}'),
//                           Text('State: ${user.userState}'),
//                           Text('City: ${user.usercity}'),
//                           Text('Mobile: ${user.userMobile}'),
//                           Text('Gender: ${user.userGendar}'),
//                           Text('Position: ${user.userPosition}'),
//                           Text('Department: ${user.userDepartment}'),
//                           Text('Sub Department: ${user.userSubDepartment}'),
//                           Text('Address: ${user.userAddress}'),
//                           Text('Photo Link: ${user.userPhotoLink}'),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             } else if (snapshot.hasError) {
//               return Text('${snapshot.error}');
//             }
//             return CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }
// }