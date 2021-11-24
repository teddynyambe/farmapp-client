import 'package:farmapp_mobile/user/view_model/user_viewmodel.dart';
import 'package:farmapp_mobile/user/view_model/userregistration_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  static final String routeName = "/user_registration";
  final UserViewModel? userViewModel;

  RegistrationScreen({userViewModel}) : this.userViewModel = userViewModel;

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var vm = context.watch<UserRegistrationViewModel>();
    if (widget.userViewModel != null) {
      vm.userId = widget.userViewModel!.userId;
      vm.id = widget.userViewModel!.id;
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    widget.userViewModel != null
                        ? "${widget.userViewModel!.firstName} ${widget.userViewModel!.lastName}"
                        : "Register",
                    style: TextStyle(fontSize: 30),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "First name",
                    ),
                    // controller: _firstName,
                    initialValue: widget.userViewModel == null
                        ? null
                        : widget.userViewModel!.firstName,
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        vm.firstName = value;
                      } else {
                        return "Field cannot be empty.";
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Last name"),
                    // controller: _lastName,
                    initialValue: widget.userViewModel == null
                        ? null
                        : widget.userViewModel!.lastName,
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        vm.lastName = value;
                      } else {
                        return "Field cannot be empty.";
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Company name"),
                    // controller: _lastName,
                    initialValue: widget.userViewModel == null
                        ? null
                        : widget.userViewModel!.companyName,
                    validator: (value) {
                      vm.companyName = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Mobile number"),
                    initialValue: widget.userViewModel == null
                        ? null
                        : widget.userViewModel!.mobileumber,
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        vm.mobileNumber = value;
                      } else {
                        return "Field cannot be empty.";
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                    initialValue: widget.userViewModel == null
                        ? null
                        : widget.userViewModel!.email,
                    validator: (value) {
                      vm.email = value;
                    },
                  ),
                  if (widget.userViewModel == null)
                    TextFormField(
                        decoration: InputDecoration(labelText: "Username"),
                        initialValue: widget.userViewModel == null
                            ? null
                            : widget.userViewModel!.username,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            vm.username = value;
                          } else {
                            return "Field cannot be empty.";
                          }
                        }),
                  if (widget.userViewModel == null)
                    TextFormField(
                        decoration:
                            InputDecoration(labelText: "Enter password"),
                        initialValue: widget.userViewModel == null
                            ? null
                            : widget.userViewModel!.password,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            vm.password = value;
                          } else {
                            return "Field cannot be empty.";
                          }
                        }),
                  if (widget.userViewModel == null)
                    TextFormField(
                        decoration:
                            InputDecoration(labelText: "Confirm password"),
                        initialValue: widget.userViewModel == null
                            ? null
                            : widget.userViewModel!.password,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            vm.passwordConfirm = value;
                          } else {
                            return "Field cannot be empty.";
                          }
                        }),
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("<< Back to Login"),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        if (widget.userViewModel != null) {
                          await vm.saveOnFarmAppServer();
                          if (vm.isUpdated) {
                            final snackBar = SnackBar(
                              backgroundColor: Theme.of(context).primaryColor,
                              content: Text(
                                "User updated successfully",
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              snackBar,
                            );
                            await vm.getUserOnFarmAppServer(
                                widget.userViewModel!.userId);
                            Navigator.of(context).pop();
                          }
                        } else {
                          await vm.registerUser();
                        }
                      }
                    },
                    child: Text(widget.userViewModel == null
                        ? "Register"
                        : "Update Info"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
