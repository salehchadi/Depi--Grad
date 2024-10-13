import 'package:chatapp/constants.dart';
import 'package:chatapp/models/messagemodel.dart';
import 'package:flutter/material.dart';

class chatbuble extends StatelessWidget {
  const chatbuble({
    super.key,
    required this.text,
  });
  final Messagemodel text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: primarycolor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 32,
            bottom: 32,
            right: 32,
          ),
          child: Text(
            text.message,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class chatbublefriend extends StatelessWidget {
  const chatbublefriend({
    super.key,
    required this.text,
  });
  final Messagemodel text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 27, 137, 119),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            bottomLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 32,
            bottom: 32,
            right: 32,
          ),
          child: Text(
            text.message,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
