import 'dart:developer';

import 'carriage_data.dart';
import 'coach_class.dart';

class Train {
  Train({required this.trainNumber, required this.trainName});
  int trainNumber;
  String trainName;
  List<CoachClass>? coachClasses;
  List<CarriageData> _trainData = [];

  // int getCoachCount() {
  //   return coachClasses
  //       .map((coach) => coach.carriages)
  //       .fold(0, (a, b) => a + b);
  // }

  void _setTrainData() {
    if (coachClasses == null) {
      return;
    }
    List<CarriageData> data = [];
    for (CoachClass coachClass in coachClasses!) {
      for (int i = 0; i < coachClass.carriages; i++) {
        data.add(
          CarriageData(
            carriageName: coachClass.coachNamingConvention + (i + 1).toString(),
            seats: coachClass.seats,
            carriageClass:
                coachClass.type.toString().split(".")[1].toUpperCase(),
            seatsPerRow: coachClass.seatsPerRow,
          ),
        );
      }
    }
    _trainData = data;
    // log(_trainData.toString());
  }

  List<CarriageData> get getTrainData {
    if (_trainData.isEmpty) {
      _setTrainData();
    }
    return _trainData;
  }

  static Train deserialize(jsonData) {
    final data = jsonData['data'];
    final trainNumber = int.parse(data['train_number']);
    final trainName = data['train_name'];

    final train = Train(trainNumber: trainNumber, trainName: trainName);
    train.coachClasses = [];
    for (final entry in data.entries) {
      if (entry.key.startsWith('AC') || entry.key == 'SL') {
        final type = CoachType.values.firstWhere(
          (e) =>
              e.toString().split('.').last.toLowerCase() ==
              entry.key.toLowerCase(),
        );
        final coachData = entry.value;
        train.coachClasses!.add(
          CoachClass(
            type: type,
            carriages: coachData['carriages'],
            seats: coachData['seats'],
          ),
        );
      }
    }
    return train;
  }
}
