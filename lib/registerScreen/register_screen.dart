import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ola_drivers_app/mainScreen/main_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  late DatabaseReference dbRef;
  
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('drivers');
  }

  String _name = '';
  String _email = '';
  String _password = '';
  String _vehicle_name = '';
  String _vehicle_number = '';
  String _drivers_license = '';
  String _phone = '';

  void _submitForm() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      Map<String, String> drivers = {
        'name': _name,
        'email': _email,
        'password': _password,
        'vehicle_name': _vehicle_name,
        'vehicle_number': _vehicle_number,
        'drivers_license': _drivers_license,
        'phone': _phone,
      };
      dbRef.push().set(drivers);
       Navigator.push(context,
                      MaterialPageRoute(builder: (e) => const MainScreen()));
    } else {
      print('validation failed!');
    }
    print(form!.validate());
    // Do something with the form data.
  }

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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name.';
                  }
                  return null;
                },
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
                validator: ,
                decoration: InputDecoration(labelText: 'Mobile Number'),
                onChanged: (value) {
                  _phone = value;
                },
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                validator:
                    EmailValidator(errorText: 'enter a valid email address'),
                decoration: InputDecoration(labelText: 'Email'),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  _email = value;
                },
              ),
              TextFormField(
                validator:
                    MinLengthValidator(errorText: 'enter a valid password', 6),
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
                  _submitForm();
                 
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
