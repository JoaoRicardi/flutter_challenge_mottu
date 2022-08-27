package com.example.flutter_challenge.callback.connectivity

import android.net.ConnectivityManager
import android.net.Network
import android.net.NetworkCapabilities
import android.os.Build
import android.provider.SyncStateContract
import androidx.annotation.RequiresApi
import com.example.flutter_challenge.Constants
import com.example.flutter_challenge.interfaces.connectivity.OnConnectivityChange

@RequiresApi(Build.VERSION_CODES.LOLLIPOP)
class ConnectivityCallBack: ConnectivityManager.NetworkCallback() {

    private lateinit var onChangeCallBack: OnConnectivityChange

    override fun onLost(network: Network) {
        super.onLost(network)
        onChangeCallBack.updateConnectionTyoe(Constants.unknown)
    }

    override fun onCapabilitiesChanged(network: Network, networkCapabilities: NetworkCapabilities) {
        super.onCapabilitiesChanged(network, networkCapabilities)

        val status =
            when {
                networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI) -> Constants.wifi
                networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR) -> Constants.cellular
                else -> Constants.unknown
            }

        onChangeCallBack.updateConnectionTyoe(status)
    }


    fun setOnConnectivityChangeCallBack(onConnectivityChange: OnConnectivityChange){
        this.onChangeCallBack = onConnectivityChange
    }

}