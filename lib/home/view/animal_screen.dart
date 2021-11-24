import 'package:farmapp_mobile/farm/view_model/farm_viewmodel.dart';
import 'package:farmapp_mobile/farm/view_model/farmlist_viewmodel.dart';
import 'package:farmapp_mobile/home/view/widgets/farm_details.dart';
import 'package:farmapp_mobile/init/startups.dart';
import 'package:farmapp_mobile/user/view_model/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AnimalScreen extends StatefulWidget {
  final UserViewModel loggedInUser;
  const AnimalScreen({Key? key, required this.loggedInUser}) : super(key: key);

  @override
  _AnimalScreenState createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  final _controller = PageController(initialPage: 0);
  // List<FarmViewModel>? farms;
  // List<SpecieListViewModel>? species;
  @override
  void initState() {
    //Load List of Farms for logged in user
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      StartUps().loadFarms(context, widget.loggedInUser.userId);
      StartUps().loadFarmActivities(context, widget.loggedInUser.userId);
      StartUps().loadSpecies(context, widget.loggedInUser.userId);
      // await context
      //     .read<FarmListViewModel>()
      //     .fetchFarms(widget.loggedInUser.userId);
    });
    //Load Managed Species @ the farm
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<FarmViewModel> farms = context.read<FarmListViewModel>().farms;

    List<FarmDetails> farmList = [];
    farms.forEach((farm) => farmList.add(FarmDetails(farm: farm)));

    return Container(
        child: context.watch<FarmListViewModel>().loading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  farmList.length > 1
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: SmoothPageIndicator(
                            controller: _controller,
                            count: farmList.length,
                            effect: WormEffect(
                                activeDotColor: Theme.of(context).primaryColor,
                                dotColor: Theme.of(context).accentColor),
                          ),
                        )
                      : Container(),
                  Expanded(
                    // height: 400,
                    child: PageView(
                      controller: _controller,
                      children: farmList,
                    ),
                  ),
                ],
              )

        /*ListView.builder(
              scrollDirection: Axis.horizontal,
              // shrinkWrap: true,
              itemBuilder: (context, index) => FarmDetails(farm: farms[index]),
              itemCount: farms.length,
            ),*/
        );
  }
}
