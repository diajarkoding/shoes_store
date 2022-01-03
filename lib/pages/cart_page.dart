import 'package:flutter/material.dart';
import 'package:toko_sepatu/shared/theme.dart';
import 'package:toko_sepatu/widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: backgroudColor1,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Your Cart',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
      );
    }

    Widget emptyCart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_empty_cart.png',
              width: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Opss! Your Cart is Empty',
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
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
      );
    }

    Widget content() {
      return ListView(
        children: const [CartCard()],
      );
    }

    Widget cstmBtmNav() {
      return SizedBox(
        height: 180,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$287,96',
                    style: priceTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              thickness: 0.3,
              color: subtitleTextColor,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/checkout');
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Continue to Checkout',
                        style: primaryTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: primaryTextColor,
                      ),
                    ],
                  )),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroudColor3,
      appBar: header(),
      body: content(),
      bottomNavigationBar: cstmBtmNav(),
    );
  }
}
