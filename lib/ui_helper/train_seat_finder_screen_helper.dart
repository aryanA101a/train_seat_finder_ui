import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../api/data.dart';
import '../models/carriage_data.dart';
import '../models/train.dart';

class TrainSeatFinderHelper with ChangeNotifier {
  TrainSeatFinderHelper() {
    Train train = Train.deserialize(jsonData);
    _trainData = train.getTrainData;

    _registerPositionListener();
  }

  List<CarriageData> _trainData = [];

  String _coachClass = "";
  String _coachName = "";

  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener =
      ItemPositionsListener.create();

  List<CarriageData> get trainData => _trainData;

  String get coachClass => _coachClass;
  String get coachName => _coachName;

  ItemScrollController get itemScrollController => _itemScrollController;
  ItemPositionsListener get itemPositionsListener => _itemPositionsListener;

  int _currentSearchSeat = -1;
  int _currentSearchCoachIndex = -1;

  int get currentSearchSeat => _currentSearchSeat;
  int get currentSearchCoachIndex => _currentSearchCoachIndex;

  void search(BuildContext context, String text) {
    int index;
    bool valid;
    (index, valid) = processSearchQuery(text);
    _currentSearchCoachIndex = index;
    _isValidSearchQuery = valid;
    notifyListeners();

    if (_isValidSearchQuery && index != -1) {
      // dismissKeyboard(context);

      int getSegment(int number, int range, int totalSegments) {
        int segmentSize = (range / totalSegments).ceil();
        int segmentIndex = (number / segmentSize).ceil();
        return segmentIndex;
      }

      double offset =
          getSegment(_currentSearchSeat, trainData[index].seats, 2) == 2
              ? -0.5
              : 0;
      // log(offset.toString());
      itemScrollController.scrollTo(
          index: index,
          duration: Duration(seconds: 1),
          alignment: offset,
          curve: Curves.easeInOutCubic);
    }
  }

  bool _isValidSearchQuery = false;
  bool get isValidSearchQuery => _isValidSearchQuery;

  (int, bool) processSearchQuery(String text) {
    final pattern = RegExp(r'^([HABShabs])([1-9]\d?)\s([1-9]\d?)$');

    final RegExpMatch? match = pattern.firstMatch(text);
    if (match != null) {
      final letter = match.group(1);
      final number1 = match.group(2);
      final number2 = match.group(3);

      int index = trainData.indexWhere(
        (element) => element.carriageName == letter! + number1!,
      );

      if (index != -1 && trainData[index].seats >= int.parse(number2!)) {
        _currentSearchSeat = int.parse(number2);
        return (index, true);
      }
    }
    return (-1, false);
  }

  void _registerPositionListener() {
    _itemPositionsListener.itemPositions.addListener(() {
      List<int> positionIndices = _itemPositionsListener.itemPositions.value
          .where((element) {
            final isTopVisible = element.itemLeadingEdge <= 0;
            return isTopVisible;
          })
          .map((e) => e.index)
          .toList();
      if (positionIndices.isNotEmpty) {
        // log(positionIndices.toString());
        _coachClass = _trainData[positionIndices.first].carriageClass;
        _coachName = _trainData[positionIndices.first].carriageName;
        notifyListeners();
      }
    });
  }

  void dismissKeyboard(BuildContext context) {
    Future.delayed(Duration(milliseconds: 2000), () {
      FocusScope.of(context).unfocus();
    });
  }
}
