import 'package:cater_me_v2/generated/l10n.dart';
import 'package:cater_me_v2/module_occasions/request/create_occasion_request.dart';
import 'package:cater_me_v2/module_occasions/response/occasions_response.dart';
import 'package:cater_me_v2/utils/components/custom_feild.dart';
import 'package:cater_me_v2/utils/components/custom_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:intl/intl.dart';

class CreateOccasionSheet extends StatefulWidget {
  final Function(CreateOccasionRequest) createOccasion;
  final OccasionsResponse? response;
  final bool isUpdated;
  const CreateOccasionSheet({required this.createOccasion,   this.response, required this.isUpdated});

  @override
  State<CreateOccasionSheet> createState() => _CreateOccasionCardState();
}

class _CreateOccasionCardState extends State<CreateOccasionSheet> {
  late DateTime _selectedDate;
  late TimeOfDay _selectTime;
  var titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.isUpdated){
      titleController.text = widget.response?.title ?? '';
      print(widget.response?.date);
      _selectedDate = DateFormat("yyyy-MM-dd").parse(widget.response?.date ?? '');
      _selectTime = TimeOfDay.now();
    }else {
      _selectedDate = DateTime.now();
      _selectTime = TimeOfDay.now();
    }

  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.9,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        child: ListView(
          controller: scrollController,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            CustomFormField(
              validator: true,
              preIcon: Icon(
                Icons.title,
              ),
              hintText: S.of(context).occasionTitle,
              controller: titleController,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: DayPicker.single(
                  selectedDate: _selectedDate,
                  firstDate:DateTime(2020),
                  lastDate: DateTime(2025),
                  onChanged: (DateTime value) {
                    print(value);
                    _selectedDate = value;
                    setState(() {});
                  }
                ),

              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  S.of(context).timeOfEvent,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () async {
                    _selectTime = (await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now()))!;
                    setState(() {

                    });
                  },
                  child: Text(_selectTime.format(context)),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Theme.of(context).primaryColor , width: 2,)
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomLoadingButton(
                  bgColor: Theme.of(context).primaryColor,
                  text:widget.isUpdated  ? S.of(context).updateOccasion : S.of(context).createOccasion,
                  textColor: Colors.white,
                  loading: false,
                  buttonTab: () {
                    if(titleController.text.isEmpty){

                    }
                    DateTime eventDate = DateTime(
                        _selectedDate.year,
                        _selectedDate.month,
                        _selectedDate.day,
                        _selectTime.hour,
                        _selectTime.minute);
                    Navigator.pop(context);
                    widget.createOccasion(CreateOccasionRequest(
                        title: titleController.text,
                        dateTime: DateFormat('yyyy-MM-ddThh:mm')
                            .format(eventDate)));
                  },),
            )
          ],
        ),
      ),
    );
  }
}
