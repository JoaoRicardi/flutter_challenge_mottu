package com.example.flutter_challenge

import android.app.Activity
import android.app.Notification
import android.app.PendingIntent
import android.content.*
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.util.Log
import androidx.annotation.RequiresApi
import com.google.firebase.analytics.FirebaseAnalytics
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors


class MainActivity: FlutterActivity() {

    private val connectionEventChannel = "platform_channel_events/connectivity"
    private val airPlaneEventChannel = "platform_channel_events/airplaneMode"
    val streamHandelr = AirPlaneModeStreamHandler()
    val notification = ShowNotification(this)

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, connectionEventChannel)
                .setStreamHandler(NetworkStreamHandler(this))

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, airPlaneEventChannel)
                .setStreamHandler(streamHandelr)

        notification.setCustomMethodCallHandler(flutterEngine)


        val receiver = AirPlaneModeReceiver(streamHandelr)
        val intentFilter = IntentFilter(Intent.ACTION_AIRPLANE_MODE_CHANGED)
        this.registerReceiver(receiver, intentFilter)
    }

}

class ShowNotification(val activity: Activity): ServiceConnection {

    val channel = "notification/channel"

    private var batteryCalculationService: BatteryCalculationService? = null

    private val getAppInstanceId = "showNotification"

    private lateinit var result: MethodChannel.Result

    private val methodChannelHandler = MethodChannel.MethodCallHandler { call, result ->
        when (call.method) {
            getAppInstanceId -> showNotification(call, result)
            else -> handleMethodNotImplemented(call, result)
        }
    }


    private val onServiceCallback = object:  OnServiceChange {
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

    fun setCustomMethodCallHandler(flutterEngine: FlutterEngine) {
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

interface OnServiceChange{
    fun onBatteryLifeChanged(value: Int)
}

