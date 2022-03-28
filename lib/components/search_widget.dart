import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final void Function(String) onTextChange;

  const SearchBar({Key? key, required this.onTextChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mytheme = Theme.of(context);
    return Container(
        height: 50,
        padding: const EdgeInsets.all(8),
        color: mytheme.primaryColor,
        child: TextField(
            autofocus: false,
            onChanged: onTextChange,
            decoration: InputDecoration(
                filled: true,
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero)));
  }
}
