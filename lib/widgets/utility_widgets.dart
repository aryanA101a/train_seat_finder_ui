import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String title;

  final String value;

  const InfoText({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          style: const TextStyle(
              color: Colors.blue, fontSize: 45, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class FadeOutContainer extends StatelessWidget {
  const FadeOutContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5, // Adjust the opacity as desired
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.white,
              Colors.transparent,
            ],
          ),
        ),
         // Adjust the height of the fade-out effect
      ),
    );
  }
}
