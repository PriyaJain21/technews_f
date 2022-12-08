import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../backend/functions.dart';
import '../utils/colors.dart';

class SearchBar extends StatelessWidget {
   SearchBar({required this.handleSearch});

  final Function handleSearch;
  final TextEditingController searchcontroller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: AppColors.darkgrey,
                borderRadius: BorderRadius.circular(50)),
            child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                        child: TextField(
                          controller: searchcontroller,
                          decoration: InputDecoration(
                              hintText: 'Search a Keyword or a Phrase',
                              hintStyle: GoogleFonts.lato(),
                              border: InputBorder.none),
                        ))
                  ],
                )),
          ),
        ),
        InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
            handleSearch(searchcontroller.text);


          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: AppColors.darkgrey, shape: BoxShape.circle),
            child: Icon(
              Icons.search,
              color: AppColors.white,
            ),
          ),
        ),
        SizedBox(width: 10)
      ],
    );
  }
}