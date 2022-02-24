import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sr_medicine/Gb_Widget/buildListTile.dart';
import 'package:sr_medicine/Gb_Widget/change_page_route_view.dart';
import 'package:sr_medicine/Screens/Home/home_sceen.dart';

class Nav_Drawer extends StatefulWidget {
  const Nav_Drawer({Key? key}) : super(key: key);

  @override
  _Nav_DrawerState createState() => _Nav_DrawerState();
}

class _Nav_DrawerState extends State<Nav_Drawer> {
  _nextScreen(String name, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChangePageRouteView(
                url: url,
                name: name,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(

                  color: Colors.white,
                  image:  DecorationImage(
                      image: AssetImage('assets/icons/app_icon.png'),
                      fit: BoxFit.contain)),
              child: Container(),
            ),
            buildListTile(context, 'Home', Icons.home, () {
              Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_)=>HomeScreen()), (route) => false);
            }),
            buildListTile(context, 'Prescription', Icons.book_outlined, () {
              _nextScreen("Prescription",
                  'https://srmedicine.com.bd/prescription/');
            }),
            buildListTile(context, 'Doctor List', Icons.list_outlined, () {
              _nextScreen("Doctor List",
                  'https://srmedicine.com.bd/doctor-list/');
            }),
            buildListTile(context, 'Blog', Icons.web_outlined, () {
              _nextScreen("Blog", 'https://srmedicine.com.bd/blog/');
            }),
            buildListTile(context, 'My Cart', Icons.shopping_cart_outlined, () {
              _nextScreen("My Cart", 'https://srmedicine.com.bd/cart/');
            }),
            buildListTile(context, 'My Account', Icons.account_box_outlined, () {
              _nextScreen("My Account", 'https://srmedicine.com.bd/my-account/');
            }),
            buildListTile(context, 'About Us', Icons.menu_open_sharp, () {
              _nextScreen("About Us", 'https://srmedicine.com.bd/about/');
            }),
            buildListTile(context, 'Privacy Policy', Icons.more, () {
               _nextScreen('Privacy Policy', 'https://srmedicine.com.bd/privacy_policy.html');
            }),
          ],
        ),
      ),
    );
  }
}
