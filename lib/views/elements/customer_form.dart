import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:neyu_shop/controllers/data_provider.dart';
import 'package:neyu_shop/models/address.dart';
import 'package:neyu_shop/models/customer.dart';

class CustomerForm extends StatefulWidget {
  @override
  _CustomerFormState createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  String phoneNumber = "initdata";

  var phoneNumberController = TextEditingController();
  var nameController = TextEditingController();
  var provinceController = TextEditingController();
  var districtController = TextEditingController();
  var locatedPartController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.key,
      child: StreamBuilder(
        stream: DataProvider.instance.getCustomerInfo(phoneNumber),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          Customer customer;
          if (!snapshot.hasData) {
            customer = Customer(
              phoneNumber,
              "",
              Address(
                "",
                "",
                "",
              ),
            );
          } else {
            customer = Customer.fromJson(
              json.decode(
                json.encode(snapshot.data!.data()),
              ),
            );
          }

          nameController.text = customer.name;
          provinceController.text = customer.address.province;
          districtController.text = customer.address.district;
          locatedPartController.text = customer.address.locatedPart;

          return Column(
            children: [
              TextFormField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                  labelText: "Phone number",
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  print("data changed $value");
                  if (value.length == 10 && value != phoneNumber) {
                    setState(() {
                      phoneNumber = value;
                    });
                  }
                },
              ),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                ),
                textCapitalization: TextCapitalization.words,
              ),
              TextFormField(
                controller: provinceController,
                decoration: InputDecoration(
                  labelText: "Province",
                ),
              ),
              TextFormField(
                controller: districtController,
                decoration: InputDecoration(
                  labelText: "District",
                ),
              ),
              TextFormField(
                controller: locatedPartController,
                decoration: InputDecoration(
                  labelText: "Street",
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
