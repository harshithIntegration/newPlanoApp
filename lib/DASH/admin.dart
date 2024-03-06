import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ono/DASH/view.dart';
import 'package:ono/DASH/dashboard.dart';
import 'package:ono/DASH/morescreen.dart';
import 'package:ono/DASH/documentscreen.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({Key? key}) : super(key: key);

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        _navigateToMoreScreen(context);
      }
    });
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        _navigateTodashboard(context);
      }
    });
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        _navigateToDocumentScreen(context);
      }
    });
  }

  void _navigateTodashboard(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => dashboard()),
    );
  }

  void _navigateToMoreScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MoreScreen()),
    );
  }

  void _navigateToDocumentScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DocumentScreen()),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          SizedBox(height: 50),
          Container(
            color: Colors.red.shade900,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 1,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                childAspectRatio: 1.8,
                children: [
                  ItemDashboard(
                    title: 'VIEW',
                    iconData: CupertinoIcons.viewfinder,
                    background: Colors.blueAccent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Viewpage()),
                      );
                    },
                  ),
                  ItemDashboard(
                    title: 'NEW USER',
                    iconData: CupertinoIcons.plus_app,
                    background: Colors.green,
                    onTap: () {},
                  ),
                  ItemDashboard(
                    title: 'SESSIONS',
                    iconData: CupertinoIcons.timelapse,
                    background: Colors.purple,
                    onTap: () {},
                  ),
                  ItemDashboard(
                    title: 'DOCUMENTS',
                    iconData: CupertinoIcons.folder_circle_fill,
                    background: Colors.pinkAccent,
                    onTap: () {},
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
        selectedItemColor: Colors.red.shade900,
        unselectedItemColor: Colors.red.shade900,
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
