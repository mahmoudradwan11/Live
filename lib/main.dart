import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live/core/constants/constants.dart';
import 'package:live/core/controller/cubit.dart';
import 'package:live/core/controller/states.dart';
import 'package:live/core/network/dio_helper.dart';
import 'package:live/core/network/local.dart';
import 'package:live/modules/screens/splash_screen.dart';
import 'core/bloc_observe.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  country = CacheHelper.getData(key: 'Country');
  print('Country  = $country');
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      NewsCubit()..getSports()..getBusiness()..getGeneral()..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Live',
              theme: lightTheme,
              home: const SplashScreen(),
            );
          }
      ),
    );
  }
}