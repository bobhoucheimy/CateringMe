import 'package:cached_network_image/cached_network_image.dart';
import 'package:cater_me_v2/generated/l10n.dart';
import 'package:cater_me_v2/module_home/response/homepage_response.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class OrderItemCard extends StatefulWidget {
  final Item model;
  final VoidCallback onDelete;
  final bool isDarrby;
  const OrderItemCard({required this.model, required this.onDelete, required this.isDarrby});

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  bool isArabic  = false;


  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    isArabic =  Localizations.localeOf(context).languageCode == 'ar'  ? true : false;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:  Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: CachedNetworkImage(
                  key: UniqueKey(),
                  imageUrl:isArabic? widget.model.imageAr ?? '' : widget.model.image ?? '',
                  fit: BoxFit.cover,
                  height: 105,
                  color: Theme.of(context).cardColor,
                  imageBuilder: (context, imageProvider) => Container(
                    // width: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(20)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.contain,
                      ),
                      color: Theme.of(context).cardColor,
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
              SizedBox(width: 15,),
              Flexible(
                flex: 2,
                fit: FlexFit.loose,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(isArabic ? widget.model.titleAr ?? '' : widget.model.title ?? ''),
                    Text(
                      (  widget.isDarrby ? "${widget.model.daberniPrice}" :  "${widget.model.price}") +S.of(context).sar ,
                      style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          color: Colors.green.shade600),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: (){
                                      if (widget.model.selectedQuantity != widget.model.max) {
                                        widget.model.selectedQuantity =
                                        (widget.model.selectedQuantity! +
                                            widget.model.increment!);
                                      }
                                      setState(() {});
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.green.shade600,
                              ),
                            ),
                            // IconButton(
                            //     onPressed: () {
                            //       if (widget.model.selectedQuantity != widget.model.max) {
                            //         widget.model.selectedQuantity =
                            //         (widget.model.selectedQuantity! +
                            //             widget.model.increment!);
                            //       }
                            //       setState(() {});
                            //     },
                            //     icon: Icon(
                            //       Icons.add,
                            //       // size: 20,
                            //       color: Colors.green.shade600,
                            //     )),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(5 ,0 ,5, 0),
                              child: Text(
                                widget.model.selectedQuantity.toString(),
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            InkWell(onTap: (){
                                    if (widget.model.selectedQuantity != widget.model.min) {
                                      widget.model.selectedQuantity =
                                      (widget.model.selectedQuantity! -
                                          widget.model.increment!);
                                    }
                                    setState(() {});
                            },
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.minimize,
                                    // size: 20,
                                    color: Colors.green.shade600,
                                  ),
                                  SizedBox(height: 13,)
                                ],
                              ),
                            ),
                            // IconButton(
                            //     onPressed: () {
                            //       if (widget.model.selectedQuantity != widget.model.min) {
                            //         widget.model.selectedQuantity =
                            //         (widget.model.selectedQuantity! -
                            //             widget.model.increment!);
                            //       }
                            //       setState(() {});
                            //     },
                            //     icon: Icon(
                            //       Icons.minimize,
                            //       // size: 20,
                            //       color: Colors.green.shade600,
                            //     )),
                            InkWell(
                                onTap: widget.onDelete,
                                child: Icon(Icons.delete ,size: 20, color: Colors.red,)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Divider(thickness: 2,indent: 50,endIndent: 50,height: 1,)
        ],
      ),
    );
  }
}
