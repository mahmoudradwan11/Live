import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live/core/controller/cubit.dart';
import 'package:live/core/controller/states.dart';
import 'package:live/modules/widgets/builder/costom_news.dart';
import 'package:live/modules/widgets/builder/divider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Search about World'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20)),
                      height: 55,
                      child: Center(
                        child: TextField(
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                              prefixIcon: Icon(
                                Icons.search_outlined,
                                color: Colors.black,
                              )),
                          onChanged: (value) {
                            cubit.searchNews(value);
                          },
                          onSubmitted: (value) {
                            cubit.searchNews(value);
                          },
                        ),
                      ),
                    ),
                    if (cubit.searchModel != null)
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => buildCustomNews(
                              cubit.searchModel!.articles[index]),
                          separatorBuilder: (context, index) =>
                              const BuildDivider(),
                          itemCount: cubit.searchModel!.articles.length)
                    else
                      const SizedBox(
                        height: 200,
                      ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage('images/search.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
