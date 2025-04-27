
import 'package:ecommerece_fruites/features/checkout/domain/entities/order%20entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryAdress extends StatelessWidget {
  const DeliveryAdress({
    super.key, required this.pageController,
  });
   final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'عنوان التوصيل : ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),SizedBox(height: 6,),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(

              onTap: (){
                pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              },

              child: Row(
                children: [
                  Icon(Icons.location_on_outlined, size: 23,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'تعديل',
                    style: TextStyle(fontSize: 14),
                  ),
                  Spacer(),
                  Text(
                    "${context.read<OrderInputEntity>().shippingAddressEntity}",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(width: 8),
               //               Icon(Icons.location_on_outlined, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
 }
