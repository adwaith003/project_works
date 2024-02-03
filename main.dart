import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app/pages/loginpage.dart'; // Import the LoginPage
import 'package:app/pages/SignUpPage.dart'; // Import the SignupPage

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAf2bVIAxMPsWksVSIM3SMUEi5FAVsB3iw",
      authDomain: "ecoexpense-1cde6.firebaseapp.com",
      projectId: "ecoexpense-1cde6",
      storageBucket: "ecoexpense-1cde6.appspot.com",
      messagingSenderId: "409083412762",
      appId:
          "1:409083412762:web:6f28d8a9153c03b687eca3", // Replace with your actual web app ID
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 53, 62, 62),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              // Place for Logo
              Container(
                height: 200, // Adjust the height as needed
                width: 200, // Adjust the width as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'lib/assets/logo.jpg'), // Replace with your logo path
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(height: 20),
              // Text just below the logo
              Text(
                'ECO EXPENSE',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 200),
              // Curved login button
              ElevatedButton(
                onPressed: () {
                  print("Login button pressed");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        60), // Increase the value for a larger button
                  ),
                ),
                child: Container(
                  width: 150, // Adjust the width as needed
                  height: 45, // Adjust the height as needed
                  child: Center(
                    child: Text('Login', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Curved signup button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        60), // Increase the value for a larger button
                  ),
                ),
                child: Container(
                  width: 150, // Adjust the width as needed
                  height: 45, // Adjust the height as needed
                  child: Center(
                    child: Text('Signup', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'pages/loginpage.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: FirebaseOptions(
//       apiKey: "AIzaSyAf2bVIAxMPsWksVSIM3SMUEi5FAVsB3iw",
//       authDomain: "ecoexpense-1cde6.firebaseapp.com",
//       projectId: "ecoexpense-1cde6",
//       storageBucket: "ecoexpense-1cde6.appspot.com",
//       messagingSenderId: "409083412762",
//       appId:
//           "1:409083412762:web:6f28d8a9153c03b687eca3", // Replace with your actual web app ID
//     ),
//   );
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: LoginPage(),
//     );
//   }
// }
