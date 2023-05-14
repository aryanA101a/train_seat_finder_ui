import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../api/data.dart';
import '../models/carriage_data.dart';
import '../models/train.dart';
import '../ui_helper.dart/train_seat_finder_screen_helper.dart';
import '../widgets/carriage.dart';
import '../widgets/first_carriage.dart';
import '../widgets/track_base.dart';
import '../widgets/utility_widgets.dart';

class TrainSeatFinderScreen extends StatelessWidget {
  const TrainSeatFinderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAEEF6),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: InfoText(
                        title: "Class",
                        value: context.select<TrainSeatFinderHelper, String>(
                            (helper) => helper.coachClass),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: InfoText(
                          title: "Coach",
                          value: context.select<TrainSeatFinderHelper, String>(
                              (helper) => helper.coachName)),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 7,
                child: Stack(alignment: Alignment.center, children: [
                  TrackBase(),
                  // FirstCarriage(),
                  TrainWidget(),
                ]),
              )
            ],
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * .08,
                  child: const FadeOutContainer(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * .06,
                  margin: const EdgeInsets.only(bottom: 5, left: 15, right: 15),
                  child: const SearchField(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: context.select<TrainSeatFinderHelper, bool>(
                (helper) => helper.isValidSearchQuery)
            ? const Icon(
                Icons.done_outline_rounded,
              )
            : const Icon(
                Icons.search_rounded,
              ),
        contentPadding: const EdgeInsets.all(10),
        hintText: "Search (Eg: S2 31)",
        hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 18,
            fontWeight: FontWeight.w400),
        filled: true,
        fillColor: Colors.white70,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (text) {
        context.read<TrainSeatFinderHelper>().search(context, text);
      },
    );
  }
}

class TrainWidget extends StatelessWidget {
  const TrainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ScrollablePositionedList.builder(
          itemScrollController:
              context.read<TrainSeatFinderHelper>().itemScrollController,
          itemPositionsListener:
              context.read<TrainSeatFinderHelper>().itemPositionsListener,
          shrinkWrap: true,
          itemCount: context.read<TrainSeatFinderHelper>().trainData.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Align(
                  child: Container(
                margin: const EdgeInsets.only(top: 40, bottom: 10),
                child: FirstCarriage(
                  carriageData:
                      context.read<TrainSeatFinderHelper>().trainData[index],
                  index: index,
                ),
              ));
            } else {
              return Align(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Carriage(
                      carriageData: context
                          .read<TrainSeatFinderHelper>()
                          .trainData[index],
                      index: index),
                ),
              );
            }
          },
        ));
  }
}

class Seat extends StatelessWidget {
  const Seat({super.key, required this.seatNumber, required this.index});

  final int seatNumber;
  final int index;

  @override
  Widget build(BuildContext context) {
    bool isSelected = (context.select<TrainSeatFinderHelper, int>(
                (helper) => helper.currentSearchSeat) ==
            seatNumber &&
        context.select<TrainSeatFinderHelper, int>(
                (helper) => helper.currentSearchCoachIndex) ==
            index);
    return Builder(builder: (context) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
        padding: const EdgeInsets.all(2),
        height: MediaQuery.of(context).size.height * .045,
        width: MediaQuery.of(context).size.height * .045,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey.shade100,
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * .03),
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              "$seatNumber",
              style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                  fontSize: MediaQuery.of(context).size.width * .04),
            ),
          ),
        ),
      );
    });
  }
}
