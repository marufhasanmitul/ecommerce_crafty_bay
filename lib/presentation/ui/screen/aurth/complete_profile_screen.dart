
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/image_assets.dart';


class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  State<CompleteProfileScreen> createState() =>
      _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Center(
                      child: SvgPicture.asset(
                        ImageAssets.craftyBayLogoSvg,
                        width: 120,
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  Text("Complete Profile",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.black54, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Get Stared with us with your details",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.black54)),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    
                    
                    decoration: const InputDecoration(
                      hintText: "First Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your First Name';
                      }
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Last Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Last Name';
                      }
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Mobile Number",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Mobile Number';
                      }
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "City",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your City';
                      }
                    },
                  ),
                  const SizedBox(height: 10,),
                  TextFormField(
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: "Shipping Address",
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal:10 )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your Shipping Address';
                      }
                    },
                  ),




                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {

                            }
                          },
                          child: const Text(
                            "Complete",
                          )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
