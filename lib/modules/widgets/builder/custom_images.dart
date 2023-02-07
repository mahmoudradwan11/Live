import 'package:flutter/material.dart';
import 'package:live/models/screen_model.dart';
import 'package:live/modules/widgets/functions/navigate.dart';

Widget buildImage(AppImages appImages, context) => InkWell(
      onTap: () {
        navigateTo(context, appImages.route);
      },
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(appImages.image!),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
