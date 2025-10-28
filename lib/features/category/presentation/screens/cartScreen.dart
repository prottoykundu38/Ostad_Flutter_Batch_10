import 'package:e_commerce_app/app/app_colors.dart';
import 'package:e_commerce_app/app/asset_paths.dart';
import 'package:e_commerce_app/app/constants.dart';
import 'package:e_commerce_app/features/products/presentation/widgets/total_price_and_cart_section.dart';
import 'package:e_commerce_app/features/shared/presentation/widgets/inc_dec_button.dart';
import 'package:flutter/material.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 4,
                  margin: EdgeInsetsDirectional.symmetric(horizontal: 16),
                  shadowColor: AppColors.themeColor.withOpacity(0.3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(4),
                        child: Image.asset(
                          Assetpaths.dummyImageSvg,
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nike Shoe - 2025 Edition',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      Text(
                                        'Size: - XL  Color: Red',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  )),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.delete_forever_outlined),
                                  ),
                                ],
                              ),
                              SizedBox(height: 14,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${takaSign}1000',
                                    style: TextStyle(color: AppColors.themeColor),
                                  ),
                                  IncDecButton(onChange: (int value){})
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 8,
                );
              },
            ),
          ),
          TotalPriceAndCartSection(),
        ],
      ),
    );
  }
}
