import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:original_news_app/homelayout.dart';
import 'package:original_news_app/shared_network/app_cubit/cubit.dart';
import 'package:original_news_app/shared_network/app_cubit/states.dart';
import 'package:original_news_app/shared_network/chase_helper.dart';
import 'package:original_news_app/shared_network/dio_helper.dart';
import 'package:original_news_app/shared_network/news_cubit/cubit.dart';
import 'package:original_news_app/styles/themes.dart';

void main() async
{
  //بيتأكد اني كل حاجة في ال main خلصت وبعدين يفتح الأبليكشن
 WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
 //var onBoarding =  CacheHelper.getData(key: 'onBoarding');
 //var token = CacheHelper.getData(key: 'token');
//print(token);

    // Widget isWidget;
    //   if(onBoarding != null){
    //    if(token != null){
    //     isWidget= HomeScreen();}
    //    else {
    //      isWidget= LoginScreen();
    //    }
    //    }else{
    //     isWidget= OnBoardingScreen();
    //   }

 runApp( MyApp(
  isDark: isDark,
   //isWidget:isWidget,

  ));
}
class MyApp extends StatelessWidget {
  bool? isDark ;
  //final Widget? isWidget;

  MyApp({isDark});

  @override
  Widget build(BuildContext context ) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => NewsCubit()..getBusines()..getSport()..getScience(),),
        BlocProvider(create: (BuildContext context) => AppCubit()
          ..changeAppTheme(fromCache:isDark),),
        //BlocProvider(create: (BuildContext context) => HomeCubit()
          //..getHomeData()..getCategoriesData()..getFavoritesData()..getUserData()),
      ],
      child:BlocConsumer< AppCubit , AppState >(
        listener: (context , state){},
        builder: (context , state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme:darkTheme,
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: HomeLayout(),
          );
        },
    ));

  }

}





