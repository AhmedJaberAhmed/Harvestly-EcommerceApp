import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/utils/app_text_styles.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onPressed;

  const CategoryCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.onPressed,
    this.unit = '',
    this.price = '',
  });

  final String price;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Image with loading indicator
          Stack(
            alignment: Alignment.center,
            children: [
              // Actual image
              Image.network(
                imageUrl,
                height: 100,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // Return the image when it is fully loaded
                  } else {
                    // Show a circular progress indicator while the image is loading
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              child: Text(
                "المنتجات ذات الصلة",
                style: TextStyles.bold13.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
