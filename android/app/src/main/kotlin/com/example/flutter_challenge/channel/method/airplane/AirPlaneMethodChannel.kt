package com.example.flutter_challenge.channel.method.airplane

import android.app.Activity
import android.content.Intent
import android.content.IntentFilter
import android.util.Log
import com.example.flutter_challenge.broadcast.airplane_mode.AirPlaneModeReceiver
import com.example.flutter_challenge.channel.base.BaseMethod
import com.example.flutter_challenge.channel.stream.airplane.AirPlaneModeChannelStream
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.lang.Exception

class AirPlaneMethodChannel(
        private val activity: Activity,
        private val streamHandler: AirPlaneModeChannelStream,
): BaseMethod {

    override val channel: String = "flutter_challenge/airplane_mottu"

    private val start: String = "start"
    private val stop: String = "stop"


    private lateinit var receiver : AirPlaneModeReceiver

    ///quem vai lidar com as chamadas caso sejam invocadas no flutter
    override val methodChannelHandler: MethodChannel.MethodCallHandler = MethodChannel.MethodCallHandler { call, result ->
        when (call.method) {
            start -> start(result)
            stop -> stop(result)
            else -> handleMethodNotImplemented(call, result)
        }
    }

    ///metodo para inscrever o channel na engine
    override fun setCustomMethodCallHandler(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor, channel)
                .setMethodCallHandler(methodChannelHandler)
    }

    ///registrando para poder ouvir a troca de status
    private fun start(result: MethodChannel.Result){
        try {
            receiver = AirPlaneModeReceiver(streamHandler)
            val intentFilter = IntentFilter(Intent.ACTION_AIRPLANE_MODE_CHANGED)
            activity.registerReceiver(receiver, intentFilter)

            result.success(true)
        }catch (err: Exception){
            Log.e("AIRPLANEMODE_START", err.message ?: "")
            result.success(false)
        }
    }


    ///unregister broadcast reciver cas o o ususario tire a permissao
    private fun stop( result: MethodChannel.Result){
        try{
            activity.unregisterReceiver(receiver)
            result.success(false)
        }catch (err: Exception){
            Log.e("AIRPLANEMODE_STOP", err.message ?: "")
            result.success(false)
        }
    }

    ///funcao para lidar caso o metodo chamada nao seja registrado
    private fun handleMethodNotImplemented(call: MethodCall, result: MethodChannel.Result) {
        Log.d("Method not implemented ${call.method}", "Error method not implemented")
        result.error(
                "Method not implemented ${call.method}",
                "Please implement method",
                {}
        )
    }
}