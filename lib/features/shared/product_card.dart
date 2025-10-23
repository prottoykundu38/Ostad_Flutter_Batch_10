import 'package:e_commerce_app/app/app_colors.dart';
import 'package:e_commerce_app/app/asset_paths.dart';
import 'package:e_commerce_app/app/constants.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shadowColor: AppColors.themeColor.withOpacity(0.2),
      child: SizedBox(
        width: 140,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  )),
              child: Image.asset(
                Assetpaths.dummyImageSvg,
                width: 140,
                height: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Nike Air Jordan A45GH',
                    maxLines: 1,
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  Row(
                    // spacing: 4;
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${takaSign}120',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.themeColor,
                        ),
                      ),
                      Wrap(
                        children: [
                          Icon(
                            Icons.star,
                            size: 18,
                            color: Colors.amber,
                          ),
                          Text('4.2'),
                        ],
                      ),
                      Card(
                        color: AppColors.themeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(
                            Icons.favorite_outline,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
