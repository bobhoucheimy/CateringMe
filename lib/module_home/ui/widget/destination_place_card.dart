import 'package:cater_me_v2/module_home/homepage_route.dart';
import 'package:cater_me_v2/module_home/response/homepage_response.dart';
import 'package:cater_me_v2/module_home/ui/widget/item_card.dart';
import 'package:cater_me_v2/module_home/ui/widget/title_home.dart';
import 'package:flutter/material.dart';

class PackagesWithItems extends StatelessWidget {
  final Packages? model;
    PackagesWithItems({this.model});

  bool isArabic = false;
  @override
  Widget build(BuildContext context) {
    isArabic =  Localizations.localeOf(context).languageCode == 'ar'  ? true : false;
    return model!.items!.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleHome(
                  title:isArabic? model!.nameAr ?? '' : model!.name ?? '',
                  body: '',
                  onArrowTap: () {
                    Navigator.pushNamed(context, HomePageRoutes.itemsList,
                        arguments: model);
                  }),
              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return ItemCard(model: model!.items![index],width: 150,);
                  }),
                  itemCount: model!.items?.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                ),
              )
            ],
          )
        : Container();
  }
}
