import 'package:flutter/material.dart';
import 'package:toko_sepatu/shared/theme.dart';

class ArrivalsCard extends StatelessWidget {
  const ArrivalsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: const Color(0xffECEDEF),
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/image_shoes.png'),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Running',
                style: secondaryTextStyle.copyWith(fontSize: 12),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'Ultra 4D 5 Shoes',
                style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                    overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                '\$285,73',
                style: priceTextStyle.copyWith(fontWeight: medium),
              ),
            ],
          )
        ],
      ),
    );
  }
}
