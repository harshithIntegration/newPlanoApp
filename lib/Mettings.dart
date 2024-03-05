import 'package:flutter/material.dart';

class Mettingpage extends StatefulWidget {
  const Mettingpage({Key? key}) : super(key: key);

  @override
  State<Mettingpage> createState() => _MettingpageState();
}

class _MettingpageState extends State<Mettingpage> {
  Widget quoteTemplate(Quote quote) {
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
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Mettings'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
    );
  }
}

class Quote {
  String text;
  String author;

  Quote({required this.text, required this.author});
}
