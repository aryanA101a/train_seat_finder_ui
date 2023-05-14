class CoachClass {
  CoachClass(
      {required this.type, required this.seats, required this.carriages}) {
    switch (type) {
      case CoachType.ac1:
        seatsPerRow = 2;
        coachNamingConvention = 'H';
        break;
      case CoachType.ac2:
        seatsPerRow = 3;
        coachNamingConvention = 'A';
        break;
      case CoachType.ac3:
        seatsPerRow = 4;
        coachNamingConvention = 'B';
        break;
      case CoachType.sl:
        seatsPerRow = 4;
        coachNamingConvention = 'S';
        break;
    }
  }
  final CoachType type;
  final int carriages;
  final int seats;
  late final int seatsPerRow;
  late final String coachNamingConvention;
}

enum CoachType { ac1, ac2, ac3, sl }
