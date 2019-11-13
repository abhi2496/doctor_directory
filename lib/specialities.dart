import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// @required is defined in the meta.dart package
import 'package:meta/meta.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Specialities extends StatelessWidget {
  final String name;
  final ColorSwatch color;

  ///Creates a [Speciality].
  ///
  /// A [Speciality] saves the name of the speciality, it description
  /// and its color.
  /// While the @required checks for whether a named parameter is passed in,
  //  it doesn't check whether the object passed in is null. It is checked
  //  in the assert statement.
  const Specialities(
      {Key key,
      @required this.name,
      @required this.color})
      : assert(name != null),
        super(key: key);

  ///Builds a custom widget that shows [Specialities] information.
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: color,
          splashColor: color,
          onTap: () {
            print('I was tapped');
          },
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
