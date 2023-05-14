import 'package:flutter/material.dart';
import 'package:train_seat_finder_ui/widgets/train_track.dart';


class TrackBase extends StatelessWidget {
  const TrackBase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * .6,
      decoration: const BoxDecoration(color: Color(0xFFF3F4FB)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TrainTrack(),
          TrainTrack(),
        ],
      ),
    );
  }
}