import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hive/config/colors/colors.dart';
import 'package:hive/config/config.dart';
import 'package:hive/utils/utils.dart';
import 'package:hive/views/home/widgets/appbar_widget.dart';
import 'package:hive/views/home/widgets/bl_scan_widget.dart';

import '../../constants/tags.dart';
import '../mqtt/mqtt_temp.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              5.vh,
              10.vh,
              const BLScanWidget(),
              Expanded(
                child: Container(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: KTags.primaryHeroTag,
        backgroundColor: KColors.darkPrimary,
        foregroundColor: KColors.warning,
        onPressed: () {
          Navigator.of(context).pushNamed(RouteName.mqtt);
        },
        label: Row(
          children: [
            const Icon(
              Icons.cloud,
            ),
            10.vw,
            const Text("MQTT"),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
