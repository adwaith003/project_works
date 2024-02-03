import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signuppage.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  void _handleEmailSignIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Handle successful login
      print('User logged in: ${userCredential.user!.uid}');

      // Navigate to the home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      // Handle errors
      setState(() {
        _errorMessage = 'Invalid credentials. Please try again.';
      });
      print('Error during login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Your existing container decoration
        child: Center(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 20),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _handleEmailSignIn,
                    child: Text('Login'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    _errorMessage,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text("Don't have an account? Sign up"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
