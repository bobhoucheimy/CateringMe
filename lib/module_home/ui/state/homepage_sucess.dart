import 'package:carousel_slider/carousel_slider.dart';
import 'package:cater_me_v2/module_home/homepage_route.dart';
import 'package:cater_me_v2/module_home/ui/widget/destination_place_card.dart';
import 'package:cater_me_v2/module_home/ui/widget/menu_card.dart';
import 'package:cater_me_v2/module_home/ui/widget/title_home.dart';
import 'package:flutter/material.dart';
import '../../../abstracts/states/state.dart';
import '../../response/homepage_response.dart';
import '../screens/home_page_screen.dart';
import '../widget/Carousel_slider_widget/carousel_image_slider.dart';

class HomePageSuccess extends States {
  final HomePageResponse homepage;
  final HomePageScreenState homepageState;

  HomePageSuccess({required this.homepage, required this.homepageState});

  bool isArabic = false;

  @override
  Widget getUI(BuildContext context) {
    isArabic =
        Localizations.localeOf(context).languageCode == 'ar' ? true : false;
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          homepageState.getHome();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: 250,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                    ),
                    itemCount: homepage.ads?.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        CarouselImageSlider(
                          imageUrl: homepage.ads?[itemIndex].image ?? '',
                        )),
                TitleHome(
                  title: isArabic
                      ? homepage.packages?.nameAr ?? ''
                      : homepage.packages?.name ?? '',
                  body: '',
                  onArrowTap: () {
                    Navigator.pushNamed(context, HomePageRoutes.itemsList,
                        arguments: homepage.packages);
                  },
                ),
                Container(
                  height: 230,
                  child: GridView.builder(
                    // physics: BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (2 / 4),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 0,
                    ),
                    // controller: _controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: homepage.packages?.items?.length,
                    itemBuilder: (context, index) {
                      return MenusCard(
                        model: homepage.packages?.items![index],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: homepage.addons?.length,
                    itemBuilder: (context, index) {
                      return PackagesWithItems(
                        model: homepage.addons![index],
                      );
                    }),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
