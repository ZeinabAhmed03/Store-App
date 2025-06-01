import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/app_bloc_observer.dart';
import 'package:store_app/cubits/cart_cubit/cart_cubit.dart';
import 'package:store_app/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:store_app/cubits/products_cubit/products_cubit.dart';
import 'package:store_app/views/splash.dart';
void main() {
    Bloc.observer = AppBlocObserver();
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit(),
        ),
        BlocProvider(
          create: (context) => FavoritesCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Splash(),
      ),
    );
      
  }
}





