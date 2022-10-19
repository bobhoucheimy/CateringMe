import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class CarouselImageSlider extends StatefulWidget {
  final String imageUrl;

    CarouselImageSlider({required this.imageUrl});

  @override
  State<CarouselImageSlider> createState() => _CarouselImageSliderState();
}

class _CarouselImageSliderState extends State<CarouselImageSlider> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black38,
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                backgroundColor: Colors.black,
                body: Dismissible(
                  direction: DismissDirection.down,
                  key: const Key('key'),
                  onDismissed: (_) => Navigator.of(context).pop(),
                  movementDuration: const Duration(milliseconds: 5),
                  child: PinchZoom(
                    resetDuration: const Duration(milliseconds: 150),
                    onZoomStart: () {},
                    onZoomEnd: () {},
                    child: CachedNetworkImage(   imageUrl: widget.imageUrl,
                      imageBuilder: (context, imageProvider) =>
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),)
                  ),
                ),
              );
            });
      },
      child: CachedNetworkImage(
        // cacheManager: customCacheManager,
        // maxHeightDiskCache: 100,
        key: UniqueKey(),
        imageUrl: widget.imageUrl,
        imageBuilder: (context, imageProvider) =>
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
        // placeholder: (context, url) => Center(
        //   child: LoadingAnimationWidget.inkDrop(
        //       color: Theme.of(context).primaryColor,
        //       size: 20),
        // ),
        errorWidget: (context, url, error) =>
            Center(child: Icon(Icons.error)),
      ),
    );
  }
}
