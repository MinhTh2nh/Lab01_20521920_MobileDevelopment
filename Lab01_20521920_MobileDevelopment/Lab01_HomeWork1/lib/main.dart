import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomeWork 1',
      home: Scaffold(
        body: ProfileScreen(),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Image
          Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Image(
              image: NetworkImage('https://static.vecteezy.com/system/resources/previews/023/968/393/large_2x/beautiful-anime-manga-girl-in-paris-illustration-generative-ai-photo.jpg'),  // Full width of the screen
              width: MediaQuery.of(context).size.width, // Full width of the screen
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          // Name
          Text(
            'Profile',
            style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ),
          ),
          // Email
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              'minhthanh5346@gmail.com',
              style: TextStyle(fontSize: 16 ),
            ),
          ),
          // Introduction
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About me',
                        style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Tôi là một lập trình viên Android có kinh nghiệm...',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  width: MediaQuery.of(context).size.width / 3, // One-third of the screen width
                  child: Image(
                    image: NetworkImage('https://static.vecteezy.com/system/resources/previews/023/968/393/large_2x/beautiful-anime-manga-girl-in-paris-illustration-generative-ai-photo.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Details:',
                        style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Text(
                            'Tôi là một lập trình viên Android có kinh nghiệm...',
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            'Tôi là ra trường với GPA 4.0',
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            'Tôi sống tại Sài Gòn',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Experiences
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Container(
            color: Colors.grey.withOpacity(0.2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Experiences',
                  style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold ),
                ),
                // UIT, VNU-HCM
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'UIT, VNU-HCM' ,
                              style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              'Apr 2020 - Apr 2025',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      // Information System
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Information System',
                              style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ),
          ),
        ],
      ),
    );
  }
}
