import 'package:farmapp_mobile/farm/view/crud_farm_screen.dart';
import 'package:farmapp_mobile/farm/view_model/farmlist_viewmodel.dart';
import 'package:farmapp_mobile/farm/widget/farm_list.dart';
import 'package:farmapp_mobile/more_settings/model_view/specielist_viewmodel.dart';
import 'package:farmapp_mobile/user/view/registration_screen.dart';
import 'package:farmapp_mobile/user/view_model/user_viewmodel.dart';
import 'package:farmapp_mobile/user/view_model/userregistration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoreSettingsScreen extends StatefulWidget {
  final UserViewModel loggedInUser;
  const MoreSettingsScreen({Key? key, required this.loggedInUser})
      : super(key: key);

  @override
  _MoreSettingsScreenState createState() => _MoreSettingsScreenState();
}

class _MoreSettingsScreenState extends State<MoreSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final userVM = context.watch<UserRegistrationViewModel>();
    // print("=====Activities: " +
    //     context
    //         .watch<SpecieListViewModel>()
    //         .currentFarmAnimals
    //         .length
    //         .toString());
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14.0, vertical: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${userVM.userViewModel.firstName} ${userVM.userViewModel.lastName}",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      // "Company name - ${userVM.userViewModel!.companyName}",
                      userVM.userViewModel.companyName.isEmpty
                          ? "Company name"
                          : userVM.userViewModel.companyName,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    context.watch<FarmListViewModel>().loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : FarmList(
                            loggedInUser: widget.loggedInUser,
                          ),
                    // Text("Test"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FarmScreen()));
                            },
                            child: Text("ADD FARM")),
                        VerticalDivider(),
                        TextButton(onPressed: () {}, child: Text("JOIN A FARM"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.grey.shade100),
            child: Column(
              children: [
                Container(
                  color: Colors.grey.shade300,
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.perm_identity_sharp,
                        ),
                        title: Text("User Profile"),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationScreen(
                                      userViewModel: userVM.userViewModel,
                                    ))),
                      ),
                      // ListTile(
                      //   leading: Icon(Icons.ac_unit),
                      //   title: Text("Livestock activities"),
                      //   subtitle: Container(
                      //     margin: EdgeInsets.only(left: 20),
                      //     height: 18,
                      //     child: ListView.separated(
                      //       itemBuilder: (_, index) => Text(context
                      //           .watch<SpecieListViewModel>()
                      //           .currentFarmAnimals[index]
                      //           .specie),
                      //       itemCount: context
                      //           .watch<SpecieListViewModel>()
                      //           .currentFarmAnimals
                      //           .length,
                      //       scrollDirection: Axis.horizontal,
                      //       separatorBuilder:
                      //           (BuildContext context, int index) =>
                      //               VerticalDivider(),
                      //     ),
                      //   ),
                      //   onTap: () async {
                      //     _showFarmActivitiesBottomSheet(
                      //         context, userVM.userViewModel!.userId);
                      //   },
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.grey.shade300),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () => userVM.logout(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      //Load farms for logged in user.
      // await context
      //     .read<FarmListViewModel>()
      //     .fetchFarms(widget.loggedInUser.userId);
    });
  }

  // _showFarmActivitiesBottomSheet(BuildContext context, String owner) {
  //   showModalBottomSheet(
  //       isDismissible: false,
  //       backgroundColor: Theme.of(context).accentColor,
  //       context: context,
  //       builder: (context) {
  //         return SpecieScreen(farmId: farmId);
  //       });
  // }
}
