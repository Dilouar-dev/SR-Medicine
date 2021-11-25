import 'package:flutter/material.dart';
ListTile buildListTile(BuildContext context,String name,IconData icon,VoidCallback press,) {
  return ListTile(
    leading: Icon(icon),
    title: Text('$name'),
    onTap: press,
  );
}