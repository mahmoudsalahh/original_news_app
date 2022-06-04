import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:original_news_app/shared.component/component.dart';
import 'package:original_news_app/shared_network/news_cubit/cubit.dart';
import 'package:original_news_app/shared_network/news_cubit/states.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context , state){},
      builder: (context , state){
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body:Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: defaulttextformfeild(
                  controller: searchController,
                  label: 'Search',
                  prefix: Icons.search ,
                  type: TextInputType.text,
                  onchange:(value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (value){
                    if(value.isEmpty){
                      return 'this is Empty Field';
                    }
                    return null;
                  },
                ),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),

                    itemBuilder: (context , index)=>NewsArtical(list[index],context),
                    separatorBuilder: (context , index)=> Padding(
                      padding: const EdgeInsets.all(1.0),
                    ),
                    itemCount:list.length),
              ),
            ) ,



            ],
          ),
        );
      },

    );
  }
}
