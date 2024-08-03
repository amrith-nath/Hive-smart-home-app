import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/utils/utils.dart';

import '../../../bloc/mqtt_bloc/mqtt_bloc.dart';
import '../../../config/config.dart';

class MQTTSubscribeWidget extends StatelessWidget {
  const MQTTSubscribeWidget({super.key, required this.topicController});
  final TextEditingController topicController;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocBuilder<MQTTBloc, MQTTState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Flexible(
                      flex: 2,
                      child: BaseTextFieldWidget(
                        readOnly: !state.isStarted,
                        label: "Topic",
                        controller: topicController,
                      )),
                  10.vw,
                  Flexible(
                      child: PrimaryButtonWidget(
                    isLoading:
                        state.apiStatus == ApiStatus.loading && state.isStarted,
                    useStyle2: !state.isStarted,
                    height: 40,
                    label: "Subscribe",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<MQTTBloc>().add(MQTTSubscribeTopic(
                              topic: topicController.text.trim(),
                            ));
                      } else {
                        FlushbarHelperFnction.flushBarErrorMessage(
                            context: context,
                            message: "Fill all neccessary fields");
                      }
                    },
                  )),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
