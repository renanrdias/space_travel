import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:space_travel_project/components/crew_item.dart';

import '../components/app_drawer.dart';
import '../kconstants.dart';

class CrewScreen extends StatefulWidget {
  const CrewScreen({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;

  static const String routeName = '/crew';

  @override
  State<CrewScreen> createState() => _CrewScreenState();
}

class _CrewScreenState extends State<CrewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 8,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              semanticsLabel: 'space travel logo',
              width: 40,
              height: 40,
            ),
          ],
        ),
      ),
      endDrawer: AppDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height * 1.1,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/background-crew-mobile.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('02', style: kDestinationIndex),
                  const SizedBox(width: 18),
                  Text(
                    'meet you crew'.toUpperCase(),
                    style: kDestinationSubtitle,
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              CrewItem(data: widget.data),
            ],
          ),
        ),
      ),
    );
  }
}
