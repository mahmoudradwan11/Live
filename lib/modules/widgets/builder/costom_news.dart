import 'package:flutter/material.dart';

Widget buildCustomNews(generalModel){
    return Container(
      height: 300,
      width: double.infinity,
      color: Colors.deepOrange,
      child: Text(
        generalModel.publishedAt!,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );

}
