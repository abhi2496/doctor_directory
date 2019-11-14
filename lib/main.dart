import 'package:doctor_directory/doctors_by_speciality.dart';
import 'package:flutter/material.dart';

void main() => runApp(DoctorDirectory());

class DoctorDirectory extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Directory',
      debugShowCheckedModeBanner: false,
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: DoctorsBySpeciality(),
      theme: ThemeData(
/*        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],*/
        backgroundColor: Colors.transparent,
      ),
    );
  }
}