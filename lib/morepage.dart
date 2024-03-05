import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  }

  void _navigateToDocumentPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DocumentScreen()),
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
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                ),
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  ItemDashboard(
                      'About Us', CupertinoIcons.phone, Colors.deepOrange),
                  ItemDashboard(
                      'Commitee', CupertinoIcons.graph_circle, Colors.green),
                  ItemDashboard(
                      'Speakers', CupertinoIcons.person_2, Colors.purple),
                  ItemDashboard('MOM', CupertinoIcons.time_solid, Colors.brown),
                  ItemDashboard(
                      'Venue', CupertinoIcons.location_solid, Colors.indigo),
                  ItemDashboard(
                      'Delegates', CupertinoIcons.person_3_fill, Colors.teal),
                  ItemDashboard('Exhibitors', CupertinoIcons.question_circle,
                      Colors.blue),
                  ItemDashboard(
                      'Documents', CupertinoIcons.folder, Colors.redAccent),
                  ItemDashboard(
                      'Feedback', CupertinoIcons.phone, Colors.black54),
                  ItemDashboard('Contact Us', CupertinoIcons.profile_circled,
                      Colors.deepPurple),
                  ItemDashboard(
                      'E-Badge', CupertinoIcons.app_badge, Colors.blueGrey),
                  ItemDashboard('Mettings', CupertinoIcons.person_3_fill,
                      Colors.lightGreenAccent),
                  ItemDashboard(
                      'Login', CupertinoIcons.plus_app, Colors.purpleAccent),
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
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ItemDashboard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color background;

  const ItemDashboard(this.title, this.iconData, this.background, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
