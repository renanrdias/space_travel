import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../kconstants.dart';
import '../components/bars_indicator.dart';

enum DestinationIndex {
  moon,
  mars,
  europa,
  titan,
}

class DestinationItem extends StatefulWidget {
  DestinationItem({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;

  @override
  State<DestinationItem> createState() => _DestinationItemState();
}

class _DestinationItemState extends State<DestinationItem> {
  int _destinationIndex = 0;

  final List<DestinationIndex> _activeIndexes = [
    DestinationIndex.moon,
    DestinationIndex.mars,
    DestinationIndex.europa,
    DestinationIndex.titan,
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          itemCount: widget.data['destinations'].length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Column(
            children: [
              Image.asset(
                widget.data['destinations'][itemIndex]['images']['png']
                    .substring(2),
                width: 170,
                height: 170,
              ),
            ],
          ),
          options: CarouselOptions(
              height: 200,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _destinationIndex = index;
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 69.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ..._activeIndexes.map(
                (e) => Column(
                  children: [
                    Text(
                      e.name.toUpperCase(),
                      style: kDestinationIndicator,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    BarIndicator(
                      barIndicator: e.index,
                      index: _destinationIndex,
                      width: 36,
                      height: 3,
                      activeColor: Colors.white,
                      inactiveColor: Colors.transparent,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height * 20 / 850,
        ),
        Text(
          widget.data['destinations'][_destinationIndex]['name'].toUpperCase(),
          style: kDestinationTitle,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            widget.data['destinations'][_destinationIndex]['description'],
            textAlign: TextAlign.center,
            style: kDestinationDescription,
          ),
        ),
        SizedBox(
          height: height * 32 / 850,
        ),
        Divider(
          height: 1.0,
          color: const Color(0xFF979797),
          indent: width * 24 / 370,
          endIndent: width * 24 / 370,
        ),
        SizedBox(
          height: height * 32 / 850,
        ),
        Text(
          'avg. distance'.toUpperCase(),
          style: kDestinationAvgDistance,
        ),
        SizedBox(
          height: height * 12 / 850,
        ),
        Text(
          widget.data['destinations'][_destinationIndex]['distance']
              .toUpperCase(),
          style: kDestinationKmDistance,
        ),
        SizedBox(
          height: height * 32 / 850,
        ),
        Text(
          'Est. travel time'.toUpperCase(),
          style: kDestinationAvgDistance,
        ),
        SizedBox(
          height: height * 12 / 850,
        ),
        Text(
          widget.data['destinations'][_destinationIndex]['travel']
              .toUpperCase(),
          style: kDestinationKmDistance,
        ),
      ],
    );
  }
}
