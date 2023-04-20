import 'package:flutter/material.dart';
import 'package:raidereats_users_app/mainScreens/item_detail_screen.dart';
import 'package:raidereats_users_app/models/items.dart';

class ItemsDesignWidget extends StatefulWidget {
  Items? model;
  BuildContext? context;

  ItemsDesignWidget({this.model, this.context});

  @override
  _ItemsDesignWidgetState createState() => _ItemsDesignWidgetState();
}

class _ItemsDesignWidgetState extends State<ItemsDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> ItemsDetailsScreeen(model: widget.model)));
      },
      splashColor: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: 280,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Divider(
                height: 6,
                thickness: 3,
                color: Colors.grey[300],
              ),
              Image.network(
                widget.model!.thumbnailUrl!,
                height: 220.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 3.0,),
              Text(
                widget.model!.title!,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontFamily: "Bebas",
                ),
              ),
              Text(
                widget.model!.shortInfo!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: "Bebas",
                ),
              ),
              Divider(
                height: 6,
                thickness: 3,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
