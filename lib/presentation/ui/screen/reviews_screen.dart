import 'package:ecommerce_crafty_bay/presentation/ui/widgets/circular_icon_button.dart';
import 'package:flutter/material.dart';
class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Reviews',
          style: TextStyle(
            color: Colors.black87
          ),
        ),
        leading: const BackButton(
            color: Colors.black87
        ),
        elevation: 0,
      ),
      body:ListView.builder(
          itemCount: 20,
          itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircularIconButton(
                            icon:Icons.person,
                            onTap: () {  },
                          ),
                          const SizedBox(width: 10,),
                          const Text("Maruf Hasan",style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500
                          ),)
                        ],
                      ),
                      const SizedBox(height: 10,),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                        ),),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
