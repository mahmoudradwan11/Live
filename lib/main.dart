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
import 'core/theme/themes.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  bool? mode = CacheHelper.getData(key: 'mode');
  country = CacheHelper.getData(key: 'Country');
  print('Country  = $country');
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp(
    appMode: mode,
  ));
}

class MyApp extends StatelessWidget {
  final bool? appMode;
  const MyApp({super.key,this.appMode});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getSports()
        ..getBusiness()
        ..getGeneral()
        ..getScience()
        ..changeMode(fromShared: appMode),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Live',
              theme: lightTheme,
              themeMode: cubit.dark ? ThemeMode.dark : ThemeMode.light,
              darkTheme: darkTheme,
              home: const SplashScreen(),
            );
          }),
    );
  }
}
