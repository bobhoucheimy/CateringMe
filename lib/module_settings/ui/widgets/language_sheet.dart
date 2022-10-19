import 'package:flutter/material.dart';

class LanguageSheet extends StatefulWidget {
  final Function(String) onLanguageChange;
  const LanguageSheet({ required this.onLanguageChange}) ;

  @override
  State<LanguageSheet> createState() => _LanguageSheetState();
}

class _LanguageSheetState extends State<LanguageSheet> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.3,
        maxChildSize: 0.3,
        builder: (context, scrollController) => Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  controller: scrollController,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: [
                    InkWell(
                      onTap: (){
                        widget.onLanguageChange('ar');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Text('العربية'),
                        Localizations.localeOf(context).languageCode == 'ar'
                            ? Icon(Icons.check)
                            : Container(),
                      ],


                      ),
                    ),
                    Divider(
                      thickness: 1,
                      endIndent: 30,
                      indent: 30,
                    ),
                    InkWell(
                      onTap: (){
                        widget.onLanguageChange('en');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('English'),
                          Localizations.localeOf(context).languageCode == 'en'
                              ? Icon(Icons.check)
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
