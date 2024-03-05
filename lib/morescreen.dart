import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ono/AboutUsScreen.dart';
import 'package:ono/Commitee.dart';
import 'package:ono/Contact.dart';
import 'package:ono/Delegates.dart';
import 'package:ono/Document.dart';
import 'package:ono/Ebadge.dart';
import 'package:ono/Exhibitors.dart';
import 'package:ono/Feedback.dart';
import 'package:ono/Mettings.dart';
import 'package:ono/Mom.dart';
import 'package:ono/Speakers.dart';
import 'package:ono/Venue.dart';
import 'package:ono/basicPage.dart';
import 'package:ono/documentscreen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);
  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        _navigateToDocumentPage(context);
      }
    });
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        _navigateToMorePage(context);
      }
    });
  }

  void _navigateToDocumentPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DocumentScreen()),
    );
  }

  void _navigateToMorePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MoreScreen()),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('More'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Container(
            color: Colors.red,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  ItemDashboard(
                    title: 'About Us',
                    iconData: CupertinoIcons.phone,
                    background: Colors.blueAccent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUspage()),
                      );
                    },
                  ),
                  ItemDashboard(
                    title: 'Commitee',
                    iconData: CupertinoIcons.person_2_fill,
                    background: Colors.green,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserPage()),
                      );
                    },
                  ),
                  ItemDashboard(
                    title: 'Speakers',
                    iconData: CupertinoIcons.person_2,
                    background: Colors.purple,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserPage()),
                      );
                    },
                  ),
                  ItemDashboard(
                    title: 'Venue',
                    iconData: CupertinoIcons.location_solid,
                    background: Colors.brown,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Venuepage()),
                      );
                    },
                  ),
                  ItemDashboard(
                    title: 'MOM',
                    iconData: CupertinoIcons.time_solid,
                    background: Colors.indigo,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Mompage()),
                      );
                    },
                  ),
                  ItemDashboard(
                    title: 'Delegates',
                    iconData: CupertinoIcons.person_3_fill,
                    background: Colors.teal,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserPage()),
                      );
                    },
                  ),
                  ItemDashboard(
                    title: 'Exhibitors',
                    iconData: CupertinoIcons.question_circle,
                    background: Colors.black45,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserPage()),
                      );
                    },
                  ),
                  ItemDashboard(
                    title: 'Document',
                    iconData: CupertinoIcons.folder,
                    background: Colors.deepPurpleAccent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Documentpage()),
                      );
                    },
                  ),
                  ItemDashboard(
                    title: 'Feedback',
                    iconData: CupertinoIcons.phone_badge_plus,
                    background: Colors.pinkAccent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Feedbackpage()),
                      );
                    },
                  ),
                  ItemDashboard(
                    title: 'Contact Us',
                    iconData: CupertinoIcons.profile_circled,
                    background: Colors.deepOrange,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Contactpage()),
                      );
                    },
                  ),
                  ItemDashboard(
                    title: 'E-Badge',
                    iconData: CupertinoIcons.app_badge,
                    background: Colors.blueGrey,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ebadgepage()),
                      );
                    },
                  ),
                  ItemDashboard(
                    title: 'Mettings',
                    iconData: CupertinoIcons.person_3_fill,
                    background: Colors.yellow,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Mettingpage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
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
}

class ItemDashboard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color background;
  final Function onTap; // Callback function to handle onTap event

  const ItemDashboard({
    required this.title,
    required this.iconData,
    required this.background,
    required this.onTap, // Added onTap parameter
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(); // Invoke the onTap callback when the item is tapped
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 5),
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(title.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
