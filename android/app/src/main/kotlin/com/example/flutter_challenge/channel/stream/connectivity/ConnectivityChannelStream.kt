package com.example.flutter_challenge.channel.stream.connectivity

import android.app.Activity
import android.content.Context
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.net.NetworkRequest
import android.os.Build
import androidx.annotation.RequiresApi
import com.example.flutter_challenge.callback.connectivity.ConnectivityCallBack
import com.example.flutter_challenge.channel.base.BaseStream
import com.example.flutter_challenge.interfaces.connectivity.OnConnectivityChange
import io.flutter.plugin.common.EventChannel

class ConnectivityChannelStream(private val activity: Activity): EventChannel.StreamHandler, BaseStream, OnConnectivityChange {

    override var eventSink: EventChannel.EventSink? = null
    override val channelId: String = "flutter_challenge/connectivity"

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private val networkCallback = ConnectivityCallBack()


    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
        networkCallback.setOnConnectivityChangeCallBack(this)
        startListeningNetworkChanges()
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    override fun onCancel(arguments: Any?) {
        eventSink = null
        stopListeningNetworkChanges()
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun startListeningNetworkChanges() {
        val manager = activity.getSystemService(Context.CONNECTIVITY_SERVICE) as? ConnectivityManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            manager?.registerDefaultNetworkCallback(networkCallback)
        } else {
            val request = NetworkRequest.Builder()
                    .addCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET)
                    .build()
            manager?.registerNetworkCallback(request, networkCallback)
        }
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun stopListeningNetworkChanges() {
        val manager = activity.getSystemService(Context.CONNECTIVITY_SERVICE) as? ConnectivityManager
        manager?.unregisterNetworkCallback(networkCallback)
    }

    override fun updateConnectionTyoe(value: Int) {
        activity.runOnUiThread { eventSink?.success(value) }
    }


}