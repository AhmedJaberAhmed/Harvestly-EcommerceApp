
class BottomNavigationBarEntity {
  final String activeImage;
  final String inActiveImage;
  final String name;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
          activeImage: "assets/images/home.svg",
          inActiveImage: "assets/images/homeout.svg",
          name: 'الرئيسية'),
      BottomNavigationBarEntity(
          activeImage: "assets/images/products.svg",
          inActiveImage: "assets/images/products_out.svg",
          name: 'المنتجات'),
      BottomNavigationBarEntity(
          activeImage: "assets/images/shopping-cart.svg",
          inActiveImage: "assets/images/shopping-cart_out.svg",
          name: 'سلة التسوق'),
      BottomNavigationBarEntity(
          activeImage: "assets/images/user.svg",
          inActiveImage: "assets/images/user _out.svg",
          name: 'حسابي'),



    ];
