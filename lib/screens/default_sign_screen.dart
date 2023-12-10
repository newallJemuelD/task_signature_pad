import 'package:eval_task_signature/screens/sign_manual_screen.dart';
import 'package:flutter/material.dart';

class DefaultSignScreen extends StatefulWidget {
  const DefaultSignScreen({super.key});

  @override
  State<DefaultSignScreen> createState() => _DefaultSignScreenState();
}

class _DefaultSignScreenState extends State<DefaultSignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signature Scanner'),
      ),
      body: Column(
        children: [
          _buildHeadingWidget(),
          _buildDefaultSignWidget(context),
          _buildButtonWidget(),
          _buildSubmitButton(),
        ],
      ),
    );
  }

  Widget _buildButtonWidget() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const SignManualScreen();
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 210, 214, 214),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          'Sign Manually',
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
        Container(
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
      ],
    );
  }

  Widget _buildDefaultSignWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 228, 225, 225),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          'Newall',
          style: TextStyle(
            fontFamily: 'Signature',
            fontSize: 100.0,
            color: Colors.blue,
          ),
        ),
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
          padding: const EdgeInsets.only(left: 20, bottom: 70),
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
