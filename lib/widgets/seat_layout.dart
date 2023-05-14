import 'package:flutter/material.dart';
import 'package:train_seat_finder_ui/widgets/seat_position_label.dart';

import '../models/carriage_data.dart';
import '../screens/train_seat_finder_screen.dart';

class SeatLayout extends StatelessWidget {
  SeatLayout({super.key, required this.carriageData, required this.index})
      : rows = carriageData.seats ~/ carriageData.seatsPerRow;

  final int rows;
  final CarriageData carriageData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SeatPositionLabel(carriageData: carriageData),
        for (int r = 0; r < rows; r++) ...[
          if (carriageData.seatsPerRow == 2)
            Row(
              children: List.generate(
                2,
                (j) {
                  return Seat(
                    seatNumber: (r * carriageData.seatsPerRow + j) + 1,
                    index: index,
                  );
                },
              ),
            )
          else if (carriageData.seatsPerRow == 3)
            Row(children: [
              Seat(
                seatNumber: (r + 1) % 2 == 1
                    ? (((r + 1) * carriageData.seatsPerRow - 1) - 1)
                    : (((r + 1) * carriageData.seatsPerRow - 2) - 1),
                index: index,
              ),
              Seat(
                seatNumber: (r + 1) % 2 == 1
                    ? (((r + 1) * carriageData.seatsPerRow - 1))
                    : (((r + 1) * carriageData.seatsPerRow - 2)),
                index: index,
              ),
              const Spacer(),
              Seat(
                seatNumber: (r + 1) % 2 == 1
                    ? (((r + 1) * carriageData.seatsPerRow - 1) + 3)
                    : (((r + 1) * carriageData.seatsPerRow - 2) + 2),
                index: index,
              ),
            ])
          else if (carriageData.seatsPerRow == 4)
            Row(children: [
              Seat(
                seatNumber: (r + 1) % 2 == 1
                    ? (((r + 1) * carriageData.seatsPerRow - 2) - 1)
                    : (((r + 1) * carriageData.seatsPerRow - 3) - 1),
                index: index,
              ),
              Seat(
                seatNumber: (r + 1) % 2 == 1
                    ? (((r + 1) * carriageData.seatsPerRow - 2))
                    : (((r + 1) * carriageData.seatsPerRow - 3)),
                index: index,
              ),
              Seat(
                seatNumber: (r + 1) % 2 == 1
                    ? (((r + 1) * carriageData.seatsPerRow - 2) + 1)
                    : (((r + 1) * carriageData.seatsPerRow - 3) + 1),
                index: index,
              ),
              const Spacer(),
              Seat(
                seatNumber: (r + 1) % 2 == 1
                    ? (((r + 1) * carriageData.seatsPerRow - 2) + 1 + 4)
                    : (((r + 1) * carriageData.seatsPerRow - 3) + 1 + 2),
                index: index,
              ),
            ]),
          if ((r + 1) % 2 == 0)
            SizedBox(height: MediaQuery.of(context).size.height * .02),
        ],
      ],
    );
  }
}