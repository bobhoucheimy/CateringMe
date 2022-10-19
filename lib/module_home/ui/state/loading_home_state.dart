import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cater_me_v2/abstracts/states/state.dart';

class LoadingHomePage extends States {
  @override
  Widget getUI(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      // enabled: _enabled,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 250.0,
                color: Colors.white,
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    height: 30.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 300,
                    height: 15.0,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 230,
                child: GridView.builder(
                  // physics: BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (2 / 4),
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 20,
                  ),
                  // controller: _controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.white,
                      width: 30,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    height: 30.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: 300,
                    height: 15.0,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 230,
                child: GridView.builder(
                  // physics: BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (2 / 4),
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 20,
                  ),
                  // controller: _controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.white,
                      width: 30,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
