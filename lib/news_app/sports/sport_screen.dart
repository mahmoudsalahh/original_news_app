import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_news_app/shared.component/component.dart';
import 'package:original_news_app/shared_network/news_cubit/cubit.dart';
import 'package:original_news_app/shared_network/news_cubit/states.dart';


class Sport extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var list =NewsCubit.get(context).sport;
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit , NewsStates>(
          builder: (BuildContext context , NewsStates state)=>
          /*ListView.builder(
              itemCount: NewsCubit.get(context).business.length ,
              itemBuilder: (context ,index )=>Text('mahmoud')),*/
          ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context , index)=>NewsArtical(list[index],context),
              separatorBuilder: (context , index)=> Padding(
                padding: const EdgeInsets.all(1.0),
              ),
              itemCount:list.length) ,
          listener:(BuildContext context , NewsStates state){} ),

    );
  }
}