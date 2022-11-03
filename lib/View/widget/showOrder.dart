// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';

class ShowOrder extends StatefulWidget {
  const ShowOrder({Key? key}) : super(key: key);

  @override
  _ShowOrderState createState() => _ShowOrderState();
}

class _ShowOrderState extends State<ShowOrder> {
  @override
  Widget build(BuildContext context) {
    return SnackBar(content: (build(context)));
  }
}
