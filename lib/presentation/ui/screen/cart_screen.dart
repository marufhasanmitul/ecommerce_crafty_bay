import 'package:ecommerce_crafty_bay/presentation/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import '../utils/image_assets.dart';
import '../widgets/counter_widget.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart',style: TextStyle(
          color:Colors.black87
        ),),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black87,
        ),

      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder:(context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Image.network(ImageAssets.craftyProductImage,fit: BoxFit.fill,)
                      ),
                      const SizedBox(width: 10,),
                      const Expanded(
                          flex: 1,
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text("New Year Special Shoe",style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,

                              ),),
                              SizedBox(height: 5,),
                              Text("Color : Red ,Size:X"),
                              SizedBox(height: 18,),
                              Text("\$100",style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                              ),)
                            ],
                          )
                      ),
                      const Expanded(
                          flex: 1,
                          child: CounterWidget()
                      ),
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
