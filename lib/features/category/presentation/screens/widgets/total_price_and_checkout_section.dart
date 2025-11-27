import 'package:e_commerce_app/app/app_colors.dart';
import 'package:e_commerce_app/app/constants.dart';
import 'package:e_commerce_app/features/category/presentation/controllers/cart_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';
import 'package:get/get.dart';

class TotalPriceAndCheckoutSection extends StatelessWidget {
  const TotalPriceAndCheckoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GetBuilder<CartListController>(builder: (controller) {
                return Text(
                  '$takaSign${controller.totalPrice}',
                  style: textTheme.titleMedium?.copyWith(
                    color: AppColors.themeColor,
                  ),
                );
              }),
            ],
          ),
          SizedBox(
            width: 120,
            child: FilledButton(
              onPressed: () async {
                final controller = Get.find<CartListController>();

                Sslcommerz sslcommerz = Sslcommerz(
                  initializer: SSLCommerzInitialization(
                    multi_card_name: "visa,master,bkash",
                    currency: SSLCurrencyType.BDT,
                    product_category: "Food",
                    sdkType: SSLCSdkType.TESTBOX,
                    store_id: "prott6925f1b2d8249",
                    store_passwd: "prott6925f1b2d8249@ssl",
                    total_amount: controller.totalPrice.toDouble(),
                    tran_id: DateTime.now().millisecondsSinceEpoch.toString(),
                  ),
                );

                // Just start payment, no result handling
                await sslcommerz.payNow();
              },
              child: Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
