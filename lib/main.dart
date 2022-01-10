import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toko_sepatu/pages/cart_page.dart';
import 'package:toko_sepatu/pages/checkout_page.dart';
import 'package:toko_sepatu/pages/checkout_succes_page.dart';
import 'package:toko_sepatu/pages/edit_profile_page.dart';
import 'package:toko_sepatu/pages/home/detail_chat.dart';
import 'package:toko_sepatu/pages/home/main_page.dart';
import 'package:toko_sepatu/pages/login_page.dart';
import 'package:toko_sepatu/pages/signup_page.dart';
import 'package:toko_sepatu/pages/splash_page.dart';
import 'package:toko_sepatu/providers/auth_provider.dart';
import 'package:toko_sepatu/providers/cart_provider.dart';
import 'package:toko_sepatu/providers/product_provider.dart';
import 'package:toko_sepatu/providers/transaction_provider.dart';
import 'package:toko_sepatu/providers/wishlist_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const SplashPage(),
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignUpPage(),
          '/home': (context) => const MainPage(),
          '/detail-chat': (context) => const DetailChatPage(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/cart': (context) => const CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-success': (context) => const CheckoutSuccesPage(),
        },
      ),
    );
  }
}
