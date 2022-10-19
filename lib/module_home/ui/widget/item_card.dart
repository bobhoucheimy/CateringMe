import 'package:cached_network_image/cached_network_image.dart';
import 'package:cater_me_v2/generated/l10n.dart';
import 'package:cater_me_v2/module_home/homepage_route.dart';
import 'package:cater_me_v2/module_home/response/homepage_response.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ItemCard extends StatelessWidget {
  final Item model;
  final double width;
    ItemCard({
    required this.model, required this.width,
  });

    bool isArabic = false;
  @override
  Widget build(BuildContext context) {
    isArabic =  Localizations.localeOf(context).languageCode == 'ar'  ? true : false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, HomePageRoutes.itemsDetails,
                arguments: model);
          },
          child: Card(
            color: Theme.of(context).cardColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,

            child: Hero(
              tag: model.image ?? '',
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: CachedNetworkImage(
                  key: UniqueKey(),
                  imageUrl: isArabic ? model?.imageAr??'' : model?.image ?? '',
                  fit: BoxFit.cover,
                  height: 130,
                  width: width,
                  imageBuilder: (context, imageProvider) => Container(
                    // width: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Center(
                    child: LoadingAnimationWidget.inkDrop(
                        color: Theme.of(context).primaryColor, size: 20),
                  ),
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error)),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 150,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 8, top: 3),
            child: Text(
              isArabic ?  "${model.titleAr}" :"${model.title}"  ,
              style: GoogleFonts.poppins(
                fontStyle: FontStyle.normal,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 8),
          child: Text(
            "${model.price}" + S.of(context).sar ,
            style: TextStyle(color: Colors.green.shade600),
          ),
        ),
      ],
    );
  }
}
