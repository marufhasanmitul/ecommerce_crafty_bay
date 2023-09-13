import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({Key? key}) : super(key: key);

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {
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
                decoration: const InputDecoration(
                    hintText: 'Write Review',
                    contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 10)


                ),
                maxLines: 8,
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){},
                    child: const Text('Submit')
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
