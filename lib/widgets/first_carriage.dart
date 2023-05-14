import 'package:flutter/material.dart';
import 'package:train_seat_finder_ui/widgets/seat_layout.dart';

import '../models/carriage_data.dart';

class FirstCarriage extends StatelessWidget {
  final CarriageData carriageData;
  final int index;

  const FirstCarriage({
    super.key,
    required this.carriageData,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: FirstCarriageClip(),
      child: Container(
        

        // height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * .5,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            const FirstCarriageWindow(),
            Container(
                margin: const EdgeInsets.all(20),
                child: SeatLayout(
                  carriageData: carriageData,
                  index: index,
                ))
          ],
        ),
      ),
    );
  }
}

class FirstCarriageWindow extends StatelessWidget {
  const FirstCarriageWindow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ClipPath(
        clipper: FirstCarriageWindowClip(),
        child: Container(
          height: MediaQuery.of(context).size.height * .08,
          width: MediaQuery.of(context).size.width * .3,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

class FirstCarriageClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 500 * 0.26);
    path.quadraticBezierTo(size.width * 0.1, -500 * 0.01, size.width * 0.5, 0);
    path.quadraticBezierTo(
        size.width * 0.9, -500 * 0.01, size.width, 500 * 0.26);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class FirstCarriageWindowClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(
        size.width * 0.1, -size.height * 0.1, size.width * 0.5, 0);
    path.quadraticBezierTo(
        size.width * 0.9, -size.height * 0.1, size.width, size.height);
    // path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
