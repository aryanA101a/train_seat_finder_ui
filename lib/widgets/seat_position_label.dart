import 'package:flutter/material.dart';

import '../models/carriage_data.dart';

class SeatPositionLabel extends StatelessWidget {
  const SeatPositionLabel({
    super.key,
    required this.carriageData,
  });

  final CarriageData carriageData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
            padding: const EdgeInsets.all(2),
            height: MediaQuery.of(context).size.height * .045,
            width: MediaQuery.of(context).size.height * .045,
            child: Center(
              child: FittedBox(
                child: Text(
                  "L",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * .06),
                ),
              ),
            )),
        if (carriageData.carriageClass == 'AC3' ||
            carriageData.carriageClass == 'SL')
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
              padding: const EdgeInsets.all(2),
              height: MediaQuery.of(context).size.height * .045,
              width: MediaQuery.of(context).size.height * .045,
              child: Center(
                child: FittedBox(
                  child: Text(
                    "M",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * .06),
                  ),
                ),
              )),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
            padding: const EdgeInsets.all(2),
            height: MediaQuery.of(context).size.height * .045,
            width: MediaQuery.of(context).size.height * .045,
            child: Center(
              child: FittedBox(
                child: Text(
                  "U",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * .06),
                ),
              ),
            )),
        if (carriageData.carriageClass == 'AC2' ||
            carriageData.carriageClass == 'AC3' ||
            carriageData.carriageClass == 'SL') ...[
          const Spacer(),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
              padding: const EdgeInsets.all(2),
              height: MediaQuery.of(context).size.height * .045,
              width: MediaQuery.of(context).size.height * .045,
              child: Center(
                child: FittedBox(
                  child: Text(
                    "LU",
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * .06),
                  ),
                ),
              ))
        ]
      ],
    );
  }
}