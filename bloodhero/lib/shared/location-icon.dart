import 'package:flutter/material.dart';

class LocationIcon extends StatelessWidget {
  final double size;
  LocationIcon(this.size);
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.my_location,
      color: Colors.grey,
      size: size,
    );
  }
}
