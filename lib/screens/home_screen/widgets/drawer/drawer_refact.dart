import 'package:flutter/material.dart';
import 'package:newsapp1/constants/constants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(),
              currentAccountPicture: Container(
                decoration: BoxDecoration(
                    color: whiteclr,
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: secondaryclr.withOpacity(0.5),
                        borderRadius: BorderRadiusDirectional.circular(10)),
                    child: Center(
                        child: Text(
                      "RIS",
                    )),
                  ),
                ),
              ),
              accountName: Text(
                "Riswan ks",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                selectionColor: Colors.white,
              ),
              accountEmail: Text(
                "+919567090771",
                style: TextStyle(color: Colors.grey),
              )),
          Divider(
            thickness: 3,
          ),
          ListTile(
            leading: Icon(
              Icons.bookmark_border_outlined,
              size: 30,
            ),
            title: Text(
              'My Bookmarks',
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.newspaper,
              size: 30,
            ),
            title: Text(
              'Saved News',
            ),
            onTap: () {},
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            leading: Icon(
              Icons.home_work_outlined,
              size: 30,
            ),
            title: Text(
              'About World News',
            ),
            onTap: () {},
          ),
          ListTile(
              leading: Icon(
                Icons.privacy_tip_outlined,
                size: 30,
              ),
              title: Text(
                'Privacy and Policy',
              ),
              onTap: () {}),
          ListTile(
              leading: Icon(
                Icons.info_outline,
                size: 30,
              ),
              title: Text(
                'Terms of use',
              ),
              onTap: () {}),
          ListTile(
            leading: Icon(
              Icons.mail_outline_outlined,
              size: 30,
            ),
            title: Text(
              'Support',
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.share,
              size: 25,
            ),
            title: Text(
              'Share With friends',
            ),
            onTap: () {},
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
