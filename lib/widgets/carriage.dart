import 'package:flutter/material.dart';
import 'package:train_seat_finder_ui/widgets/seat_layout.dart';

import '../models/carriage_data.dart';

class Carriage extends StatelessWidget {
  const Carriage({super.key, required this.carriageData, required this.index});
  final CarriageData carriageData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
          margin: const EdgeInsets.all(20),
          child: SeatLayout(
            carriageData: carriageData,
            index: index,
          )),
    );
  }
}