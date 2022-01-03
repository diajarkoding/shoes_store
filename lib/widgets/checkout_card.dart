import 'package:flutter/material.dart';
import 'package:toko_sepatu/shared/theme.dart';

class CheckoutCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final int item;
  const CheckoutCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.fromLTRB(12, 10, 20, 14),
      decoration: BoxDecoration(
          color: backgroudColor4, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageUrl,
              width: 60,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '\$$price',
                  style: priceTextStyle.copyWith(fontWeight: semiBold),
                ),
              ],
            ),
          ),
          Text(
            '$item items',
            style: secondaryTextStyle.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
