import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ono/documentscreen.dart';
import 'package:ono/morescreen.dart';
import 'package:video_player/video_player.dart';
import 'package:ono/login.dart';
import 'package:ono/quote.dart';
import 'package:ono/stat.dart';
import 'package:ono/bookmarks.dart';
import 'package:ono/draft.dart';
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
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 36,
                    backgroundImage: AssetImage('assets/dr.jpg'),
                    backgroundColor: Colors.red.shade900,
                  ),
                ),
              ),
              accountName: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
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
          ],
        ),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Container(
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           children: [
      //             SizedBox(height: 10),
      //             Image.asset(
      //               'assets/dr.jpg',
      //               height: 170,
      //               width: 170,
      //               fit: BoxFit.contain,
      //             ),
      //             SizedBox(
      //                 height:
      //                     10), // Add some space between the image and the text
      //             Text(
      //               'Dr Manoj Durairaj',
      //               textAlign: TextAlign.center, // Align the text to the center
      //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //             ),
      //             Text(
      //               'President',
      //               textAlign: TextAlign.center, // Align the text to the center
      //               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      //             ),
      //             Text(
      //               'Contact Information:',
      //               textAlign: TextAlign.center, // Align the text to the center
      //               style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      //             ),
      //             Text(
      //               'Marian Cardiac Centre and Research Foundation.',
      //               textAlign: TextAlign.center, // Align the text to the center
      //               style:
      //                   TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
      //             ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Container(
      //         padding: EdgeInsets.all(20),
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(10),
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.grey.withOpacity(0.5),
      //               spreadRadius: 5,
      //               blurRadius: 7,
      //               offset: Offset(0, 3),
      //             ),
      //           ],
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Container(
      //               width: 120,
      //               height: 120,
      //               alignment: Alignment.topCenter,
      //               decoration: BoxDecoration(
      //                 color: Colors.grey[200],
      //                 borderRadius: BorderRadius.circular(20),
      //                 boxShadow: [
      //                   BoxShadow(
      //                     color: Colors.grey.withOpacity(0.5),
      //                     spreadRadius: 2,
      //                     blurRadius: 5,
      //                     offset: Offset(0, 3),
      //                   ),
      //                 ],
      //               ),
      //               child: ClipRRect(
      //                 borderRadius: BorderRadius.circular(20),
      //                 child: Image.asset(
      //                   'assets/dr.jpg', // Replace 'your_image.jpg' with the actual image file name
      //                   fit: BoxFit.cover,
      //                   width: 120, // Adjust the width of the image
      //                   height: 120, // Adjust the height of the image
      //                 ),
      //               ),
      //             ),
      //             SizedBox(height: 10),
      //             Text(
      //               'Dr Manoj Durairaj',
      //               textAlign: TextAlign.center,
      //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //             ),
      //             Text(
      //               'President',
      //               textAlign: TextAlign.center,
      //               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      //             ),
      //             Text(
      //               'Contact Information:',
      //               textAlign: TextAlign.center,
      //               style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      //             ),
      //             Text(
      //               'Marian Cardiac Centre and Research Foundation.',
      //               textAlign: TextAlign.center,
      //               style:
      //                   TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
      //             ),
      //             SizedBox(height: 10),
      //             Image.asset(
      //               'assets/dr1.jpeg',
      //               height: 170,
      //               width: 170,
      //               fit: BoxFit.contain,
      //             ),
      //             SizedBox(
      //                 height:
      //                     10), // Add some space between the image and the text
      //             Text(
      //               'Dr C. S. Hiremath',
      //               textAlign: TextAlign.center, // Align the text to the center
      //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      //             ),
      //             Text(
      //               'Secretary',
      //               textAlign: TextAlign.center, // Align the text to the center
      //               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      //             ),
      //             Text(
      //               'Contact Information:',
      //               textAlign: TextAlign.center, // Align the text to the center
      //               style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      //             ),
      //             Text(
      //               'Director Heart valve Bank and Academics CTVS',
      //               textAlign: TextAlign.center, // Align the text to the center
      //               style:
      //                   TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
      //             ),
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

            // SizedBox(height: 10),
            // Image.asset(
            //   'assets/dr2.jpg',
            //   height: 170,
            //   width: 170,
            //   fit: BoxFit.contain,
            // ),
            // SizedBox(
            //     height:
            //         10), // Add some space between the image and the text
            // Text(
            //   'Dr Satyajit Bose',
            //   textAlign: TextAlign.center, // Align the text to the center
            //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            // ),
            // Text(
            //   'Junior Vice President',
            //   textAlign: TextAlign.center, // Align the text to the center
            //   style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            // ),
            // Text(
            //   'Contact Information:',
            //   textAlign: TextAlign.center, // Align the text to the center
            //   style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            // ),
            // Text(
            //   'chairman, The Mission Hospital.',
            //   textAlign: TextAlign.center, // Align the text to the center
            //   style:
            //       TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
            _buildSession(
              'Session 2 : VALVULAR HEART DISEASE',
              'Chairpersons: Dr Dharmender Srivastava, Dr Vijayant Devenraj , Dr Sandeep Singh, Dr Neerav Bansal, Dr Raja Lahiri, Dr Chandrabhanu Parija',
              'Panelists: Dr Amarjyoti Rai Baruah, Dr Sanjeev Malhotra, Dr Bhupen Kumar, Dr Vinay Krishna',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'TABLE TITLE',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _buildTable(
                    [
                      ['TIME', 'SESSION', 'SPEAKERS'],
                      [
                        '11:50-12:05pm',
                        'Mechanical versus tissue valve: Current guidelines',
                        'Dr Sanjay Theodore'
                      ],
                      [
                        '12:05-12:20pm',
                        'Mitral valve repair: Tips and tricks',
                        'Dr V Devagourou'
                      ],
                      [
                        '12:20-12:35pm',
                        'Sutureless aortic valve- Current Status',
                        'Dr Ajeet Bana'
                      ],
                      [
                        '12:35-12:50pm',
                        'Biological Valve for AVR in young patients',
                        'Dr Jacob Jamesraj'
                      ],
                      [
                        '12:50-1:05pm',
                        'Ischemic MR - Repair or replace',
                        'Dr Prasanna Simha'
                      ],
                      [
                        '1:05-1:20 pm',
                        'Tricuspid valve repair - Current guidelines',
                        'Dr Shantanu Pande'
                      ],
                      [
                        '1:20-1:40pm',
                        'Redo Valve replacement - Tips and tricks',
                        'Dr Sujay Shad'
                      ],
                      ['1:40-2:10pm', 'DISCUSSION', ''],
                      ['2:10 - 3:00pm', 'LUNCH BREAK', '']
                    ],
                  ),
                ],
              ),
            ),
            _buildSession(
              'Session 3 : AORTIC SURGERY',
              'Chairpersons: Dr S K Sinha, Dr Anbarasu Mohanraj, Dr Anubhab Gupta, Dr Udgeath Dhir, Dr Biju Shivam Pillai, Dr Kaushik Mukherjee',
              'Panelists: Dr Manuj Saikia, Dr Shiva Muthukumar, Dr Dinesh Mittal, Dr Vivek Kanhare',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'TABLE TITLE',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _buildTable(
                    [
                      ['TIME', 'SESSION', 'SPEAKERS'],
                      [
                        '3:00-3:15pm',
                        "An expert's guide for surgical strategies in acute aortic dissection",
                        'Dr Anil Bhan'
                      ],
                      [
                        '3:15-3:30pm',
                        'Brain protection strategies in aortic arch surgery',
                        'Dr M M Yusuf'
                      ],
                      [
                        '3:30-3:45pm',
                        'Aortic root enlargement-Indications and techniques',
                        'Dr Vivek V Pillai'
                      ],
                      [
                        '3:45 - 4:00pm',
                        'Hybrid treatment for arch aneurysm',
                        'Dr V V Bashi'
                      ],
                      [
                        '4:00-4:15pm',
                        'TEVAR - A surgeon\'s view',
                        'Dr Ajay Kaul'
                      ],
                      [
                        '4:15-4:30pm',
                        'Bentall procedure - An expert\'s guide to achieve good results',
                        'Dr Zainulabedin Hamdulay'
                      ],
                      ['4:30-5:00pm', 'DISCUSSION', ''],
                      ['5:00-5:30pm', 'TEA BREAK', '']
                    ],
                  ),
                ],
              ),
            ),
            _buildSession(
              'Session 4 : HEART FAILURE / TRANSPLANT /LVAD',
              'Chairpersons:Dr Manoj Durairaj, Dr Nagesh Aysola, Dr Colonel Samir, Dr Lalit Kapur, Dr Naveen Saraf, Dr Julius Punnen',
              'Panelists:Dr Manoj Luthra, Dr Jose Chako Pariapuram, Dr Murtaza Chisti, Dr Sujay Shad',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'TABLE TITLE',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _buildTable(
                    [
                      ['TIME', 'SESSION', 'SPEAKERS'],
                      [
                        '5:30-5:45pm',
                        'Heart transplant in India - current status',
                        'Dr KR Balakrishnan'
                      ],
                      [
                        '5:45-6:00pm',
                        'Durable VADs - Selection of patients and results',
                        'Dr Sandeep Attawar'
                      ],
                      [
                        '6:00-6:15pm',
                        'Medical management of heart failure',
                        'Dr Balbir Singh'
                      ],
                      [
                        '6:15-6:30pm',
                        'Atrial fibrillation - indications & techniques of ablation',
                        'Dr S S Lochab'
                      ],
                      [
                        '6:30-6:45pm',
                        'Surgical treatment of HOCM - Current guidelines and techniques',
                        'Dr Praveen K Varma'
                      ],
                      [
                        '6:45-7:00pm',
                        'Long term care after heart transplant',
                        'Dr Dhiren Shah'
                      ],
                      ['7:00-7:15pm', 'Short Term VADs', 'Dr Manoj Durairaj'],
                      ['7:15-7:45pm', 'DISCUSSION', ''],
                      ['8:00 - 11:00pm', 'COCKTAIL DINNER', '']
                    ],
                  ),
                ],
              ),
            ),
            _buildSession(
              'Session 5 : MINIMALLY INVASIVE CARDIAC SURGERY',
              'Chairpersons: Dr Ravi Singh, Dr Lalit Malik, Dr Akhil Kumar Govil, Dr Rajesh Kaushish, Dr Anil Aggarwal, Dr Saurav Jaiswal',
              'Panelists: Dr Narender Jhajharia, Dr Sarju Ralhan, Dr Arul Furtado, Dr Ratna Malika',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'TABLE TITLE',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _buildTable(
                    [
                      ['TIME', 'SESSION', 'SPEAKERS'],
                      [
                        '9:00-9:15am',
                        'Mini AVR strategies & outcome',
                        'Dr Brij Mohan'
                      ],
                      [
                        '9:15-9:30am',
                        'Mini MVR strategies & outcome',
                        'Dr Yugal Kumar Mishra'
                      ],
                      [
                        '9:30-09:45am',
                        'Minimally invasive CABG',
                        'Dr Rajneesh Malhotra'
                      ],
                      [
                        '09:45-10:00am',
                        'How I do it - starting a MICS program',
                        'Dr Chirag Doshi'
                      ],
                      [
                        '10:00-10:15am',
                        'Endoscopic vessel harvesting',
                        'Dr Arul Furtado'
                      ],
                      ['10:15-10:45am', 'DISCUSSION', ''],
                      ['10:45 - 11:00am', 'TEA BREAK', '']
                    ],
                  ),
                ],
              ),
            ),
            _buildSession(
              'Session 6 : Congenital Heart Disease',
              'Chairpersons: Dr Raja Joshi, Dr Aseem Srivastava, Dr Saket Aggarwal, Dr K S Dagar',
              'Panelists: Dr Sachin Talwar, Dr Jothi Muthu, Dr Himanshu Pratap Dr Ganapathy Subramaniam',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'TABLE TITLE',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _buildTable(
                    [
                      ['TIME', 'SESSION', 'SPEAKERS'],
                      [
                        '11:00-11:15 am',
                        'Cosmetic approaches to repair of simple CHD',
                        'Dr Praveen Reddy'
                      ],
                      [
                        '11:15-11:30am',
                        'Safe sternal re-entry in redo CHD surgery',
                        'Dr B R Jagan Nath'
                      ],
                      [
                        '11:30-11:45am',
                        'Corrective surgery for Tetralogy of Fallot- Achieving the ideal repair',
                        'Dr Raja Joshi'
                      ],
                      [
                        '11:45-12:00',
                        'BT shunt – still relevant?',
                        'Dr C S Hiremath'
                      ],
                      [
                        '12:00-12:15pm',
                        'Ventricular septal defects – surgical approaches for optimal closure',
                        'Dr Sunil Kaushal'
                      ],
                      [
                        '12:15-12:30pm',
                        'Repair of atrio-ventricular septal defect – single patch vs two patches',
                        'Dr K S Iyer'
                      ],
                      [
                        '12:30-12:45pm',
                        'The arterial switch operation- steps to perfection',
                        'Dr Sachin Talwar'
                      ],
                      ['12:45-1:15pm', 'DISCUSSION', ''],
                      ['01:15 - 2:15pm', 'LUNCH BREAK', '']
                    ],
                  ),
                ],
              ),
            ),
            _buildSession(
              'Session 7 : HOW I DO IT ?',
              'Chairpersons: Dr Adarsh Koppula, Dr Neeraj Singh Chandel, Dr Vijay Gupta, Col Dr M V Kalmath',
              'Panelists: Dr S N Khanna, Dr GK Mani, Dr Rahul Chandola, Dr Anup K Ganjoo',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'TABLE TITLE',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _buildTable(
                    [
                      ['TIME', 'SESSION', 'SPEAKERS'],
                      [
                        '2:15-2:30pm',
                        'Tricuspid Valve Repair- Techniques',
                        'Dr Amit Chandra'
                      ],
                      [
                        '2:30-2:45pm',
                        'Thoracotomy Approach to Aortic Valve Replacement',
                        'Dr Amol Mathew'
                      ],
                      [
                        '2:45-3:00pm',
                        'Radial artery harvesting',
                        'Dr Madhu Shrivastava'
                      ],
                      [
                        '3:00-3:15pm',
                        'Conduit Selection in CABG',
                        'Dr Gokul Reddy'
                      ],
                      [
                        '3:15-3:30pm',
                        'How I repair a thoracic aneurysm',
                        'Dr Hemant Pathare'
                      ],
                      [
                        '3:30-3:45pm',
                        'Minimally invasive ASD closure -Simplified',
                        'Dr Neeraj Nishchal'
                      ],
                      [
                        '3:45-4:00pm',
                        'Techniques of the modified Bentall operation',
                        'Dr Satish Mathew'
                      ],
                      ['4:00-4:30pm', 'DISCUSSION', ''],
                      ['4:30-5:00pm', 'TEA BREAK', '']
                    ],
                  ),
                ],
              ),
            ),
            _buildSession(
              'Session 8 : EACTS UNIVERSITY COURSE',
              'Chairpersons: Dr Peter Skillington, Dr Thouraya Hamdi, Dr Hilary Sanfey, Dr M A A Badawi, Dr Vishal Rao, Dr Rupak Singla',
              'Panelists: Dr Sudhansu Bhattacharya, Dr Ajay Savlania, Dr K Sateesh Kumar, Dr Sanjivani S Deshmukh',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'TABLE TITLE',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _buildTable(
                    [
                      ['TIME', 'SESSION', 'SPEAKERS'],
                      [
                        '5:00-5:15pm',
                        'Minimal invasive mitral valve repair - How to start?',
                        'Dr Ulrich Rosendahl'
                      ],
                      [
                        '5:15-5:30pm',
                        'Conduit selection for the right ventricular outflow tract reconstruction',
                        'Dr Victor Tsang'
                      ],
                      [
                        '5:30-5:45pm',
                        'Technical nuances of the Ross procedure',
                        'Dr Pedro del Nido'
                      ],
                      [
                        '5:45-6:00pm',
                        'How to safely dissect a left atrium in minimal invasive mitral valve surgery',
                        'Dr Alain Berrebi'
                      ],
                      [
                        '6:00-6:15pm',
                        'Technical tips for minimally invasive repair of Barlow’s disease',
                        'Dr Joerg Seeburger'
                      ],
                      ['6:15-6:30pm', 'DISCUSSION', ''],
                    ],
                  ),
                ],
              ),
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
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildSession(
      String title, String chairpersons, String panelists, Widget table) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            chairpersons,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            panelists,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 10.0),
          table,
        ],
      ),
    );
  }

  Widget _buildTable(List<List<String>> data) {
    return Table(
      border: TableBorder.all(color: Colors.black),
      children: [
        for (final row in data)
          TableRow(
            children: [
              for (final cell in row)
                Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Text(
                    cell,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
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
