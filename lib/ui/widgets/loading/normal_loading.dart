import 'package:flutter/material.dart';

Widget normalLoading(BuildContext context) {
  return Center(
    child: CircularProgressIndicator(
      color: Theme.of(context).textTheme.subtitle1!.color,
    )
  );
}