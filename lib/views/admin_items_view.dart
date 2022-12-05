import 'package:coffee_shop_app/components/admin_item_list.dart';
import 'package:coffee_shop_app/components/itemsList.dart';
import 'package:flutter/material.dart';

class AdminItemsView extends StatelessWidget {
  const AdminItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AdminItemList(),
    );
  }
}