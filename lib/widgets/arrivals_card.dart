import 'package:flutter/material.dart';
import 'package:toko_sepatu/models/product_model.dart';
import 'package:toko_sepatu/pages/detail_product.dart';
import 'package:toko_sepatu/shared/theme.dart';

class ArrivalsCard extends StatelessWidget {
  final ProductModel product;
  const ArrivalsCard(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailProduct(product),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: defaultMargin),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: const Color(0xffECEDEF),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(product.galleries![0].url!),
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
                  product.category!.name!,
                  style: secondaryTextStyle.copyWith(fontSize: 12),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  product.name!,
                  style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  '\$${product.price}',
                  style: priceTextStyle.copyWith(fontWeight: medium),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
