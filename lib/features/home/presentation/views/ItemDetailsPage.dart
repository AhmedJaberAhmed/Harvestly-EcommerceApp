import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerece_fruites/core/entities/product_Entity.dart';
import 'package:ecommerece_fruites/features/home/domain/entities/cart_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/cart_cubit/cart_cubit.dart';
import '../../../../core/utils/custom_colors.dart';

class ItemDetailsView extends StatefulWidget {
  const ItemDetailsView({super.key, required this.productEntity});

  static const routeName = 'ItemDetailsView';

  final ProductEntity productEntity;

  @override
  State<ItemDetailsView> createState() => _ItemDetailsViewState();
}

class _ItemDetailsViewState extends State<ItemDetailsView> {
  @override
  Widget build(BuildContext context) {
    final String name = widget.productEntity.name;
    final num price = widget.productEntity.price;
    final String description = widget.productEntity.description ?? '';
    final bool isOrganic = widget.productEntity.isOrganic ?? false;
    final int calories = widget.productEntity.numberOfCalories;
    final num avgRating = 4.5; // hardcoded fallback if avgRating is zero
    final String imageUrl = widget.productEntity.imageUrl ?? '';

    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: _buildBottomBar(context, price),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProductImage(imageUrl),
                  const SizedBox(height: 24),
                  _buildProductHeader(context, name, state),
                  const SizedBox(height: 28),
                  _buildStatsSection(avgRating, calories),
                  const SizedBox(height: 24),
                  _buildDescriptionSection(description, isOrganic),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Method to get the quantity for the product
  int _getProductQuantity(CartState state) {
    final cartItem = state.cartItems.firstWhere(
          (e) => e.productEntity.code == widget.productEntity.code,
      orElse: () => CartItemEntity(productEntity: widget.productEntity, quantity: 0),
    );
    return cartItem.quantity;
  }

  Widget _buildProductImage(String imageUrl) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(36),
        bottomRight: Radius.circular(36),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: 320,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildProductHeader(
      BuildContext context,
      String name,
      CartState state,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🍏 Name and location
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'متوفر',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // ➕ Quantity Control
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, color: Colors.grey),
                  onPressed: () {
                    final cartItem = CartItemEntity(productEntity: widget.productEntity, quantity: _getProductQuantity(state));
                    context.read<CartCubit>().decreaseCartItem(cartItem);
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                Text(
                  _getProductQuantity(state).toString(),
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: AppColors.primaryColor),
                  onPressed: () {
                    context.read<CartCubit>().addProduct(widget.productEntity);
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsSection(num avgRating, num calories) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _iconText(Icons.star, avgRating.toStringAsFixed(1)),
          _iconText(Icons.local_fire_department, '$calories Kcal'),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(String description, bool isOrganic) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'وصف المنتج',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
              height: 1.8,
            ),
          ),
          if (isOrganic) const SizedBox(height: 16),
          if (isOrganic)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'منتج عضوي',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context, num price) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, -2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 💸 Price
          Text(
            'ج.م ${price.toStringAsFixed(2)}',
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          // 🛒 Add to Cart
          ElevatedButton.icon(
            onPressed: () {
              context.read<CartCubit>().addProduct(widget.productEntity);
            },
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            label: const Text(
              'أضف إلى السلة',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconText(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
