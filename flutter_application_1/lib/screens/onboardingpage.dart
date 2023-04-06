import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  String name = '';
  String dob = '';
  String gender = '';
  String nationality = '';
  String address = '';
  String pincode = '';
  String idNumber = '';
  String phNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Onboarding Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: TextStyle(fontSize: 16.0),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Date of Birth',
                style: TextStyle(fontSize: 16.0),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    dob = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your date of birth',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Gender',
                style: TextStyle(fontSize: 16.0),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your gender',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Nationality',
                style: TextStyle(fontSize: 16.0),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    nationality = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your nationality',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Address',
                style: TextStyle(fontSize: 16.0),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    address = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your address',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Pincode',
                style: TextStyle(fontSize: 16.0),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    pincode = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your pincode',
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Phone Number',
                style: TextStyle(fontSize: 16.0),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    phNumber = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your phone number',
                ),
              ),
              SizedBox(height: 32.0),
              Text(
                'ID Number',
                style: TextStyle(fontSize: 16.0),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    idNumber = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your ID number',
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () async {
                  // TODO: Save user's information to a database or somewhere else.
                  const url = 'http://192.168.132.220:3000/api/form';
                  final response = await http.post(
                    Uri.parse(url),
                    headers: <String, String>{
                      'Content-Type': 'application/json; charset=UTF-8',
                    },
                    body: jsonEncode(<String, String>{
                      'name': name,
                      'dateofbirth': dob,
                      'gender': gender,
                      'nationality': nationality,
                      //'address': address,
                      //'pincode': pincode,
                      'idno': idNumber,
                      'phno': phNumber,
                    }),
                  );
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
