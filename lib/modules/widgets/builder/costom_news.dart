import 'package:flutter/material.dart';
import 'package:live/core/controller/cubit.dart';
import 'package:live/modules/screens/web_view.dart';
import 'package:live/modules/widgets/functions/navigate.dart';
Widget buildCustomNews(generalModel,context) {
  generalModel.urlToImage ??=
      'https://blog.rahulbhutani.com/wp-content/uploads/2020/05/Screenshot-2018-12-16-at-21.06.29.png';
  generalModel.description ??= 'No description for this news';
  return InkWell(
    onTap:(){
      navigateTo(context,Webview(generalModel.url!));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 370,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(generalModel.urlToImage!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              generalModel.title!,
              style: TextStyle(fontWeight: FontWeight.bold,
              color: NewsCubit.get(context).dark ? Colors.white : Colors.black
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'PublishedAt',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  generalModel.publishedAt!,
                  style: TextStyle(color: NewsCubit.get(context).dark ? Colors.white : Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              generalModel.description!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: NewsCubit.get(context).dark ? Colors.white : Colors.black
              ),
            )
          ],
        ),
      ),
    ),
  );
}
