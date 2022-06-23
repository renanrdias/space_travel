import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/app_drawer.dart';
import '../components/destination_item.dart';

import '../kconstants.dart';

class DestinationsScreen extends StatefulWidget {
  const DestinationsScreen({Key? key, required this.data}) : super(key: key);

  static const String routeName = '/destinations';
  final Map<String, dynamic> data;

  @override
  State<DestinationsScreen> createState() => _DestinationsScreenState();
}

class _DestinationsScreenState extends State<DestinationsScreen> {
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
        height: MediaQuery.of(context).size.height * 1.20,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/background-destination-mobile.jpg',
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
                  Text('01', style: kDestinationIndex),
                  const SizedBox(width: 18),
                  Text(
                    'pick your destination'.toUpperCase(),
                    style: kDestinationSubtitle,
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              DestinationItem(data: widget.data),
            ],
          ),
        ),
      ),
    );
  }
}
