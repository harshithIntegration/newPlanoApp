import 'package:flutter/material.dart';

class AboutUspage extends StatefulWidget {
  const AboutUspage({Key? key}) : super(key: key);

  @override
  State<AboutUspage> createState() => _AboutUspageState();
}

class _AboutUspageState extends State<AboutUspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 180, // Adjust the height of the image
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/blur.jpeg'), // Replace this with your image path
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  const Text(
                    'WELCOME TO IACTSCON 2024',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    '',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    'It\'s my great pleasure & privilege to welcome you to the 70th Annual Conference of Cardiovascular & Thoracic Surgeons IACTSCON-2024 to be held at Hotel MayFair Lagoon & Convention, Bhubaneswar. Bhubaneswar, the capital city of Odisha, is famously known as Temple City, and has recently been crowned as the Sports Capital of India. The City and the state are going to host the IACTSCON for the first time and our aim is to give all of you a memory for a lifetime. Odisha - rich in its heritage & biodiversity is waiting to unfold its best-kept secret on your visit to IACTSCON 2024. Bhubaneswar - Part of the golden triangle, also known as Ekamrakshetra, is gearing up to present before you an academic extravaganza and we will be pampering you with local delicacies and complimentary sightseeing. We are preparing ourselves to welcome you with your family and facilitate your journey to World-famous heritage and religious monuments like Jagannath Temple at Puri, Sun Temple at Konark, Lingaraj & thousand other temples in and around Bhubaneswar, not to forget Khandagiri & Udayagiri Caves. To ensure maximum participation and academic interest amongst the diverse range of members - right from students to junior surgeons to senior consultants, we are initiating a feedback system to help construct our program menu so that everyone has an academic, visual, and gastronomical treat. Leaving no stone unturned, we eagerly look forward to welcoming you to four days of scientific knowledge sharing and reconnect with the fraternity.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    // backgroundColor: Colors.grey[200],
    appBar: AppBar(
      title: Text(
        'About Us',
        style: TextStyle(
          color: Colors.white, // Change the text color here
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.red.shade900,
    ),
  );
}
