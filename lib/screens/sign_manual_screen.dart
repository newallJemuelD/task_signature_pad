import 'dart:typed_data';

import 'package:eval_task_signature/screens/output_screen.dart';
import 'package:flutter/material.dart';

import 'package:signature/signature.dart';

class SignManualScreen extends StatefulWidget {
  const SignManualScreen({super.key});

  @override
  State<SignManualScreen> createState() => _SignManualScreenState();
}

class _SignManualScreenState extends State<SignManualScreen> {
  Uint8List? signatureData;

  saveImage() async {
    signatureData = await _controller.toPngBytes();
  }

  final SignatureController _controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signature Scanner'),
      ),
      body: Column(
        children: [
          _buildHeadingWidget(),
          _buildManualSignWidget(context),
          _buildClearWidget(),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildClearWidget() {
    return GestureDetector(
      onTap: () {
        _controller.clear();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 210, 214, 214),
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Text(
          'Clear',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Column(
      children: [
        const SizedBox(
          height: 130,
        ),
        InkWell(
          onTap: () async {
            await saveImage();

            // ignore: use_build_context_synchronously
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return OutputScreen(imageData: signatureData);
            }));
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Text(
                'SUBMIT',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildManualSignWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 228, 225, 225),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Signature(
        controller: _controller,
        width: 300,
        height: 300,
        backgroundColor: const Color.fromARGB(255, 228, 225, 225),
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
        _buildManualSignDescriptionWidget(
          bottomPadding: 3,
          topPadding: 15,
          leftPadding: 20,
          text: 'Provide your valid signature for official verification.',
        ),
        _buildManualSignDescriptionWidget(
          bottomPadding: 30,
          topPadding: 0,
          leftPadding: 20,
          text: 'Single dots, line or random shapes are not allowed',
        ),
      ],
    );
  }

  Widget _buildManualSignDescriptionWidget({
    required double leftPadding,
    required double topPadding,
    required double bottomPadding,
    required String text,
  }) {
    return Container(
      padding: EdgeInsets.only(
          left: leftPadding, top: topPadding, bottom: bottomPadding),
      alignment: Alignment.centerLeft,
      child: Text(text),
    );
  }
}
