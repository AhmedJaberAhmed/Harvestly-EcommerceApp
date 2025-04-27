import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class ProductViewHeader extends StatelessWidget {
  const ProductViewHeader({super.key, required this.productLenght});
final int productLenght;
  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [
            Text(
            '$productLenght  نتائج' ,
            textAlign: TextAlign.right,
            style: TextStyles.bold16,
          ), // Text
          const Spacer(),
          Container(
            padding: EdgeInsets.all(8),  // Reduced padding for smaller border space
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),  // Thinner border
              borderRadius: BorderRadius.circular(8),  // Slightly smaller border radius
            ),
            child: Icon(
              Icons.swap_vert,
              size: 24,  // Smaller icon size
              color: Colors.grey,
            ),
          )

          // Text
        ],
    ); // Row

  }
}
