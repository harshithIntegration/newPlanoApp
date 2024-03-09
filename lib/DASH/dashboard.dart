// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ono/DASH/admin.dart';
import 'package:ono/DASH/documentscreen.dart';
import 'package:ono/DASH/morescreen.dart';
import 'package:ono/viewProfilePage.dart';
import 'package:video_player/video_player.dart';
import 'package:ono/login.dart';
import 'package:ono/DASH/quote.dart';
import 'package:ono/DASH/stat.dart';
import 'package:ono/DASH/bookmarks.dart';
import 'package:ono/DASH/draft.dart';
import 'package:ono/settings.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const dashboard());
}

class dashboard extends StatelessWidget {
  const dashboard({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late VideoPlayerController _controller;

  void _navigateToMorePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MoreScreen()),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        _navigateToMorePage(context);
      }
    });
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        _navigateToDocumentPage(context);
      }
    });
  }

  void _navigateToDocumentPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DocumentScreen()),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/p.jpeg',
              height: 50,
              width: 50,
              fit: BoxFit.contain,
            ),
            // SizedBox(width: 0), // Add some space between the image and text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Indian Association of',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Cardiovascular-Thoracic Surgeons',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red.shade900,
              ),
              currentAccountPicture: CircleAvatar(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => viewProfilePage()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('assets/icons/Quantum_Logo.png'),
                    // backgroundColor: Colors.white,
                  ),
                ),
              ),
              accountName: Text(
                'Quantum Paradigm',
                style: TextStyle(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              accountEmail: null,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Messagepage()));
                  },
                  child: Row(
                    // Wrap Text with Row to include an Icon
                    children: [
                      const Icon(
                        Icons.message, // Add your desired icon
                        color: Color.fromARGB(
                            255, 53, 52, 52), // Set the icon color
                        size: 25, // Set the icon size
                      ),
                      const SizedBox(
                          width: 14.5), // Add space between icon and text
                      const Text(
                        'Messages',
                        style: TextStyle(
                          color: Color.fromARGB(255, 58, 55, 55),
                          fontSize: 17.5,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Statpage()));
                  },
                  child: Row(
                    // Wrap Text with Row to include an Icon
                    children: [
                      const Icon(
                        Icons.content_paste, // Add your desired icon
                        color: Color.fromARGB(
                            255, 53, 52, 52), // Set the icon color
                        size: 25, // Set the icon size
                      ),
                      const SizedBox(
                          width: 14.5), // Add space between icon and text
                      const Text(
                        'Contents & Stats',
                        style: TextStyle(
                          color: Color.fromARGB(255, 58, 55, 55),
                          fontSize: 17.5,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Bookmarkspage()));
                  },
                  child: Row(
                    // Wrap Text with Row to include an Icon
                    children: [
                      const Icon(
                        Icons.bookmark, // Add your desired icon
                        color: Color.fromARGB(
                            255, 53, 52, 52), // Set the icon color
                        size: 25, // Set the icon size
                      ),
                      const SizedBox(
                          width: 14.5), // Add space between icon and text
                      const Text(
                        'Bookmarks',
                        style: TextStyle(
                          color: Color.fromARGB(255, 58, 55, 55),
                          fontSize: 17.5,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Draftpage()));
                  },
                  child: Row(
                    // Wrap Text with Row to include an Icon
                    children: [
                      const Icon(
                        Icons.drafts, // Add your desired icon
                        color: Color.fromARGB(
                            255, 53, 52, 52), // Set the icon color
                        size: 25, // Set the icon size
                      ),
                      const SizedBox(
                          width: 14.5), // Add space between icon and text
                      const Text(
                        'Drafts',
                        style: TextStyle(
                          color: Color.fromARGB(255, 58, 55, 55),
                          fontSize: 17.5,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Row(
                    // Wrap Text with Row to include an Icon
                    children: [
                      const Icon(
                        Icons.person, // Add your desired icon
                        color: Color.fromARGB(
                            255, 53, 52, 52), // Set the icon color
                        size: 30, // Set the icon size
                      ),
                      const SizedBox(
                          width: 14.5), // Add space between icon and text
                      const Text(
                        'Login',
                        style: TextStyle(
                          color: Color.fromARGB(255, 58, 55, 55),
                          fontSize: 17.5,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Settingspage()));
                  },
                  child: Row(
                    // Wrap Text with Row to include an Icon
                    children: [
                      const Icon(
                        Icons.settings, // Add your desired icon
                        color: Color.fromARGB(
                            255, 53, 52, 52), // Set the icon color
                        size: 25, // Set the icon size
                      ),
                      const SizedBox(
                          width: 14.5), // Add space between icon and text
                      const Text(
                        'Settings',
                        style: TextStyle(
                          color: Color.fromARGB(255, 58, 55, 55),
                          fontSize: 17.5,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Adminpage()));
                  },
                  child: Row(
                    // Wrap Text with Row to include an Icon
                    children: [
                      const Icon(
                        Icons.admin_panel_settings, // Add your desired icon
                        color: Color.fromARGB(
                            255, 53, 52, 52), // Set the icon color
                        size: 25, // Set the icon size
                      ),
                      const SizedBox(
                          width: 14.5), // Add space between icon and text
                      const Text(
                        'Admin',
                        style: TextStyle(
                          color: Color.fromARGB(255, 58, 55, 55),
                          fontSize: 17.5,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32.0),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/dr.jpg',
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Dr Manoj Durairaj',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'President',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Contact Information:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Marian Cardiac Centre and Research Foundation.',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Add some space between containers
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/dr1.jpeg',
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Dr C. S. Hiremath',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Secretary',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Contact Information:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Director Heart valve Bank and Academics CTVS',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Add some space between containers
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/dr2.jpg',
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Dr Satyajit Bose',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Junior Vice President',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Contact Information:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Director Heart valve Bank and Academics CTVS',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Session 1 : VALVULAR HEART DISEASE',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                _buildTable(),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Session 2 : AORTIC SURGERY',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                _buildTable2(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Documents',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red.shade900,
        unselectedItemColor: Colors.red.shade900,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildTable() {
    return Table(
      border: TableBorder.all(),
      columnWidths: {
        0: FractionColumnWidth(0.35),
        1: FractionColumnWidth(0.35),
        2: FractionColumnWidth(0.30),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.white),
          children: [
            _buildTableCell('TIME', isHeader: true),
            _buildTableCell('SESSION', isHeader: true),
            _buildTableCell('SPEAKERS', isHeader: true),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('11:50-12:05pm'),
            _buildTableCell(
                'Mechanical versus tissue valve: Current guidelines'),
            _buildTableCell('Dr Sanjay Theodore'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('12:05-12:20pm'),
            _buildTableCell('Mitral valve repair: Tips and tricks'),
            _buildTableCell('Dr V Devagourou'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('12:20-12:35pm'),
            _buildTableCell('Sutureless aortic valve- Current Status'),
            _buildTableCell('Dr Ajeet Bana'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('12:35-12:50pm'),
            _buildTableCell('Biological Valve for AVR in young patients'),
            _buildTableCell('Dr Jacob Jamesraj'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('12:50-1:05pm'),
            _buildTableCell('Ischemic MR - Repair or replace'),
            _buildTableCell('Dr Prasanna Simha'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('1:05-1:20 pm'),
            _buildTableCell('Tricuspid valve repair - Current guidelines'),
            _buildTableCell('Dr Shantanu Pande'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('1:20-1:40pm'),
            _buildTableCell('Redo Valve replacement - Tips and tricks'),
            _buildTableCell('Dr Sujay Shad'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('1:40-2:10pm'),
            _buildTableCell('DISCUSSION'),
            _buildTableCell(''),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('2:10 - 3:00pm'),
            _buildTableCell('LUNCH BREAK'),
            _buildTableCell(''),
          ],
        ),
      ],
    );
  }

  Widget _buildTable2() {
    return Table(
      border: TableBorder.all(),
      columnWidths: {
        0: FractionColumnWidth(0.35),
        1: FractionColumnWidth(0.35),
        2: FractionColumnWidth(0.30),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.white),
          children: [
            _buildTableCell('TIME', isHeader: true),
            _buildTableCell('SESSION', isHeader: true),
            _buildTableCell('SPEAKERS', isHeader: true),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('3:00-3:15pm'),
            _buildTableCell('Aortic Valve Replacement: Surgical Techniques'),
            _buildTableCell('Dr John Smith'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('2:15-2:30pm'),
            _buildTableCell('Complications in Aortic Surgery: Management'),
            _buildTableCell('Dr Emily Johnson'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('2:15-2:30pm'),
            _buildTableCell('Complications in Aortic Surgery: Management'),
            _buildTableCell('Dr Emily Johnson'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('2:15-2:30pm'),
            _buildTableCell('Complications in Aortic Surgery: Management'),
            _buildTableCell('Dr Emily Johnson'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('2:15-2:30pm'),
            _buildTableCell('Complications in Aortic Surgery: Management'),
            _buildTableCell('Dr Emily Johnson'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('2:15-2:30pm'),
            _buildTableCell('Complications in Aortic Surgery: Management'),
            _buildTableCell('Dr Emily Johnson'),
          ],
        ),
        TableRow(
          children: [
            _buildTableCell('2:15-2:30pm'),
            _buildTableCell('Complications in Aortic Surgery: Management'),
            _buildTableCell('Dr Emily Johnson'),
          ],
        ),
      ],
    );
  }
}

Widget _buildTableCell(String text, {bool isHeader = false}) {
  return Container(
    padding: EdgeInsets.all(10),
    color: isHeader ? Colors.red[100] : Colors.white,
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: isHeader ? 16 : 14,
        fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
      ),
    ),
  );
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}
