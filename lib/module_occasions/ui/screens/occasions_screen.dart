import 'package:cater_me_v2/generated/l10n.dart';
import 'package:cater_me_v2/module_occasions/request/create_occasion_request.dart';
import 'package:cater_me_v2/module_occasions/ui/widget/create_occa_sheet.dart';
import 'package:cater_me_v2/utils/components/custom_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../abstracts/states/state.dart';
import '../../state_manager/occasions_state_manager.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';

@injectable
class OccasionsScreen extends StatefulWidget {
  final OccasionsCubit cubit;

  const OccasionsScreen(
    this.cubit,
  );

  @override
  State<OccasionsScreen> createState() => OccasionsScreenState();
}

class OccasionsScreenState extends State<OccasionsScreen> {
  @override
  void initState() {
    super.initState();
    widget.cubit.getOccasions(this);
  }

  getOccasions() {
    widget.cubit.getOccasions(this);
  }
  createOccasion(CreateOccasionRequest occasionRequest) {
    widget.cubit.createOccasion(this , occasionRequest);
  }

  updateOccasion(CreateOccasionRequest occasionRequest) {
    widget.cubit.updateOccasion(this , occasionRequest);
  }
  deleteOccasion(String id) {
    widget.cubit.deleteOccasion(this , id);
  }
  @override
  void dispose() {
    super.dispose();
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).occasions),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return CreateOccasionSheet(createOccasion: (req){
                      createOccasion(req);
                    },isUpdated: false,);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15))),
                  isScrollControlled: true,
                  elevation: 5);
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 25),
              child: Icon(Icons.add_comment),
            ),
          )
        ],
      ),
      body: BlocBuilder<OccasionsCubit, States>(
        bloc: widget.cubit,
        builder: (context, state) {
          return state.getUI(context);
        },
      ),
    );
  }
}
