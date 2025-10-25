import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/app/app_colors.dart';
import 'package:flutter/material.dart';

class HomeBannerSlider extends StatefulWidget {
  const HomeBannerSlider({
    super.key,
  });

  @override
  State<HomeBannerSlider> createState() => _HomeBannerSliderState();
}

class _HomeBannerSliderState extends State<HomeBannerSlider> {

  ValueNotifier<int> _currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: 180.0,
                viewportFraction: 1,
                onPageChanged: (int index, CarouselPageChangedReason reason) {
                  _currentIndex.value = index;
                  // setState(() {
                    
                  // });
                }),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: AppColors.themeColor,
                          borderRadius: BorderRadius.circular(8)),
                      alignment: Alignment.center,
                      child: Text(
                        'text $i',
                        style: TextStyle(fontSize: 16.0),
                      ));
                },
              );
            }).toList(),
          ),
          ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context, Value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      width: 12,
                      height: 12,
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: _currentIndex.value == i ? AppColors.themeColor : null,
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                ],
              );
            }
          ),
        ],
      ),
    );
  }
}
