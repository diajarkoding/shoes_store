import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toko_sepatu/shared/theme.dart';
import 'package:toko_sepatu/widgets/chat_bubble.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return PreferredSize(
          child: AppBar(
            automaticallyImplyLeading: false,
            leading: const Icon(Icons.arrow_back_ios_new),
            backgroundColor: backgroudColor1,
            centerTitle: false,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image_shop_logo_online.png',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shoe Store',
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: regular),
                    ),
                    Text(
                      'Online',
                      style: secondaryTextStyle.copyWith(
                          fontWeight: light, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          preferredSize: const Size.fromHeight(70));
    }

    Widget productPreview() {
      return Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: 74,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: backgroudColor5,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: primaryColor,
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/image_shoes8.png'),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'COURT VISIO...',
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$57,15',
                    style: priceTextStyle.copyWith(fontWeight: medium),
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/button_close.png',
              width: 22,
            )
          ],
        ),
      );
    }

    Widget chatInput() {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: backgroudColor4,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                            hintText: 'Type Message...',
                            hintStyle: subtitleTextStyle),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/button_send.png',
                  width: 45,
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
        children: const [
          ChatBubble(
            text: 'Hi, This item is still available?',
            isSender: true,
            hasProduct: true,
          ),
          ChatBubble(
            text: 'Good night, This item is only available in size 42 and 43',
            isSender: false,
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroudColor3,
      appBar: header(),
      body: content(),
      bottomNavigationBar: chatInput(),
    );
  }
}
