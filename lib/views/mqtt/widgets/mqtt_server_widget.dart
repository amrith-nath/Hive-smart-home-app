import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/utils/utils.dart';

import '../../../bloc/mqtt_bloc/mqtt_bloc.dart';
import '../../../config/config.dart';

class MQTTServerWidget extends StatelessWidget {
  const MQTTServerWidget(
      {super.key,
      required this.hostController,
      required this.portController,
      required this.clientIdController});

  final TextEditingController hostController;
  final TextEditingController portController;
  final TextEditingController clientIdController;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocConsumer<MQTTBloc, MQTTState>(
      listenWhen: (prev, current) => prev != current,
      listener: (context, state) {
        if (state.apiStatus == ApiStatus.success) {
          FlushbarHelperFnction.flushBarSuccessMessage(
              context: context, message: state.statusMessage);
        }
        if (state.apiStatus == ApiStatus.error) {
          FlushbarHelperFnction.flushBarErrorMessage(
            context: context,
            message: state.statusMessage,
          );
        }
      },
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
                        readOnly: state.isStarted,
                        label: "Host",
                        controller: hostController,
                      )),
                  10.vw,
                  Flexible(
                      child: BaseTextFieldWidget(
                    readOnly: state.isStarted,
                    numOnly: true,
                    label: "Port",
                    controller: portController,
                  )),
                ],
              ),
              10.vh,
              Row(
                children: [
                  Flexible(
                      flex: 2,
                      child: BaseTextFieldWidget(
                        readOnly: state.isStarted,
                        label: "Client ID",
                        controller: clientIdController,
                      )),
                  10.vw,
                  Flexible(
                      child: PrimaryButtonWidget(
                    isLoading: state.apiStatus == ApiStatus.loading &&
                        !state.isStarted,
                    useStyle2: state.isStarted,
                    height: 40,
                    label: state.isStarted ? "Stop" : "Start",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        if (state.isStarted) {
                          context.read<MQTTBloc>().add(MQTTServerStopEvent());
                        } else {
                          context.read<MQTTBloc>().add(MQTTServerStartEvent(
                              host: hostController.text.trim(),
                              port: portController.text.trim(),
                              clientId: clientIdController.text.trim()));
                        }
                      } else {
                        FlushbarHelperFnction.flushBarErrorMessage(
                            context: context,
                            message: "Fill all neccessary fields");
                      }
                    },
                  )),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
