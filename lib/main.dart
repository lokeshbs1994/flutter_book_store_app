import 'package:book_store_app/helpers/custom_route.dart';
import 'package:book_store_app/providers/auth.dart';
import 'package:book_store_app/providers/cart.dart';
import 'package:book_store_app/providers/orders.dart';
import 'package:book_store_app/screens/auth_screen.dart';
import 'package:book_store_app/screens/books_overview_screen.dart';
import 'package:book_store_app/screens/cart_screen.dart';
import 'package:book_store_app/screens/edit_book_screen.dart';
import 'package:book_store_app/screens/orders_screen.dart';
import 'package:book_store_app/screens/splash_screen.dart';
import 'package:book_store_app/screens/success_order_screen.dart';
import 'package:book_store_app/screens/user_books_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/books.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Books>(
            create: (_) => Books(null, '', []),
            update: (context, auth, previousBooks) {
              print('+++++++++++++++++++++++++++++');
              print(auth.token);

              return Books(
                auth.token ?? '',
                auth.userId,
                previousBooks == null ? [] : previousBooks.items,
              );
            }),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (_) => Orders(null, '', []),
          update: (ctx, auth, previousOrders) {
            print('+++++++++++++++++++++++++++');
            print(auth.token);
            print('*****************************');
            return Orders(
              auth.token ?? '',
              auth.userId,
              previousOrders == null ? [] : previousOrders.orders,
            );
          },
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, _) => MaterialApp(
          title: 'BookStore',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.deepOrange),
            fontFamily: 'Lato',
            pageTransitionsTheme: PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CustomPageTransitionBuilder(),
              },
            ),
          ),
          home: auth.isAuth
              ? BookOverviewScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (context, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : AuthScreen()),
          routes: {
            //   ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
            CartScreen.routeName: (context) => CartScreen(),
            OrderScreen.routeName: (context) => OrderScreen(),
            OrderSuccessful.routeName: (context) => OrderSuccessful(),
            UserBooksScreen.routeName: (context) => UserBooksScreen(),
            EditBookScreen.routeName: (context) => EditBookScreen(),
          },
        ),
      ),
    );
  }
}
