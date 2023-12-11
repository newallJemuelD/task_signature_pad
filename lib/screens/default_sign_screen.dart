import 'package:eval_task_signature/screens/sign_manual_screen.dart';
import 'package:flutter/material.dart';

class DefaultSignScreen extends StatefulWidget {
  const DefaultSignScreen({super.key});

  @override
  State<DefaultSignScreen> createState() => _DefaultSignScreenState();
}

class _DefaultSignScreenState extends State<DefaultSignScreen> {
  String formatText(String name) {
    String fullName = name;
    List<String> names = fullName.split(' ');

    // Exclude titles logic - check truncatedFirstName and truncatedSecondName below
    List<String> prefixTitles = [
      'Mr',
      'Ms',
      'Mrs',
      'Dr',
      'Fr',
      'Prof',
      'Mr.',
      'Ms.',
      'Mrs.',
      'Dr.',
      'Fr.',
      'Prof.'
    ];

    // Suffix list
    List<String> suffixTitles = [
      'Jr',
      'Sr',
      'C/O',
      'D/O',
      'S/O',
      'Jr.',
      'Sr.',
      'C/O.',
      'D/O.',
      'S/O.'
    ];

    // Prefix check
    String truncatedFirstName =
        names.isNotEmpty && !prefixTitles.contains(names[0]) ? names[0] : '';

    // Add initial letters of other names
    // First name single letter means display second name fully logic
    String truncatedSecondName = names.length > 1
        ? truncatedFirstName == '' || truncatedFirstName.length == 1
            ? names[1]
            : names[1].substring(0, 1).toUpperCase()
        : '';

    // Suffix check
    String truncatedThirdName =
        names.length > 2 && !suffixTitles.contains(names[2])
            ? names[2].substring(0, 1)
            : '';

    // Suffix check
    String truncatedFourthName =
        names.length > 3 && !suffixTitles.contains(names[3])
            ? names[3].substring(0, 1)
            : '';

    // Uppercase is add using .toUpperCase() method
    String formattedName =
        '$truncatedFirstName $truncatedSecondName ${truncatedThirdName.toUpperCase()} ${truncatedFourthName.toUpperCase()}'
            .trim();

    // Limit text to 18 characters
    (formattedName.length > 18)
        ? formattedName = formattedName.substring(0, 18)
        : formattedName;

    return formattedName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signature Scanner'),
      ),
      body: Column(
        children: [
          _buildHeadingWidget(),
          _buildDefaultSignWidget(context, name: 'Newall Jemuel Sr'),
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

  Widget _buildDefaultSignWidget(BuildContext context, {String? name}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 250,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 228, 225, 225),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          formatText(name ?? '--'),
          maxLines: 1,
          style: const TextStyle(
            fontFamily: 'Signature',
            // Fontsize is given 48, 56, 64
            fontSize: 64,
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
