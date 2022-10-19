import 'package:cater_me_v2/module_occasions/response/occasions_response.dart';
import 'package:flutter/material.dart';

class OccasionCard extends StatelessWidget {
  final OccasionsResponse model;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const OccasionCard({  required this.model, required this.onEdit, required this.onDelete})  ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(leading:
        Icon(Icons.date_range , color: Theme.of(context).primaryColor,size: 40,),
        title: Text(model.title ?? '',style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text(model.date ?? ''),
          trailing:  SizedBox(
            width: 85,
            child: Row(
                children: [
              InkWell(
                onTap: onEdit,
                child: Card(
                    elevation: 3,
                  color:    Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(Icons.edit ,color: Colors.white,size: 20,),
                    )),
              ),
              SizedBox(width: 5,),
                  InkWell(
                    onTap: onDelete,
                    child: Card(
                      elevation: 3,
                        color:    Colors.red,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.delete ,color: Colors.white,size: 20,),
                        )),
                  ),
            ]),
          ),


        ),
      ),
    );
  }
}
