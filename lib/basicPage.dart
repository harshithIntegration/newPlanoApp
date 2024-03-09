import 'package:flutter/material.dart';
import 'package:ono/service.dart';

class UserPage extends StatefulWidget {
  UserPage();

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = User.fetchAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(239, 173, 7, 7),
        title: Text(
          'User Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: futureUsers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  User user = snapshot.data![index];
                  // print(userPosition);
                  return Card(
                    child: ListTile(
                      title: Text('Name: ${user.userName}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email: ${user.userEmail}'),
                          Text('Country: ${user.userCountry}'),
                          Text('State: ${user.userState}'),
                          Text('City: ${user.userCity}'),
                          Text('Mobile: ${user.userMobile}'),
                          Text('Gender: ${user.userGender}'),
                          Text('Position: ${user.userPosition}'),
                          Text('Department: ${user.userDepartment}'),
                          Text('Sub Department: ${user.userSubDepartment}'),
                          Text('Address: ${user.userAddress}'),
                          Text('Photo Link: ${user.userPhotoLink}'),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
