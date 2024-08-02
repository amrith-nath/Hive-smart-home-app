import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class TempRepo {
  late StreamSubscription<BluetoothAdapterState> subscription;
  late StreamSubscription<List<ScanResult>> blsubscription;

  scanDevice() async {
    final plugin = DeviceInfoPlugin();
    final android = await plugin.androidInfo;

    if (android.version.sdkInt <= 30) {
      await Permission.location.request();
    }
    if (30 < android.version.sdkInt) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.bluetoothScan,
        Permission.bluetoothAdvertise
      ].request();

      if (statuses[Permission.bluetoothScan] == PermissionStatus.granted &&
          statuses[Permission.bluetoothScan] == PermissionStatus.granted) {
        log("Permissions granted");
      }
    }
    if (await FlutterBluePlus.isSupported == false) {
      log("Bluetooth not supported by this device");
    }

    subscription =
        FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
      log("$state");
      if (state == BluetoothAdapterState.on) {
        // usually start scanning, connecting, etc
        log("BL on");
      } else {
        log("BL off");
      }
    });

    if (Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
    }

    blsubscription = FlutterBluePlus.onScanResults.listen(
      (results) {
        if (results.isNotEmpty) {
          ScanResult r = results.last; // the most recently found device
          log('${r.device.remoteId}: "${r.advertisementData.advName}" found!');
        }
      },
      onError: (e) => log(e.toString()),
    );

    log("Button click");
    FlutterBluePlus.cancelWhenScanComplete(subscription!);
    await FlutterBluePlus.adapterState
        .where((val) => val == BluetoothAdapterState.on)
        .first;
  }
}
