package com.simviz12.guardian_mobile

import android.app.admin.DevicePolicyManager
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.media.AudioManager
import android.os.Build
import android.os.VibrationEffect
import android.os.Vibrator
import android.os.VibratorManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.simviz12.guardian_mobile/agent"
    private lateinit var devicePolicyManager: DevicePolicyManager
    private lateinit var compName: ComponentName

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        devicePolicyManager = getSystemService(Context.DEVICE_POLICY_SERVICE) as DevicePolicyManager
        compName = ComponentName(this, GuardianAdminReceiver::class.java)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "requestAdmin" -> {
                    if (!devicePolicyManager.isAdminActive(compName)) {
                        val intent = Intent(DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN)
                        intent.putExtra(DevicePolicyManager.EXTRA_DEVICE_ADMIN, compName)
                        intent.putExtra(DevicePolicyManager.EXTRA_ADD_EXPLANATION, "Requerido para bloquear y borrar remotamente.")
                        startActivity(intent)
                        result.success(true)
                    } else {
                        result.success(false)
                    }
                }
                "isAdminActive" -> {
                    result.success(devicePolicyManager.isAdminActive(compName))
                }
                "lock" -> {
                    if (devicePolicyManager.isAdminActive(compName)) {
                        devicePolicyManager.lockNow()
                        result.success(true)
                    } else {
                        result.error("NOT_ADMIN", "Device Admin is not active", null)
                    }
                }
                "wipe" -> {
                    if (devicePolicyManager.isAdminActive(compName)) {
                        devicePolicyManager.wipeData(0)
                        result.success(true)
                    } else {
                        result.error("NOT_ADMIN", "Device Admin is not active", null)
                    }
                }
                "ring" -> {
                    val audioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager
                    audioManager.setStreamVolume(
                        AudioManager.STREAM_RING,
                        audioManager.getStreamMaxVolume(AudioManager.STREAM_RING),
                        0
                    )
                    // Optional: start playing a ringtone here.
                    result.success(true)
                }
                "vibrate" -> {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                        val vibratorManager = getSystemService(Context.VIBRATOR_MANAGER_SERVICE) as VibratorManager
                        val vibrator = vibratorManager.defaultVibrator
                        vibrator.vibrate(VibrationEffect.createOneShot(1000, VibrationEffect.DEFAULT_AMPLITUDE))
                    } else {
                        @Suppress("DEPRECATION")
                        val vibrator = getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                            vibrator.vibrate(VibrationEffect.createOneShot(1000, VibrationEffect.DEFAULT_AMPLITUDE))
                        } else {
                            @Suppress("DEPRECATION")
                            vibrator.vibrate(1000)
                        }
                    }
                    result.success(true)
                }
                else -> result.notImplemented()
            }
        }
    }
}
