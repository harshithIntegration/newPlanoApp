import 'package:flutter/material.dart';

// class Documentpage extends StatefulWidget {
//   const Documentpage({Key? key}) : super(key: key);

//   @override
//   State<Documentpage> createState() => _DocumentpageState();
// }

// class _DocumentpageState extends State<Documentpage> {
//   Widget quoteTemplate(quote) {
//     return Card(
//       margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Text(
//               quote.text,
//               style: TextStyle(
//                 fontSize: 18.0,
//                 color: Colors.grey[800],
//               ),
//             ),
//             SizedBox(
//               height: 6.0,
//             ),
//             Text(
//               quote.author,
//               style: TextStyle(
//                 fontSize: 14.0,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: Text(
//           'Documents',
//           style: TextStyle(
//             color: Colors.white, // Change the text color here
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.red.shade900,
//       ),
//     );
//   }
// }

class Documentpage extends StatefulWidget {
  const Documentpage({Key? key}) : super(key: key);

  @override
  State<Documentpage> createState() => _DocumentpageState();
}

class _DocumentpageState extends State<Documentpage> {
  Widget quoteTemplate(quote) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              quote.author,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Documents',
          style: TextStyle(
            color: Colors.white, // Change the text color here
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Add PDF',
            style: TextStyle(
              color: Colors.red.shade900,
            ),
          ),
        ),
      ),
    );
  }
}
