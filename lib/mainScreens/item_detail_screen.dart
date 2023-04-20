import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:raidereats_users_app/assistantMethods/assistant_methods.dart';
import 'package:raidereats_users_app/models/items.dart';
import 'package:raidereats_users_app/widgets/app_bar.dart';


class ItemsDetailsScreeen extends StatefulWidget
{

  final Items? model;
  ItemsDetailsScreeen({this.model});

  @override
  State<ItemsDetailsScreeen> createState() => _ItemsDetailsScreeenState();
}

class _ItemsDetailsScreeenState extends State<ItemsDetailsScreeen> {

  TextEditingController counterTextEditingController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(sellerUID: widget.model!.sellerUID),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.model!.thumbnailUrl.toString()),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: NumberInputPrefabbed.roundedButtons(
              controller: counterTextEditingController,
              incDecBgColor: Colors.red,
              min: 1,
              max: 10,
              initialValue: 1,
              buttonArrangement: ButtonArrangement.incRightDecLeft,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.model!.title.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.model!.longDescription.toString(),
              textAlign: TextAlign.justify,
              style: const TextStyle(fontWeight: FontWeight.normal,fontSize: 14),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.model!.price.toString() + " \$ ",
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
            ),
          ),

          const SizedBox(height: 10,),

          Center(
            child: InkWell(
              onTap: ()
              {
                int itemCounter = int.parse(counterTextEditingController.text);

                List<String> separateItemIDsList = separateItemIDs();

                // 1.check if item exist already in cart
                separateItemIDsList.contains(widget.model!.itemID)
                    ? Fluttertoast.showToast(msg: "Item is already in Cart")
                    :
                    //2.add to cart
                addItemToCart(widget.model!.itemID, context, itemCounter);

              },
              child: Container(
                decoration:const  BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.black,
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
                width: MediaQuery.of(context).size.width - 10,
                height: 50,
                child: const Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
