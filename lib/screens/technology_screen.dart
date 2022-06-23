import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/app_drawer.dart';
import '../components/technology_item.dart';

class TechnologyScreen extends StatefulWidget {
  const TechnologyScreen({Key? key, required this.data}) : super(key: key);

  static const String routeName = '/technology';

  final Map<String, dynamic> data;

  @override
  State<TechnologyScreen> createState() => _TechnologyScreenState();
}

class _TechnologyScreenState extends State<TechnologyScreen> {
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
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background-technology-mobile.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TechnologyItem(data: widget.data),
            ],
          ),
        ),
      ),
    );
  }
}
