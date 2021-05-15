import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neyu_shop/controllers/data_provider.dart';
import 'package:neyu_shop/models/address.dart' as custom;
import 'package:neyu_shop/models/customer.dart';
import 'package:neyu_shop/utils/utilities.dart';
import 'package:neyu_shop/utils/window_breakpoint.dart';
import 'package:neyu_shop/views/elements/FadePageRoute.dart';
import 'package:neyu_shop/views/elements/my_elevated_button.dart';
import 'package:neyu_shop/views/order_success.dart';

class CustomerForm extends StatefulWidget {
  @override
  _CustomerFormState createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  List<Customer> customers = [];
  Customer currentCustomer = Customer(
    "",
    "",
    custom.Address(
      "",
      "",
      "",
    ),
  );

  var phoneNumberController = TextEditingController();
  var nameController = TextEditingController();
  var provinceController = TextEditingController();
  var districtController = TextEditingController();
  var locatedPartController = TextEditingController();

  var formState = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    DataProvider.instance.getCustomers().then(
      (value) {
        customers = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    nameController.text = currentCustomer.name;
    provinceController.text = currentCustomer.address.province;
    districtController.text = currentCustomer.address.district;
    locatedPartController.text = currentCustomer.address.locatedPart;

    var phoneField = TextFormField(
      controller: phoneNumberController,
      decoration: InputDecoration(
        labelText: "Phone number",
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) return "This info is required";
        if (value.length != 10) return "Please use correct phone number";
        return null;
      },
      onChanged: (value) {
        if (value.length == 10 && value != currentCustomer.phoneNumber) {
          setState(
            () {
              currentCustomer = customers.firstWhere(
                (customer) {
                  return customer.phoneNumber == value;
                },
                orElse: () => Customer(
                  "",
                  "",
                  custom.Address(
                    "",
                    "",
                    "",
                  ),
                ),
              );
            },
          );
        }
      },
    );

    var nameField = TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        labelText: "Name",
      ),
      validator: (value) {
        if (value!.isEmpty) return "This info is required";
        return null;
      },
      textCapitalization: TextCapitalization.words,
    );

    var provinceField = TextFormField(
      controller: provinceController,
      decoration: InputDecoration(
        labelText: "Province",
      ),
      validator: (value) {
        if (value!.isEmpty) return "This info is required";
        return null;
      },
    );

    var districtField = TextFormField(
      controller: districtController,
      decoration: InputDecoration(
        labelText: "District",
      ),
      validator: (value) {
        if (value!.isEmpty) return "This info is required";
        return null;
      },
    );

    var locatedField = TextFormField(
      controller: locatedPartController,
      decoration: InputDecoration(
        labelText: "Street",
      ),
      validator: (value) {
        if (value!.isEmpty) return "This info is required";
        return null;
      },
    );

    var fields = [];
    if (getWindowType(MediaQuery.of(context).size.width) == WindowType.small) {
      fields = [
        phoneField,
        nameField,
        provinceField,
        districtField,
        locatedField,
      ];
    } else {
      fields = [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: phoneField,
              width: MediaQuery.of(context).size.width * 0.45,
            ),
            Container(
              child: nameField,
              width: MediaQuery.of(context).size.width * 0.45,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: provinceField,
              width: MediaQuery.of(context).size.width * 0.45,
            ),
            Container(
              child: districtField,
              width: MediaQuery.of(context).size.width * 0.45,
            ),
          ],
        ),
        locatedField,
      ];
    }

    return Form(
      key: formState,
      child: Column(
        children: [
          ...fields,
          buildSubmitButton(context),
        ],
      ),
    );
  }

  Widget buildSubmitButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: MyElevatedButton(
        onPressed: () {
          if (DataProvider.instance.currentOrder.entries.isEmpty) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Information"),
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                content: Text(
                    "Your cart is empty. Please go back to shop and add some items."),
                contentTextStyle: TextStyle(fontSize: 16.0),
                actions: [
                  MyElevatedButton(
                    message: "Okie",
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false);
                    },
                  ),
                ],
              ),
            );
          }

          if (formState.currentState!.validate()) {
            var submitedCustomer = Customer(
              phoneNumberController.text,
              nameController.text,
              custom.Address(
                provinceController.text,
                districtController.text,
                locatedPartController.text,
              ),
            );

            if (submitedCustomer != currentCustomer) {
              DataProvider.instance.writeCustomer(submitedCustomer);
            }

            DataProvider.instance.currentOrder.customer = submitedCustomer;
            DataProvider.instance.currentOrder.date = DateTime.now();
            DataProvider.instance.currentOrder.id =
                generateRandomString(5) + DateTime.now().toString();

            DataProvider.instance.writeOrder(
              DataProvider.instance.currentOrder,
            );

            DataProvider.instance.resetCurrentOrder();

            Navigator.of(context).push(
              FadePageRoute(
                SuccessOrder(),
              ),
            );
          }
        },
        message: 'Order',
      ),
    );
  }
}
