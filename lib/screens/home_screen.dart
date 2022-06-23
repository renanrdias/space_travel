import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/app_drawer.dart';
import '../kconstants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
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
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background-home-mobile.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(
                height: 112,
              ),
              Text(
                'so, you want to travel to'.toUpperCase(),
                style: kHomeSubtitle,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'space'.toUpperCase(),
                style: kHomeTitle,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Let’s face it; if you want to go to space, you might as well genuinely go to outer space and not hover kind of on the edge of it. Well sit back, and relax because we’ll give you a truly out of this world experience!',
                style: kHomeBodyText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 81,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: const Color(0xFF979797),
                      ),
                    ),
                    child: Align(
                      child: Text(
                        'explore'.toUpperCase(),
                        style: GoogleFonts.bellefair(
                          color: const Color(0xFF0B0D17),
                          fontSize: 20,
                          letterSpacing: 1.25,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      endDrawer: AppDrawer(),
    );
  }
}
