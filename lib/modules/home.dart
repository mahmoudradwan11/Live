import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live/core/controller/cubit.dart';
import 'package:live/core/controller/states.dart';

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
            ),
            body: 
            Column(
              children: [
                Image(image: NetworkImage(cubit.sportsModel!.articles[0].urlToImage!)),
                Image(image: NetworkImage(cubit.businessModel!.articles[0].urlToImage!)),
                Image(image: NetworkImage(cubit.generalModel!.articles[0].urlToImage!)),
              ],
            ),
          );
        }
    );
  }
}
