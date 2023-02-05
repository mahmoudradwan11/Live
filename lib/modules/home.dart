import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live/core/constants/constants.dart';
import 'package:live/core/controller/cubit.dart';
import 'package:live/core/controller/states.dart';
import 'package:live/core/network/local.dart';
import 'package:live/models/sports_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          if (cubit.sportsModel == null) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('News'),
              ),
              body: Center(
                child: LoadingAnimationWidget.inkDrop(
                  size: 30,
                  color: Colors.deepOrange,
                ),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('News'),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.grey[300],
                    child: DropdownButton(
                      items: [
                        "eg","fr","de","cn","it","ru"
                      ].map((e) => DropdownMenuItem(
                          value: e,
                          child:Text(e),
                      )).toList(),
                      onChanged: (value) {
                        CacheHelper.saveData(key: 'Country', value: value);
                        print(value);
                        cubit.changeCountry(value);
                        country = CacheHelper.getData(key: 'Country');
                        cubit.getBusiness();
                      },
                      value:CacheHelper.getData(key:'Country'),
                    ),
                  ),
                )
              ],
            ),
            body:SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: Row(
                      children: [
                        Image(image:NetworkImage(cubit.sportsModel!.articles[1].urlToImage!)),
                        const Spacer(),
                        Image(image:NetworkImage(cubit.sportsModel!.articles[0].urlToImage!))
                      ],
                    ),
                  ),
                ],
              ),
            )
          );
        });
  }

  Widget buildCustomNew(ArticlesModel articlesModel) => Container(
        height: 100,
        child: Column(
          children: [
            Text(articlesModel.source!.name!),
            Text(articlesModel.publishedAt!),
          ],
        ),
      );
  Widget buildCarousel(SportsModel sportsModel) => CarouselSlider(
        items: sportsModel.articles
            .map((e) => Container(
                  child: Stack(
                    children: [
                      if (e.urlToImage != null)
                        Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(e.urlToImage!),
                              )),
                        )
                      else
                        Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://media.gemini.media/img/yallakora/Normal/\\2023\\1\\20\\الأهلي2023_1_20_19_22.jpg'),
                              )),
                        )
                    ],
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          height: 180.0,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          viewportFraction: 1.0,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ),
      );
}
