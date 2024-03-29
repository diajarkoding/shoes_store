import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toko_sepatu/models/user_model.dart';
import 'package:toko_sepatu/providers/auth_provider.dart';
import 'package:toko_sepatu/providers/product_provider.dart';
import 'package:toko_sepatu/shared/theme.dart';
import 'package:toko_sepatu/widgets/arrivals_card.dart';
import 'package:toko_sepatu/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.name}',
                    style: primaryTextStyle.copyWith(
                        fontSize: 21, fontWeight: semiBold),
                  ),
                  Text(
                    '@${user.username}',
                    style: subtitleTextStyle.copyWith(
                        fontSize: 16, fontWeight: regular),
                  )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(user.profilePhotoUrl!),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget categories() {
      return Container(
          margin: const EdgeInsets.only(
            top: defaultMargin,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: defaultMargin,
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: primaryColor),
                  child: Text(
                    'All Shop',
                    style: primaryTextStyle.copyWith(
                        fontSize: 13, fontWeight: medium),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: subtitleTextColor),
                      borderRadius: BorderRadius.circular(12),
                      color: transparentColor),
                  child: Text(
                    'Running',
                    style: subtitleTextStyle.copyWith(
                        fontSize: 13, fontWeight: light),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: subtitleTextColor),
                      borderRadius: BorderRadius.circular(12),
                      color: transparentColor),
                  child: Text(
                    'Training',
                    style: subtitleTextStyle.copyWith(
                        fontSize: 13, fontWeight: light),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: subtitleTextColor),
                      borderRadius: BorderRadius.circular(12),
                      color: transparentColor),
                  child: Text(
                    'Basketball',
                    style: subtitleTextStyle.copyWith(
                        fontSize: 13, fontWeight: light),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: subtitleTextColor),
                      borderRadius: BorderRadius.circular(12),
                      color: transparentColor),
                  child: Text(
                    'Hiking',
                    style: subtitleTextStyle.copyWith(
                        fontSize: 13, fontWeight: light),
                  ),
                ),
              ],
            ),
          ));
    }

    Widget popularProductTitle() {
      return Container(
        margin: const EdgeInsets.only(top: defaultMargin, left: defaultMargin),
        child: Text(
          'Popular Products',
          style: primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
        ),
      );
    }

    Widget popularProductCard() {
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.products
                .map(
                  (product) => ProductCard(product),
                )
                .toList(),
          ),
        ),
      );
    }

    Widget newArrivalsTitle() {
      return Container(
        margin: const EdgeInsets.only(top: defaultMargin, left: defaultMargin),
        child: Text(
          'New Arrivals',
          style: primaryTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
        ),
      );
    }

    Widget newArrivalsCard() {
      return Container(
        margin: const EdgeInsets.only(top: 14, left: defaultMargin),
        child: Column(
          children: productProvider.products
              .map(
                (product) => ArrivalsCard(product),
              )
              .toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        categories(),
        popularProductTitle(),
        popularProductCard(),
        newArrivalsTitle(),
        newArrivalsCard()
      ],
    );
  }
}
