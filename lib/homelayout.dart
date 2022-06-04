import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_news_app/news_app/search/search_screen.dart';
import 'package:original_news_app/shared.component/component.dart';
import 'package:original_news_app/shared_network/app_cubit/cubit.dart';
import 'package:original_news_app/shared_network/news_cubit/states.dart';
import 'shared_network/news_cubit/cubit.dart';

class HomeLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(BuildContext context , NewsStates states){} ,
      builder:(BuildContext context , NewsStates states){
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title : Text('News App'),
           actions: [
             IconButton(
                 onPressed: (){
                   navigateTo(context, SearchScreen());
                 },
                 icon: Icon(Icons.search)),
             IconButton(
                  icon: Icon(Icons.brightness_4_outlined),
               onPressed: (){
                 AppCubit.get(context).changeAppTheme();
               },
             )],
          ),
          body: cubit.screens[cubit.currentIndex] ,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeItem(index);
            },
            items:cubit.BottomNav,
            ),



        );
      },
    );
  }
}
