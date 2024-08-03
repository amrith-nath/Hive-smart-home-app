import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/data/models/message_model.dart';

import '../../../bloc/mqtt_bloc/mqtt_bloc.dart';
import '../../../config/config.dart';

class MQTTdisplayWidget extends StatelessWidget {
  const MQTTdisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<MessageModel> localMessages = [];

    return BlocBuilder<MQTTBloc, MQTTState>(
      builder: (context, state) {
        if (state.isStarted && state.messages.isNotEmpty) {
          // localMessages = state.messages.map((e) => e.message).toList();
          // localMessages = [...localMessages, state.messages.last.message];
          localMessages = state.messages.reversed.toList();
        }
        return Container(
          height: 200,
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            color: KColors.iconBgInactive,
            border: Border.all(color: KColors.textSecondary),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView.builder(
              reverse: true,
              itemCount: localMessages.length,
              itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      color: KColors.warning,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        localMessages[index].message,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const Spacer(),
                      Text(
                        localMessages[index].topic,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ))),
        );
      },
    );
  }
}
