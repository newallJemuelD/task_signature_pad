import 'dart:typed_data';

import 'package:flutter/material.dart';

class OutputScreen extends StatelessWidget {
  final Uint8List? imageData;
  const OutputScreen({super.key, required this.imageData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signature Scanner'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeadingWidget(),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 20),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color.fromARGB(255, 235, 231, 231),
              ),
            ),
            child: Image.memory(
              imageData!,
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeadingWidget() {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Container(
          padding: const EdgeInsets.only(left: 20),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Submit Your Signature',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
