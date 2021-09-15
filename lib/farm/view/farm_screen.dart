import 'package:farmapp_mobile/enums/size_type.dart';
import 'package:farmapp_mobile/farm/view_model/farm_viewmodel.dart';
import 'package:farmapp_mobile/farm/view_model/farmlist_viewmodel.dart';
import 'package:farmapp_mobile/farm/view_model/crudfarm_viewmodel.dart';
import 'package:farmapp_mobile/user/view_model/userregistration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FarmScreen extends StatefulWidget {
  final farmId;
  const FarmScreen({Key? key, this.farmId}) : super(key: key);
  static const routeName = "/save_farm";

  @override
  _FarmScreenState createState() => _FarmScreenState();
}

class _FarmScreenState extends State<FarmScreen> {
  List<bool> _isSelected = [true, false];
  List<SizeType> _selectedSizeType = [SizeType.Acres, SizeType.Hectares];
  FarmViewModel? selectedFarm;
  CrudFarmViewModel? saveFarmVM;
  final _formKey = GlobalKey<FormState>();
  // TextEditingController _farmName = TextEditingController();

  @override
  void dispose() {
    // _farmName.dispose();
    print("Destroying object");
    super.dispose();
  }

  @override
  void initState() {
    selectedFarm = widget.farmId == null
        ? null
        : context.read<FarmListViewModel>().getFarmById(widget.farmId);
    saveFarmVM = context.read<CrudFarmViewModel>();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _toggleSizeType(selectedFarm == null
          ? 0
          : selectedFarm!.sizeType == SizeType.Acres
              ? 0
              : 1);
    });
    super.initState();
  }

  void _toggleSizeType(int index) {
    saveFarmVM!.sizeType = _selectedSizeType[index];
    setState(() {
      if (index == 1) {
        _isSelected[1] = true;
        _isSelected[0] = false;
        print("Expecting 1: $index");
      } else {
        _isSelected[0] = true;
        _isSelected[1] = false;
        print("Expecting 0: $index");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final userVM = context.read<UserRegistrationViewModel>();

    saveFarmVM!.owner = userVM.user.userId;

    saveFarmVM!.id = selectedFarm == null ? "" : selectedFarm!.id;
    saveFarmVM!.addressId = selectedFarm == null ? "" : selectedFarm!.addressId;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Farm Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    initialValue:
                        selectedFarm == null ? null : selectedFarm!.farmName,
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        saveFarmVM!.farmName = value;
                      } else {
                        return "Field cannot be empty";
                      }
                      // return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Farm name",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          // controller: _farmSize,
                          initialValue: selectedFarm == null
                              ? null
                              : selectedFarm!.farmSize,
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              saveFarmVM!.farmSize = value;
                            } else {
                              return "Field cannot be empty";
                            }
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Farm size",
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(_isSelected[0] == true ? "Acre(s)" : "Hectare(s)"),
                      SizedBox(
                        width: 10,
                      ),
                      ToggleButtons(
                        children: [
                          Icon(
                            Icons.radio_button_checked_sharp,
                            color: _isSelected[0] == true
                                ? Colors.green
                                : Colors.grey.shade600,
                          ),
                          Icon(
                            Icons.radio_button_checked_sharp,
                            color: _isSelected[1] == true
                                ? Colors.green
                                : Colors.grey.shade600,
                          ),
                        ],
                        isSelected: _isSelected,
                        onPressed: (int index) {
                          _toggleSizeType(index);
                        },
                      )
                    ],
                  ),
                  TextFormField(
                    // controller: _lineOne,
                    initialValue:
                        selectedFarm == null ? null : selectedFarm!.lineOne,
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        saveFarmVM!.lineOne = value;
                      } else {
                        return "Field cannot be empty";
                      }
                    },
                    decoration: InputDecoration(labelText: "Address Line one"),
                  ),
                  TextFormField(
                    // controller: _lineTwo,
                    initialValue:
                        selectedFarm == null ? null : selectedFarm!.lineTwo,
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        saveFarmVM!.lineTwo = value;
                      } else {
                        return "Field cannot be empty";
                      }
                    },
                    decoration: InputDecoration(labelText: "Address Line two"),
                  ),
                  Row(
                    children: [
                      Text(
                        "Coordinates:",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      VerticalDivider(width: 10.0),
                      Expanded(
                        child: TextFormField(
                          // controller: _latitude,
                          initialValue: selectedFarm == null
                              ? null
                              : selectedFarm!.latitude,
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              saveFarmVM!.latitude = value;
                            } else {
                              return "Field cannot be empty";
                            }
                          },
                        ),
                      ),
                      VerticalDivider(width: 10.0),
                      Expanded(
                        child: TextFormField(
                          // controller: _longitude,
                          initialValue: selectedFarm == null
                              ? null
                              : selectedFarm!.longitude,
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              saveFarmVM!.longitude = value;
                            } else {
                              return "Field cannot be empty";
                            }
                          },
                          decoration: InputDecoration(labelText: "Longitude"),
                        ),
                      ),
                    ],
                  ),
                  Row(children: [
                    Expanded(
                      child: TextFormField(
                        // controller: _country,
                        initialValue:
                            selectedFarm == null ? null : selectedFarm!.country,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            saveFarmVM!.country = value;
                          } else {
                            return "Field cannot be empty";
                          }
                        },
                        decoration: InputDecoration(labelText: "Country"),
                      ),
                    ),
                    VerticalDivider(
                      width: 50.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        // controller: _province,
                        initialValue: selectedFarm == null
                            ? null
                            : selectedFarm!.province,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            saveFarmVM!.province = value;
                          } else {
                            return "Field cannot be empty";
                          }
                        },
                        decoration: InputDecoration(labelText: "Province"),
                      ),
                    ),
                  ]),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          // controller: _town,
                          initialValue:
                              selectedFarm == null ? null : selectedFarm!.town,
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              saveFarmVM!.town = value;
                            } else {
                              return "Field cannot be empty";
                            }
                          },
                          decoration: InputDecoration(labelText: "Town"),
                        ),
                      ),
                      VerticalDivider(
                        width: 50.0,
                      ),
                      Expanded(
                        child: TextFormField(
                          // controller: _areaName,
                          initialValue: selectedFarm == null
                              ? null
                              : selectedFarm!.areaName,
                          validator: (value) {
                            if (value!.isNotEmpty) {
                              saveFarmVM!.areaName = value;
                            } else {
                              return "Field cannot be empty";
                            }
                          },
                          decoration:
                              InputDecoration(labelText: "Farm location"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("Cancel")),
                        TextButton(
                            onPressed:
                                context.watch<CrudFarmViewModel>().loading
                                    ? null
                                    : () async {
                                        if (_formKey.currentState!.validate()) {
                                          await saveFarmVM!.saveFarm();
                                          final snackBar = SnackBar(
                                            backgroundColor:
                                                Theme.of(context).primaryColor,
                                            content: Text(
                                              selectedFarm == null
                                                  ? "Farm details added."
                                                  : "Farm details updated.",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            snackBar,
                                          );
                                          context
                                              .read<FarmListViewModel>()
                                              .fetchFarms(userVM.user.userId);
                                          Navigator.of(context).pop();
                                        }
                                      },
                            child: context.watch<CrudFarmViewModel>().loading
                                ? CircularProgressIndicator()
                                : Text("Save"))
                      ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
