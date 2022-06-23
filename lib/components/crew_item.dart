import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:space_travel_project/components/bars_indicator.dart';

import '../kconstants.dart';

enum SpaceCrew {
  douglas,
  mark,
  victor,
  anousheh,
}

class CrewItem extends StatefulWidget {
  const CrewItem({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;

  @override
  State<CrewItem> createState() => _CrewItemState();
}

class _CrewItemState extends State<CrewItem> {
  int _crewIndex = 0;

  final List<SpaceCrew> _crewIndexes = [
    SpaceCrew.douglas,
    SpaceCrew.mark,
    SpaceCrew.victor,
    SpaceCrew.anousheh,
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: widget.data['crew'].length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Column(
            children: [
              AspectRatio(
                aspectRatio: 15 / 9,
                child: Image.asset(
                  widget.data['crew'][itemIndex]['images']['png'].substring(2),
                ),
              ),
            ],
          ),
          options: CarouselOptions(
              height: 200,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _crewIndex = index;
                });
              }),
        ),
        Divider(
          height: 1.0,
          color: const Color(0xFF979797),
          indent: width * 24 / 370,
          endIndent: width * 24 / 370,
        ),
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.384),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ..._crewIndexes.map(
                (e) => BarIndicator(
                  barIndicator: e.index,
                  index: _crewIndex,
                  width: 10,
                  height: 10,
                  radius: 100,
                  activeColor: Colors.white,
                  inactiveColor: const Color(0xFF454850),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Text(
                widget.data['crew'][_crewIndex]['role'].toUpperCase(),
                style: kCrewRole,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.data['crew'][_crewIndex]['name'].toUpperCase(),
                style: kCrewPersonName,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.data['crew'][_crewIndex]['bio'],
                style: kCrewDescription,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
