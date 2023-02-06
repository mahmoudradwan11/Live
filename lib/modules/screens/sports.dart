import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live/core/controller/cubit.dart';
import 'package:live/core/controller/states.dart';
import 'package:live/modules/widgets/builder/costom_news.dart';
import 'package:live/modules/widgets/builder/divider.dart';

class SportsNews extends StatelessWidget {
  const SportsNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: const Text('Sports News')),
            body: ListView.separated(
              itemBuilder:(context,index)=>buildCustomNews(cubit.sportsModel!.articles[index]),
              separatorBuilder:(context,index)=>const BuildDivider(),
              itemCount:cubit.sportsModel!.articles.length,
            ),
          );
        }
        );
  }
}
