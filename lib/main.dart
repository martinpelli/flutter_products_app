import 'package:flutter/material.dart';
import 'package:flutter_products_app/services/services.dart';
import 'package:flutter_products_app/ui/screens/home_screen.dart';
import 'package:flutter_products_app/ui/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: ((_) => ProductService())), ChangeNotifierProvider(create: ((_) => AuthService()))],
      child: ProductsApp(),
    );
  }
}

class ProductsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      title: 'Products App',
      routes: {
        'login': (_) => LoginScreen(),
        'checking': (_) => CheckAuthScreen(),
        'register': (_) => RegisterScreen(),
        'home': (_) => HomeScreen(),
        'product': (_) => ProductScreen()
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: const AppBarTheme(elevation: 0, color: Colors.indigo),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.indigo, elevation: 0)),
    );
  }
}
