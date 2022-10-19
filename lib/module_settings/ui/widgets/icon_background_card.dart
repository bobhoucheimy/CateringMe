import 'package:flutter/material.dart';

class IconBackCard extends StatelessWidget {
 final String title;
  final IconData iconData;
  final VoidCallback onTapCard;
  const IconBackCard({required this.iconData ,required this.title, required this.onTapCard})  ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: onTapCard,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Theme.of(context).focusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
              ),
             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: Icon(iconData),
             ),),
           Text(title,style: TextStyle(fontSize: 12),)
          ],
        ),
      ),
    );
  }
}
