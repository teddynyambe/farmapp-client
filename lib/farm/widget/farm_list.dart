import 'package:farmapp_mobile/farm/view_model/farmlist_viewmodel.dart';
import 'package:farmapp_mobile/user/view_model/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'farm_item.dart';

class FarmList extends StatelessWidget {
  final UserViewModel loggedInUser;
  const FarmList({Key? key, required this.loggedInUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final farmVM = context.read<FarmListViewModel>();
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return FarmItem(
          farmViewModel: farmVM.farms[index],
          loggedInUser: loggedInUser,
        );
      },
      itemCount: farmVM.farms.length,
    );
  }
}
