// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snack_overflow/Core/extension/build_extension.dart';

import '../../Core/Theme/app_color_style.dart';
import '../MarketPlace/marketPage/viewmodel/market_view_model.dart';

class SearchTextField extends ConsumerStatefulWidget {
  const SearchTextField({
    Key? key,
    required this.ref,
    required this.typingValue,
  }) : super(key: key);

  final WidgetRef ref;
  final String typingValue;

  @override
  ConsumerState<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends ConsumerState<SearchTextField> {
  final TextEditingController _searchingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColorStyle.instance.whitey, borderRadius: context.buttonRadius),
      child: TextField(
        textInputAction: TextInputAction.search,
        controller: _searchingController,
        onTap: () {
          widget.ref.read(typingStringProvider.notifier).state = 'tapping';
        },
        onChanged: (value) {
          if (value.isNotEmpty) {
            widget.ref.read(typingStringProvider.notifier).state = value;
          }
        },
        cursorColor: AppColorStyle.instance.clooney,
        keyboardType: TextInputType.name,
        autocorrect: false,
        autofocus: false,
        enableSuggestions: false,
        clipBehavior: Clip.none,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(decoration: TextDecoration.none),
        decoration: InputDecoration(
          suffixIcon: (widget.typingValue == "" || widget.typingValue.isEmpty)
              ? null
              : IconButton(
                  onPressed: () {
                    widget.ref.read(typingStringProvider.notifier).state = "";
                    _searchingController.text = "";
                  },
                  icon: Icon(
                    Icons.clear,
                    color: AppColorStyle.instance.clooney,
                  )),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: AppColorStyle.instance.clooney),
          hintText: "Search",
        ),
      ),
    );
  }
}
