import 'package:flutter/material.dart';

class TrainTrack extends StatelessWidget {
  const TrainTrack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xFFE1E3E7)),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * .045,
    );
  }
}
