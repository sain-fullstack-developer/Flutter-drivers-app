import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';
  String _vehicle_name = '';
  String _vehicle_number = '';
  String _drivers_license = '';
  String _phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Register'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  _name = value;
                },
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Vehicle Name'),
                onChanged: (value) {
                  _vehicle_name = value;
                },
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Vehicle Number'),
                onChanged: (value) {
                  _vehicle_number = value;
                },
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Drivers License Number'),
                onChanged: (value) {
                  _drivers_license = value;
                },
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Mobile Number'),
                onChanged: (value) {
                  _phone = value;
                },
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  _email = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                style: TextStyle(color: Colors.white),
                obscureText: true,
                onChanged: (value) {
                  _password = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text('Register'),
                onPressed: () {
                  FirebaseDatabase database = FirebaseDatabase.instance;
                  DatabaseReference ref = database.ref('drivers');
                  ref.set({
                    _name,
                    _email,
                    _password,
                    _vehicle_name,
                    _vehicle_number,
                    _drivers_license,
                    _phone
                  });

                  print('drivers');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
