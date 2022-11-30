import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toko_sepatu/models/message_model.dart';
import 'package:toko_sepatu/models/product_model.dart';
import 'package:toko_sepatu/providers/auth_provider.dart';
import 'package:toko_sepatu/services/message_service.dart';
import 'package:toko_sepatu/shared/theme.dart';
import 'package:toko_sepatu/widgets/chat_bubble.dart';

// ignore: must_be_immutable
class DetailChatPage extends StatefulWidget {
  ProductModel product;
  DetailChatPage(this.product, {Key? key}) : super(key: key);

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  TextEditingController messageController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleAddMessage() async {
      await MessageService().addMessage(
          user: authProvider.user,
          isFromUser: true,
          product: widget.product,
          message: messageController.text);
      setState(() {
        widget.product = UninitializedProductModel();
        messageController.text = '';
      });
    }

    PreferredSizeWidget header() {
      return PreferredSize(
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: backgroudColor1,
            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: primaryTextColor,
                      ),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
              child: Image.network(widget.product.galleries![0].url!),
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
                    widget.product.name!,
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: priceTextStyle.copyWith(fontWeight: medium),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.product = UninitializedProductModel();
                });
              },
              child: Image.asset(
                'assets/button_close.png',
                width: 22,
              ),
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
            widget.product is UninitializedProductModel
                ? const SizedBox()
                : productPreview(),
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
                        controller: messageController,
                        style: primaryTextStyle,
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
                GestureDetector(
                  onTap: handleAddMessage,
                  child: Image.asset(
                    'assets/button_send.png',
                    width: 45,
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService()
              .getMessagesByUserId(userId: authProvider.user.id!),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              debugPrint(snapshot.data.toString());
              return ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                children: snapshot.data!
                    .map((MessageModel message) => ChatBubble(
                          isSender: message.isFromUser!,
                          text: message.message!,
                          product: message.product!,
                        ))
                    .toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }

    return Scaffold(
      backgroundColor: backgroudColor3,
      appBar: header(),
      body: content(),
      bottomNavigationBar: chatInput(),
    );
  }
}
