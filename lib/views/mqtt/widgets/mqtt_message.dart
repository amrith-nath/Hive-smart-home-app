import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/utils/utils.dart';

import '../../../bloc/mqtt_bloc/mqtt_bloc.dart';
import '../../../config/config.dart';

class MQTTMessageWidget extends StatelessWidget {
  const MQTTMessageWidget({super.key, required this.messageController});
  final TextEditingController messageController;
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
                    flex: 3,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "";
                        }
                        return null;
                      },
                      readOnly: !state.isStarted,
                      controller: messageController,
                      decoration: const InputDecoration(
                        errorStyle: TextStyle(fontSize: 0.01),
                        filled: true,
                        fillColor: KColors.iconBgInactive,
                      ),
                    ),
                  ),
                  10.vw,
                  Flexible(
                    child: PrimaryButtonWidget(
                      height: 50,
                      isLoading: state.apiStatus == ApiStatus.loading &&
                          state.isStarted,
                      useStyle2: !state.isStarted,
                      label: "Send",
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.read<MQTTBloc>().add(MQTTPublishMessage(
                                message: messageController.text.trim(),
                              ));
                        } else {
                          FlushbarHelperFnction.flushBarErrorMessage(
                              context: context,
                              message: "Fill all neccessary fields");
                        }
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
