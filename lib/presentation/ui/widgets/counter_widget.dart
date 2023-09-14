import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            onPressed: (){},
            icon: const Icon(Icons.delete,color: Colors.grey,)
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 35,
              height: 35,
              child: ElevatedButton(
                  onPressed: (){},
                  child: const Icon(Icons.remove,size: 14,)
              ),
            ),
            const SizedBox(width: 5,),
            const Text("01",style: TextStyle(
              fontSize: 16,
            ),),
            SizedBox(
              width: 35,
              height: 35,
              child: ElevatedButton(
                  onPressed: (){},
                  child: const Icon(Icons.add,size: 14,)
              ),
            ),
          ],
        )
      ],
    );
  }
}