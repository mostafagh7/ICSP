import 'package:e_commerce/moduels/ask_for_peace/askforpece.dart';
import 'package:e_commerce/moduels/auth/log_in/binding_login_auth.dart';
import 'package:e_commerce/moduels/auth/log_in/log_in_controller.dart';
import 'package:e_commerce/moduels/auth/log_in/login_screen.dart';
import 'package:e_commerce/moduels/auth/sign_up/binding_signup.dart';
import 'package:e_commerce/moduels/auth/sign_up/confirm_code.dart';
import 'package:e_commerce/moduels/auth/sign_up/sign_up_screen.dart';
import 'package:e_commerce/moduels/cars/bindings_car.dart';
import 'package:e_commerce/moduels/cars/cars_screen.dart';
import 'package:e_commerce/moduels/cart/binding_cart.dart';
import 'package:e_commerce/moduels/cart/cart_screen.dart';
import 'package:e_commerce/moduels/category/category.dart';
import 'package:e_commerce/moduels/home/binding_home.dart';
import 'package:e_commerce/moduels/home/home_screen.dart';
import 'package:e_commerce/moduels/intro/intro_screen.dart';
import 'package:e_commerce/moduels/product/product_screen.dart';
import 'package:e_commerce/moduels/profile/profile_screen.dart';
import 'package:e_commerce/moduels/search/search_screen.dart';
import 'package:e_commerce/moduels/splash/spalsh_screen.dart';
import 'package:e_commerce/moduels/spare/spare_screen.dart';
import 'package:e_commerce/ss.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LogInController controller = Get.put(LogInController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, child) {
        controller.checkLoginStatus();
        return child!;
      },
      initialRoute: "tt",
      initialBinding: BindingHome(),
      getPages: [
        GetPage(
          name: "/home",
          page: () => HomeScreen(),
        ),
        GetPage(
          name: "/intro",
          page: () => const IntroPage(),
        ),
        GetPage(
          name: "/tt",
          page: () => const Tt(),
        ),
        GetPage(name: "/product", page: () => const ProductsScreen()),
        GetPage(
          name: "/search",
          page: () => SearchScreen(),
        ),
        GetPage(name: "/profile", page: () => const Profile()),
        GetPage(name: "/spare", page: () => const Spare()),
        GetPage(name: "/ask", page: () => AskForPiece()),
        GetPage(name: "/splash", page: () => const SplashScreen()),
        GetPage(name: "/category", page: () => const Category()),
        GetPage(
            name: "/login", page: () => LogInScreen(), binding: BindingLogIn()),
        GetPage(
            name: "/signup",
            page: () => SignUpScreen(),
            binding: BindingSignUP()),
        GetPage(
            name: "/confirmcode",
            page: () => ConfirmCode(),
            binding: BindingSignUP()),
        GetPage(
            name: "/carpage",
            page: () => const CarsPage(),
            binding: BindingCars()),
        GetPage(
            name: "/cart",
            page: () =>   CartScreen(),
            binding: BindingCart()),
      ],
    );
  }
}
