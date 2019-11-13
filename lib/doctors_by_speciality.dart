import 'package:flutter/material.dart';
import 'package:doctor_directory/specialities.dart';

//final _backgroundColor = Colors.blue[600];
final _backgroundColor = Colors.white;

class DoctorsBySpeciality extends StatelessWidget {
  static const _specialityNames = <String>[
    'Dental',
    'Medical',
    'Services',
    'Therapy',
    'Vision'
  ];

  static const _baseColors = <Color>[
    Colors.red,
    Colors.teal,
    Colors.amber,
    Colors.deepOrange,
    Colors.deepPurpleAccent,
  ];

  @override
  Widget build(BuildContext context) {
    final specialities = <Specialities>[];

    for (var i = 0; i < _specialityNames.length; i++) {
      specialities.add(Specialities(
        name: _specialityNames[i],
        color: _baseColors[i],
      ));
    }

    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => specialities[index],
        itemCount: specialities.length,
      ),
    );

    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'Doctors Directory',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
