import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/features/favorite/presentations/views/widgets/favorite_header.dart';
import 'package:flutter_e_commerce/features/favorite/presentations/views/widgets/favorite_items_list_grid.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HomeSearchBar(),
            FavoritetHeader(),
            FavoriteItemsListGrid(),
          ],
        ),
      ),
    );
  }
}



