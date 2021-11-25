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
                  image: DecorationImage(
                      image: AssetImage('assets/icons/app_icon.png'),
                      fit: BoxFit.contain)),
              child: Container(),
            ),
            buildListTile(context, 'Home', Icons.home, () {
              Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_)=>HomeScreen()), (route) => false);
            }),
            buildListTile(context, 'Prescription', Icons.book_outlined, () {
              _nextScreen("Prescription",
                  'https://shahanarahmanmedicine.com/prescription/');
            }),
            buildListTile(context, 'Doctor List', Icons.list_outlined, () {
              _nextScreen("Doctor List",
                  'https://shahanarahmanmedicine.com/doctor-list/');
            }),
            buildListTile(context, 'Blog', Icons.web_outlined, () {
              _nextScreen("Blog", 'https://shahanarahmanmedicine.com/blog/');
            }),
            buildListTile(context, 'My Cart', Icons.shopping_cart_outlined, () {
              _nextScreen("My Cart", 'https://shahanarahmanmedicine.com/cart/');
            }),
            buildListTile(context, 'My Account', Icons.account_box_outlined, () {
              _nextScreen("My Account", 'https://shahanarahmanmedicine.com/my-account/');
            }),
            buildListTile(context, 'About Us', Icons.menu_open_sharp, () {
              _nextScreen("About Us", 'https://shahanarahmanmedicine.com/about/');
            }),
            buildListTile(context, 'Contact Us', Icons.more, () {
              // _nextScreen("About Screen", About_Screen());
            }),
          ],
        ),
      ),
    );
  }
}
