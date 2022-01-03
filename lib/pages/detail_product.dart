import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:toko_sepatu/shared/theme.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({Key? key}) : super(key: key);

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  List image = [
    'assets/image_shoes.png',
    'assets/image_shoes2.png',
    'assets/image_shoes3.png',
    'assets/image_shoes4.png',
    'assets/image_shoes5.png',
    'assets/image_shoes6.png',
    'assets/image_shoes7.png',
    'assets/image_shoes8.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
            color:
                currentIndex == index ? primaryColor : const Color(0xffC4C4C4),
            borderRadius: BorderRadius.circular(10)),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              right: defaultMargin,
              left: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.chevron_left,
                  ),
                ),
                const Icon(
                  Icons.shopping_bag,
                  color: backgroudColor1,
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: image
                .map((image) => Image.asset(
                      image,
                      width: MediaQuery.of(context).size.width,
                      height: 310,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: image.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 17),
        decoration: const BoxDecoration(
          color: backgroudColor1,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Content
            Container(
              margin: const EdgeInsets.fromLTRB(
                  defaultMargin, defaultMargin, defaultMargin, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TERREX URBAN LOW',
                          style: primaryTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        ),
                        Text(
                          'Hiking',
                          style: secondaryTextStyle.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/button_wishlist.png',
                    width: 46,
                  )
                ],
              ),
            ),

            // Price Content
            Container(
              margin: const EdgeInsets.fromLTRB(
                  defaultMargin, 20, defaultMargin, 0),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: backgroudColor2,
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$143,98',
                    style: priceTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                ],
              ),
            ),

            // Header Content
            Container(
              margin: const EdgeInsets.fromLTRB(
                  defaultMargin, defaultMargin, defaultMargin, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: primaryTextStyle.copyWith(fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Unpaved trails and mixed surfaces are easy when you have the traction and support you need. Casual enough for the daily commute.',
                    textAlign: TextAlign.justify,
                    style: subtitleTextStyle.copyWith(fontWeight: light),
                  )
                ],
              ),
            ),

            // Fimiliar Shoes Content
            Container(
              margin: const EdgeInsets.fromLTRB(
                  defaultMargin, defaultMargin, defaultMargin, 0),
              child: Text(
                'Fimiliar Shoes',
                style: primaryTextStyle.copyWith(fontWeight: medium),
              ),
            ),

            // Fimiliar Shoes Image Content
            Container(
              margin: const EdgeInsets.fromLTRB(15, 12, 15, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: image
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.asset(
                              e,
                              width: 54,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),

            // Fimiliar Shoes Image Content
            Container(
              margin: const EdgeInsets.fromLTRB(
                  defaultMargin, defaultMargin, defaultMargin, defaultMargin),
              child: Row(
                children: [
                  Image.asset(
                    'assets/button_chat.png',
                    width: 54,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: SizedBox(
                      // width: double.infinity,
                      height: 54,
                      // margin: const EdgeInsets.only(top: defaultMargin),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, '/signup');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'Add to Cart',
                          style: primaryTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: backgroudColor6,
        body: ListView(
          children: [
            header(),
            content(),
          ],
        ));
  }
}
