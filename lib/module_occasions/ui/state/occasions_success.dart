import 'package:cater_me_v2/module_occasions/ui/widget/create_occa_sheet.dart';
import 'package:cater_me_v2/module_occasions/ui/widget/occasion_card.dart';
import 'package:flutter/material.dart';
import '../../../abstracts/states/state.dart';
import '../../response/occasions_response.dart';
import '../screens/occasions_screen.dart';

class OccasionsListSuccess extends States {
  final List<OccasionsResponse> occasionsResponse;
  OccasionsScreenState screenState;

  OccasionsListSuccess(
      {required this.occasionsResponse, required this.screenState});

  @override
  Widget getUI(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => OccasionCard(
        model: occasionsResponse[index],
        onDelete: () {
          screenState.deleteOccasion(occasionsResponse[index].id.toString());
        },
        onEdit: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return CreateOccasionSheet(
                  createOccasion: (req) {
                    req.id =  occasionsResponse[index].id;
                    screenState.updateOccasion(req);
                  },
                  isUpdated: true,
                  response:  occasionsResponse[index],
                );
              },
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
              isScrollControlled: true,
              elevation: 5);
        },
      ),
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: occasionsResponse.length,
    );
  }
}
