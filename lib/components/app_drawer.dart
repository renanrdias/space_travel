import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../screens/technology_screen.dart';
import '../screens/crew_screen.dart';
import '../screens/destinations_screen.dart';
import '../kconstants.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      blur: 50,
      width: MediaQuery.of(context).size.width * 0.68,
      child: Drawer(
        backgroundColor: Color.fromRGBO(255, 255, 255, .04),
        child: Column(
          children: [
            const SizedBox(
              height: 34,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
              },
              trailing: SvgPicture.asset(
                'assets/images/icon-close.svg',
              ),
            ),
            const SizedBox(
              height: 65,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: ListTile(
                leading: Text('00', style: kSectionNumber),
                horizontalTitleGap: 11,
                title: Text(
                  'home'.toUpperCase(),
                  style: kSectionName,
                ),
                onTap: () => Navigator.of(context).pushReplacementNamed('/'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: ListTile(
                leading: Text('01', style: kSectionNumber),
                horizontalTitleGap: 11,
                title: Text(
                  'destination'.toUpperCase(),
                  style: kSectionName,
                ),
                onTap: () => Navigator.of(context)
                    .pushNamed(DestinationsScreen.routeName),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: ListTile(
                leading: Text('02', style: kSectionNumber),
                horizontalTitleGap: 11,
                title: Text(
                  'crew'.toUpperCase(),
                  style: kSectionName,
                ),
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(CrewScreen.routeName),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: ListTile(
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(TechnologyScreen.routeName),
                leading: Text('03', style: kSectionNumber),
                horizontalTitleGap: 11,
                title: Text(
                  'technology'.toUpperCase(),
                  style: kSectionName,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
