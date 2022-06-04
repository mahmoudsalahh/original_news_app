import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_news_app/shared_network/app_cubit/states.dart';
import 'package:original_news_app/shared_network/chase_helper.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super(AppIntialState());
  static AppCubit get(context) => BlocProvider.of(context);


  bool isDark = false;
  void changeAppTheme(
      {bool? fromCache}
      ){
    if(fromCache != null){
      isDark == fromCache;
      emit(ChangeThemeState());
    }
    else{
    isDark = !isDark;
    print('mahmoud salahh');
    CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value){
      emit(AppChangeState());
      print(isDark);
    }).catchError((error){print(error.toString());}
    );
    }

  }

}