import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live/core/controller/cubit.dart';
import 'package:live/core/controller/states.dart';
import 'package:live/modules/widgets/builder/costom_news.dart';
import 'package:live/modules/widgets/builder/divider.dart';


class  ScienceNews extends StatelessWidget {
  const ScienceNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder:(context,isScrolled)=>[
                const SliverAppBar(
                  leading: Icon(Icons.arrow_back,color: Colors.transparent,),
                  expandedHeight: 193,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image(image: AssetImage('images/science.png'),),
                  ),
                ),
              ],
              body: ListView.separated(
                itemBuilder:(context,index)=>buildCustomNews(cubit.businessModel!.articles[index]),
                separatorBuilder:(context,index)=>const BuildDivider(),
                itemCount:cubit.businessModel!.articles.length,
              ),
            ),
          );
        });
  }
}
