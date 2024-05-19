import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:repsoft_assignment/constatns/primary_colors.dart';
import 'package:repsoft_assignment/screens/login_screen.dart';
import 'package:repsoft_assignment/services/signup_services.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpServices signUpServices = SignUpServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  void checkValues() {
    String fullName = _fullNameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String confirmPassword = _confirmPasswordController.text.trim();
    if (fullName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      log("Please fill all the fields");
    } else if (password != confirmPassword) {
      log("Passwords do not match");
    } else {
      signUpServices.signUp(context, email, password, fullName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: Text(
          'Sign Up',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w500, color: primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'Create account and enjoy all services',
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF9B9B9B),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 32),
              TextField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(color: labelTextColor),
                  prefixIcon: Icon(Icons.person, color: primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: labelTextColor),
                  prefixIcon: Icon(Icons.email, color: primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: labelTextColor),
                  prefixIcon: Icon(Icons.lock, color: primaryColor),
                  suffixIcon: Icon(Icons.visibility_off, color: primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: labelTextColor),
                  prefixIcon: Icon(Icons.lock, color: primaryColor),
                  suffixIcon: Icon(Icons.visibility_off, color: primaryColor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  checkValues();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  backgroundColor: Color(
                      0xFF202023), // Adjust this to match your button color
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Handle sign up
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.popUntil(context, (route) => false);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }));
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(color: Color(0xFF9B9B9B)),
                        children: [
                          TextSpan(
                            text: 'Sing In',
                            style: TextStyle(color: primaryColor),
                          ),
                        ],
                      ),
                    ),
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
