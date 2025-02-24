import 'package:flutter/material.dart';

class Searchbutton extends StatelessWidget {
  const Searchbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 189, 66, 255),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: MaterialButton(
        elevation: 6,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        onPressed: () {},
        child: const Center(
            child: Icon(
          Icons.search,
          color: Colors.white,
          size: 30,
        )),
      ),
    );
  }
}
