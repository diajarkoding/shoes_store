import 'package:flutter/material.dart';
import 'package:toko_sepatu/shared/theme.dart';
import 'package:toko_sepatu/widgets/wishlist_card.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        title: const Text('Favorite Shoes'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: backgroudColor1,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroudColor3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image_wishlist.png',
                width: 80,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                ' You don\'t have dream shoes?',
                style:
                    primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Let\'s find your favorite shoes',
                style: secondaryTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 44,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    primary: primaryColor,
                  ),
                  child: Text(
                    'Explore Store',
                    style: primaryTextStyle.copyWith(
                        fontSize: 16, fontWeight: medium),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
          child: Container(
        width: double.infinity,
        color: backgroudColor3,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          children: const [
            WishlistCard(
                imageUrl: 'assets/image_shoes.png',
                title: 'Terrex Urban Lowwwwwwwww',
                price: 143.98),
            WishlistCard(
                imageUrl: 'assets/image_shoes2.png',
                title: 'Terrex Urban Low',
                price: 143.98),
            WishlistCard(
                imageUrl: 'assets/image_shoes3.png',
                title: 'Terrex Urban Low',
                price: 143.98),
          ],
        ),
      ));
    }

    return Column(children: [header(), content()]);
  }
}
