import 'package:flutter/services.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_method_channel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils.dart';


void main(){

  const _channel = MethodChannel('flutter_challenge/airplane_mottu');
  IAirPlaneMethodChannel airPlaneMethodChannel = AirPlaneMethodChannel();

  setUpAll((){
    TestUtils.setUpAllTests();
  });

  tearDown((){
    _channel.setMockMethodCallHandler(null);
  });

  group('Test on start listening from airplane mode', (){
    testWidgets('On start listening with success response', (WidgetTester tester) async {
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(_channel, (MethodCall methodCall) async {
        if(methodCall.method == "start"){
         return true;
        }
        else{
          return "Unknow method imp";
        }
      });


      ///metodo com valor errado
      ///deve voltar
      var errorRes = await airPlaneMethodChannel.stopListeningToAirPlaneStatus();
      expect(errorRes, null);
      var successRes = await airPlaneMethodChannel.startListeningToAirPlaneStatus();
      expect(successRes, true);

    });

    testWidgets('On start listening with error response', (WidgetTester tester) async {
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(_channel, (MethodCall methodCall) async {
        if(methodCall.method == "start"){
          return false;
        }
        else{
          return "Unknow method imp";
        }
      });

      var successRes = await airPlaneMethodChannel.startListeningToAirPlaneStatus();
      expect(successRes, false);

    });

    testWidgets('On start listening with null value', (WidgetTester tester) async {
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(_channel, (MethodCall methodCall) async {
        if(methodCall.method == "start"){
          return null;
        }
        else{
          return "Unknow method imp";
        }
      });

      var successRes = await airPlaneMethodChannel.startListeningToAirPlaneStatus();
      expect(successRes, null);

    });
  });


  group('Test on stop listening from airplane mode', (){
    testWidgets('On stop listening with success response', (WidgetTester tester) async {
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(_channel, (MethodCall methodCall) async {
        if(methodCall.method == "stop"){
          return true;
        }
        else{
          return "Unknow method imp";
        }
      });


      ///metodo com valor errado
      ///deve voltar
      var errorRes = await airPlaneMethodChannel.startListeningToAirPlaneStatus();
      expect(errorRes, null);
      var successRes = await airPlaneMethodChannel.stopListeningToAirPlaneStatus();
      expect(successRes, true);

    });

    testWidgets('On stop listening with error response', (WidgetTester tester) async {
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(_channel, (MethodCall methodCall) async {
        if(methodCall.method == "stop"){
          return false;
        }
        else{
          return "Unknow method imp";
        }
      });

      var successRes = await airPlaneMethodChannel.stopListeningToAirPlaneStatus();
      expect(successRes, false);

    });

    testWidgets('On stop listening with null value', (WidgetTester tester) async {
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(_channel, (MethodCall methodCall) async {
        if(methodCall.method == "stop"){
          return null;
        }
        else{
          return "Unknow method imp";
        }
      });

      var successRes = await airPlaneMethodChannel.stopListeningToAirPlaneStatus();
      expect(successRes, null);

    });
  });



}

