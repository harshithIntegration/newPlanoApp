// import 'package:flutter/material.dart';

// class DocumentScreen extends StatefulWidget {
//   const DocumentScreen({Key? key}) : super(key: key);
//   @override
//   State<DocumentScreen> createState() => _DocumentScreenState();
// }

// class _DocumentScreenState extends State<DocumentScreen> {
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: const Text('Documents'),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(0),
//         children: [
//           Container(
//             color: Colors.red,
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 30),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(200),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20)
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.more_horiz),
//             label: 'More',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.description),
//             label: 'Documents',
//           ),
//         ],
//         // currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         // onTap: _onItemTapped,
//       ),
//     );
//   }
// }

// class ItemDashboard extends StatelessWidget {
//   final String title;
//   final IconData iconData;
//   final Color background;

//   const ItemDashboard(this.title, this.iconData, this.background, {Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: const [
//           BoxShadow(
//             offset: Offset(0, 5),
//             color: Colors.black12,
//             spreadRadius: 2,
//             blurRadius: 5,
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: background,
//               shape: BoxShape.circle,
//             ),
//             child: Icon(iconData, color: Colors.white),
//           ),
//           const SizedBox(height: 8),
//           Text(title.toUpperCase(),
//               style: Theme.of(context).textTheme.titleMedium),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:ono/morepage.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({Key? key}) : super(key: key);
  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        _navigateToMorePage(context);
      }
    });
    // setState(() {
    //   _selectedIndex = index;
    //   if (_selectedIndex == 2) {
    //     _navigateToDocumentPage(context);
    //   }
    // });
  }

  // void _navigateToDocumentPage(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => DocumentScreen()),
  //   );
  // }

  void _navigateToMorePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MoreScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Documents'),
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                ),
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
