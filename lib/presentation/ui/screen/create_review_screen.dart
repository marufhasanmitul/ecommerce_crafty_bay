import 'package:ecommerce_crafty_bay/presentation/state_holders/create_review_contorller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({Key? key, required this.productId, required this.rating}) : super(key: key);
  final int productId;
  final int rating;

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
  final TextEditingController _reviewTextEditingController=TextEditingController();

    final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review',style: TextStyle(
          color: Colors.black87,
        ),),
        leading: const BackButton(
          color: Colors.black87,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 35,),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'First Name'
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Last Name'
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: _reviewTextEditingController,
                  decoration: const InputDecoration(
                      hintText: 'Write Review',
                      contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 10)


                  ),
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'Please enter your Review';
                    }
                    return null;
                  },

                  maxLines: 8,
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<CreateReviewController>(
                    builder: (controller) {
                      if(controller.createReviewInProgress){
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      return ElevatedButton(
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              controller.createReview(
                                  _reviewTextEditingController.text.trim(),
                                  widget.productId,
                                  widget.rating
                              );
                            }
                          },
                          child: const Text('Submit')
                      );
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
