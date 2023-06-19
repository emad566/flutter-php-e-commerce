import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/items/presentations/views/list/widgets/items_categories_list_view.dart';
import 'package:flutter_e_commerce/features/items/presentations/views/list/widgets/items_list_grid.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0XffEEeeEE),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HomeSearchBar(),
              SizedBox(height: 20,),
              ItemsCategoriesListView(),
              ItemsListGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
