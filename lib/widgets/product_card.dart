import 'package:flutter/material.dart';
import 'package:toko_sepatu/shared/theme.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 215,
      height: 278,
      margin: const EdgeInsets.only(left: defaultMargin),
      decoration: BoxDecoration(
        color: const Color(0xffECEDEF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            'assets/image_shoes.png',
            width: 215,
            height: 150,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hiking',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  'COURT VISION 2.0',
                  style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  '\$58,67',
                  style: priceTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
