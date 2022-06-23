import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:space_travel_project/components/bars_indicator.dart';

import '../kconstants.dart';

enum TecnologyIndex {
  launchVehicle,
  spacePort,
  spaceCapsule,
}

class TechnologyItem extends StatefulWidget {
  const TechnologyItem({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;

  @override
  State<TechnologyItem> createState() => _TechnologyItemState();
}

class _TechnologyItemState extends State<TechnologyItem> {
  int _technologyIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: height * .17,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('03', style: kDestinationIndex),
            const SizedBox(width: 18),
            Text(
              'space launch 101'.toUpperCase(),
              style: kDestinationSubtitle,
            ),
          ],
        ),
        SizedBox(height: height * 32 / 710),
        CarouselSlider.builder(
          itemCount: widget.data['technology'].length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Image.asset(
            widget.data['technology'][itemIndex]['images']['landscape']
                .substring(2),
            fit: BoxFit.cover,
          ),
          options: CarouselOptions(
              viewportFraction: 1,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _technologyIndex = index;
                });
              }),
        ),
        SizedBox(height: height * 34 / 710),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 112 / 375),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BarIndicator(
                barIndicator: TecnologyIndex.launchVehicle.index,
                index: _technologyIndex,
                width: 40,
                height: 40,
                activeColor: Colors.white,
                inactiveColor: Colors.transparent,
                borderColor: const Color(0xFF4C4D55),
                radius: 100,
                child: Align(
                  child: Text(
                    '1',
                    style: TextStyle(
                      color:
                          TecnologyIndex.launchVehicle.index == _technologyIndex
                              ? const Color(0xFF0B0D17)
                              : Colors.white,
                    ),
                  ),
                ),
              ),
              BarIndicator(
                barIndicator: TecnologyIndex.spacePort.index,
                index: _technologyIndex,
                width: 40,
                height: 40,
                activeColor: Colors.white,
                inactiveColor: Colors.transparent,
                borderColor: const Color(0xFF4C4D55),
                radius: 100,
                child: Align(
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: TecnologyIndex.spacePort.index == _technologyIndex
                          ? const Color(0xFF0B0D17)
                          : Colors.white,
                    ),
                  ),
                ),
              ),
              BarIndicator(
                barIndicator: TecnologyIndex.spaceCapsule.index,
                index: _technologyIndex,
                width: 40,
                height: 40,
                activeColor: Colors.white,
                inactiveColor: Colors.transparent,
                borderColor: const Color(0xFF4C4D55),
                radius: 100,
                child: Align(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color:
                          TecnologyIndex.spaceCapsule.index == _technologyIndex
                              ? const Color(0xFF0B0D17)
                              : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 26 / 710,
        ),
        Text(
          'the terminology...'.toUpperCase(),
          style: kTechnologySubtitle,
        ),
        SizedBox(
          height: height * 9 / 710,
        ),
        Text(
          widget.data['technology'][_technologyIndex]['name'].toUpperCase(),
          style: kTechnologyTitle,
        ),
        SizedBox(
          height: height * 16 / 710,
        ),
        Text(
          widget.data['technology'][_technologyIndex]['description'],
          style: kTechnologyDescription,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
