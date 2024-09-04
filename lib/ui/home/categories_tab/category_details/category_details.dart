import 'package:flutter/material.dart';
import 'package:news_app_c11_friday/api_manager/api_manager.dart';
import 'package:news_app_c11_friday/ui/home/categories_tab/category_item.dart';

class CategoryDetails extends StatelessWidget {
  CategoryItem catItem;

  CategoryDetails({required this.catItem});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(catItem.categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data?.status == 'error' || snapshot.hasError) {
          return Center(
              child: Text(snapshot.data?.message ?? snapshot.error.toString()));
        }
        var sourcesList = snapshot.data?.sources ?? [];
        return ListView.builder(
          itemBuilder: (context, index) => Text(sourcesList[index]!.name!),
          itemCount: sourcesList.length,
        );
      },
    );
  }
}
