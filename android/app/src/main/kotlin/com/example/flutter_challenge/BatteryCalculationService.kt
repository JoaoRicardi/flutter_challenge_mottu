package com.example.flutter_challenge

import android.app.Service
import android.content.Intent
import android.content.IntentFilter
import android.os.*


class BatteryCalculationService: Service() {

    private val binder: IBinder = LocalBinder(this)

    private var onServiceCallback : OnServiceChange? = null


    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        return super.onStartCommand(intent, flags, startId)
    }


    override fun onBind(intent: Intent?): IBinder {
        return binder
    }

    fun setOnServiceCallback(onServiceCallback :OnServiceChange?){
        this.onServiceCallback = onServiceCallback


        Handler(Looper.getMainLooper()).postDelayed(
                {
                    val ifilter = IntentFilter(Intent.ACTION_BATTERY_CHANGED)
                    val batteryStatus = registerReceiver(null, ifilter)

                    val level = batteryStatus!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)
                    val scale = batteryStatus.getIntExtra(BatteryManager.EXTRA_SCALE, -1)

                    val batteryPct = level / scale.toFloat()

                    val batteryToReturn = (batteryPct * 100).toInt()

                    onServiceCallback?.onBatteryLifeChanged(batteryToReturn)
                },
                1000 // value in milliseconds
        )
    }

}



class LocalBinder(private val batteryServiceInstance: BatteryCalculationService) : Binder() {
    fun getService(): BatteryCalculationService{
        return batteryServiceInstance
    }
}


