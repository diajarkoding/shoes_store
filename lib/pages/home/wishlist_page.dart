import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toko_sepatu/providers/page_provider.dart';
import 'package:toko_sepatu/providers/wishlist_provider.dart';
import 'package:toko_sepatu/shared/theme.dart';
import 'package:toko_sepatu/widgets/wishlist_card.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

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
                  onPressed: () {
                    pageProvider.currentIndex = 0;
                  },
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
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          children: wishlistProvider.wishlist
              .map(
                (product) => WishlistCard(product),
              )
              .toList(),
        ),
      ));
    }

    return Column(children: [
      header(),
      wishlistProvider.wishlist.isEmpty ? emptyWishlist() : content()
    ]);
  }
}
