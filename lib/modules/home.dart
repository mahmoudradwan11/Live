import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live/core/controller/cubit.dart';
import 'package:live/core/controller/states.dart';
import 'package:live/core/theme/themes.dart';
import 'package:live/modules/screens/search.dart';
import 'package:live/modules/widgets/builder/costom_news.dart';
import 'package:live/modules/widgets/builder/custom_images.dart';
import 'package:live/modules/widgets/builder/divider.dart';
import 'package:live/modules/widgets/functions/navigate.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          if(cubit.generalModel==null) {
            return Scaffold(
                appBar: AppBar(
                    elevation: 0.0,
                    title: Row(children: const [
                      Text('News is'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Live',
                        style: TextStyle(color: Colors.blue, fontSize: 26),
                      )
                    ]),
                    actions: [
                      IconButton(
                        onPressed: () {
                          cubit.changeMode();
                        },
                        icon: const Icon(
                          Icons.dark_mode_outlined,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            print('search');
                            navigateTo(context, const SearchScreen());
                          },
                          icon: const Icon(Icons.search)),
                    ]),
                body: Center(
                  child: LoadingAnimationWidget.inkDrop(
                    color: defaultColor,
                    size: 30,
                  ),
                )
            );
          }
          return Scaffold(
            drawer: const Drawer(
              backgroundColor: Colors.black,
            ),
            appBar: AppBar(
               // backgroundColor: Colors.white,
                elevation: 0.0,
                title: Row(children: const [
                  Text('News is'),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Live',
                    style: TextStyle(color: Colors.blue, fontSize: 26),
                  )
                ]),
                actions: [
                  IconButton(
                    onPressed:(){
                      cubit.changeMode();
                    },
                    icon:const Icon(
                      Icons.dark_mode_outlined,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        print('search');
                        navigateTo(context, const SearchScreen());
                      },
                      icon: const Icon(Icons.search)),
                ]),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          // physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              buildImage(cubit.imagesScreen[index], context),
                          separatorBuilder: (context, index) => const SizedBox(
                                width: 10,
                              ),
                          itemCount: cubit.imagesScreen.length),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildCustomNews(cubit.generalModel!.articles[index],context),
                      separatorBuilder: (context, index) =>
                          const BuildDivider(),
                      itemCount: cubit.generalModel!.articles.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
