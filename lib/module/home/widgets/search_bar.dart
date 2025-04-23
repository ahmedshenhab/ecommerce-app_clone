import 'package:flutter/material.dart';

class CUSTOMSearchBar extends StatefulWidget {
  const CUSTOMSearchBar({super.key});

  @override
  State<CUSTOMSearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<CUSTOMSearchBar> {
    String searchText = "";

  @override
  Widget build(BuildContext context) {
    return        Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'ابحث عن منتجاتك',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            )

        ;
  }
}