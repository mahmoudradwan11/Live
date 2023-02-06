import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live/core/controller/cubit.dart';
import 'package:live/core/controller/states.dart';
import 'package:live/modules/screens/business.dart';
import 'package:live/modules/screens/science.dart';
import 'package:live/modules/screens/sports.dart';
import 'package:live/modules/widgets/builder/costom_news.dart';
import 'package:live/modules/widgets/builder/divider.dart';
import 'package:live/modules/widgets/functions/navigate.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            drawer: const Drawer(
              backgroundColor: Colors.black,
            ),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Row(
                  children:const [
                    Text('News is',style: TextStyle(color: Colors.black)),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Live',style: TextStyle(color: Colors.blue,fontSize: 26),)
                  ]
            ),
              actions:[
                IconButton(onPressed:(){
                  print('search');
                }, icon: const Icon(Icons.search))
         ]
            ),
            body: SingleChildScrollView(
              child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        child: Row(
                          children:[
                            Expanded(
                              child: InkWell(
                                child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  image:const DecorationImage(
                                    image:AssetImage('images/general.jpg'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                ),
                                onTap:(){
                                  navigateAndReplace(context,const Home());
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: InkWell(
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    image:const DecorationImage(
                                      image:AssetImage('images/business.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                onTap:(){
                                  navigateTo(context,const BusinessNews());
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ), 
                            Expanded(
                              child: InkWell(
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    image:const DecorationImage(
                                      image:AssetImage('images/sports.png'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                onTap:(){
                                  navigateTo(context,const SportsNews());
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ), 
                            Expanded(
                              child: InkWell(
                                child: Container(
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    image:const DecorationImage(
                                      image:AssetImage('images/science.png'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                onTap:(){
                                  navigateTo(context, const ScienceNews());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder:(context,index)=>buildCustomNews(cubit.generalModel!.articles[index]),
                        separatorBuilder:(context,index)=>const BuildDivider(),
                        itemCount:cubit.generalModel!.articles.length,
                    ),
                  ],
                ),
            ),
          );
        }
    );
  }
}

