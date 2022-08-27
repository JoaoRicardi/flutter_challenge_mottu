package com.example.flutter_challenge.channel.method.battery

import android.app.Activity
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.os.IBinder
import android.util.Log
import com.example.flutter_challenge.channel.base.BaseMethod
import com.example.flutter_challenge.interfaces.baterry.OnBatteryChange
import com.example.flutter_challenge.service.battery.BatteryCalculationService
import com.example.flutter_challenge.service.battery.LocalBinder
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class BatteryMethodChannel(val activity: Activity): ServiceConnection, BaseMethod {

    override val channel = "flutter_challenge/battery"

    private var batteryCalculationService: BatteryCalculationService? = null

    private val getAppInstanceId = "getBattery"

    private lateinit var result: MethodChannel.Result

    override val methodChannelHandler = MethodChannel.MethodCallHandler { call, result ->
        when (call.method) {
            getAppInstanceId -> showNotification(call, result)
            else -> handleMethodNotImplemented(call, result)
        }
    }


    private val onServiceCallback = object: OnBatteryChange {
        override fun onBatteryLifeChanged(value: Int) {
            result.success(value)
        }

    }

    private fun showNotification(call: MethodCall, result: MethodChannel.Result) {
        this.result = result
        val serviceintent = Intent(activity, BatteryCalculationService::class.java)
        activity.bindService(serviceintent, this, Context.BIND_AUTO_CREATE)
        activity.startService(serviceintent)
    }

    override fun setCustomMethodCallHandler(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor, channel)
                .setMethodCallHandler(methodChannelHandler)
    }


    private fun handleMethodNotImplemented(call: MethodCall, result: MethodChannel.Result) {
        Log.d("Method not implemented ${call.method}", "Error method not implemented")
        result.error(
                "Method not implemented ${call.method}",
                "Please implement method",
                {}
        )
    }

    override fun onServiceConnected(componentName: ComponentName?, binder: IBinder?) {
        batteryCalculationService = (binder as LocalBinder).getService()
        batteryCalculationService?.setOnServiceCallback(onServiceCallback)
    }

    override fun onServiceDisconnected(componentName: ComponentName?) {
        batteryCalculationService = null
        batteryCalculationService?.setOnServiceCallback(null)
    }
}