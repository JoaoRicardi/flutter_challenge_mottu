import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/channel/connectivity/connectivity_stream_channel.dart';

extension ConnectionExtensions on Connection {
  Color getConnectionColor() {
    switch (this) {
      case Connection.wifi:
        return Colors.blueAccent;
      case Connection.cellular:
        return Colors.green;
      case Connection.disconnected:
        return Colors.grey;
      case Connection.unknown:
        return Colors.grey;
      case Connection.notListening:
        return Colors.transparent;
      default:
        return Colors.transparent;
    }
  }

  String getFormattedName(){
    switch (this) {
      case Connection.wifi:
        return "Wi-fi";
      case Connection.cellular:
        return "3g/4g";
      case Connection.disconnected:
        return "Sem conexão";
      case Connection.unknown:
        return "Sem informações";
      case Connection.notListening:
        return "";
      default:
        return "";
    }
  }


  IconData getIcon(){
    switch (this) {
      case Connection.wifi:
        return Icons.wifi;
      case Connection.cellular:
        return Icons.signal_cellular_alt;
      case Connection.disconnected:
        return Icons.signal_cellular_off;
      case Connection.unknown:
        return Icons.warning;
      case Connection.notListening:
        return Icons.signal_cellular_off;
      default:
        return Icons.signal_cellular_off;
    }
  }

  Connection intToConnection() {
    var connection = Connection.unknown;
    switch (this) {
      case Connection.wifi:
        connection = Connection.wifi;
        break;
      case Connection.cellular:
        connection = Connection.cellular;
        break;
      case Connection.disconnected:
        connection = Connection.disconnected;
        break;
      default:
        connection = Connection.unknown;
        break;
    }
    return connection;
  }
}