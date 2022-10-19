import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleHome extends StatelessWidget {
  final String title;
  final String body;
  final VoidCallback? onArrowTap;
  const TitleHome({required this.title, required this.body,   this.onArrowTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       const SizedBox(height: 10,),
        ListTile(
          minVerticalPadding: 0,
          contentPadding: EdgeInsetsDirectional.all(0),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontStyle: FontStyle.normal,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          trailing: InkWell(
              onTap: onArrowTap,
              child: Icon(Icons.arrow_forward, color: Theme.of(context).primaryColor)),
        ),

      ],
    );
  }
}
