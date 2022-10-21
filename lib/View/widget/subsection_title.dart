import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'button_view_more.dart';

class SubsectionTitle extends StatefulWidget {
  final String subsectionTitle;
  final VoidCallback onPressed;
  const SubsectionTitle({
    Key? key,
    required this.subsectionTitle,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<SubsectionTitle> createState() => _SubsectionTitleState();
}

class _SubsectionTitleState extends State<SubsectionTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText(
          widget.subsectionTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        ButtonViewMore(
          onPressed: widget.onPressed,
        )
      ],
    );
  }
}
