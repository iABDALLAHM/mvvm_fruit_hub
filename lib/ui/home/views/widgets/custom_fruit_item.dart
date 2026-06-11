import 'package:flutter/material.dart';
import 'package:mvvm_fruit_hub/domain/models/utils/app_styles.dart';
import 'package:mvvm_fruit_hub/domain/models/products/product_model.dart';

class CustomFruitItem extends StatefulWidget {
  const CustomFruitItem({super.key, required this.product});
  final ProductModel product;
  @override
  State<CustomFruitItem> createState() => _CustomFruitItemState();
}

class _CustomFruitItemState extends State<CustomFruitItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.red,
      ),
      child: Row(
        children: [
          Text(
            widget.product.productName,
            style: AppStyles.textStyle13SemiBold,
          ),
          const SizedBox(width: 20),
          Text(
            "ج${widget.product.productPrice}",
            style: AppStyles.textStyle13SemiBold,
          ),
        ],
      ),
    );
  }
}
