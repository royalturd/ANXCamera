package com.android.camera.module.loader.camera2;

import android.content.Intent;
import android.support.annotation.WorkerThread;
import android.support.v4.util.Pair;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraScreenNail;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.ThermalDetector;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.db.DbRepository;
import com.android.camera.log.Log;
import com.android.camera.module.Module;
import com.android.camera.module.loader.StartControl;
import com.android.camera.network.util.NetworkUtils;
import com.ss.android.ttve.common.TEDefine;
import io.reactivex.CompletableEmitter;
import io.reactivex.CompletableOnSubscribe;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;

public class CompletablePreFixCamera2Setup implements CompletableOnSubscribe, Observer<Camera2Result> {
    private static final String TAG = "prefix";
    private boolean isFromVoiceControl;
    private CameraScreenNail mCameraScreenNail;
    private CompletableEmitter mEmitter;
    private boolean mFromScreenSlide;
    private Intent mIntent;
    private Module mLastMode;
    private boolean mModuleChanged;
    private boolean mNeedBlur;
    private boolean mNeedConfigData;
    private boolean mStartFromKeyguard;

    public CompletablePreFixCamera2Setup(Module module, StartControl startControl, CameraScreenNail cameraScreenNail, Intent intent, boolean z, boolean z2) {
        this.mLastMode = module;
        if (startControl != null) {
            this.mNeedBlur = startControl.mNeedBlurAnimation;
            this.mFromScreenSlide = startControl.mFromScreenSlide;
            this.mNeedConfigData = startControl.mNeedReConfigureData;
        }
        this.mModuleChanged = startControl == null || module == null || (startControl.mTargetMode != module.getModuleIndex() && !isSameModule(startControl.mTargetMode, module.getModuleIndex()));
        this.mCameraScreenNail = cameraScreenNail;
        this.mIntent = intent;
        this.mStartFromKeyguard = z;
        this.isFromVoiceControl = z2;
    }

    private void closeLastModule() {
        Module module = this.mLastMode;
        if (module != null) {
            module.unRegisterProtocol();
            this.mLastMode.onPause();
            this.mLastMode.onStop();
            this.mLastMode.onDestroy();
        }
    }

    private boolean isLastModuleAlive() {
        Module module = this.mLastMode;
        return module != null && module.isCreated();
    }

    private boolean isSameModule(int i, int i2) {
        return (i == 163 || i == 165) && (i2 == 163 || i2 == 165);
    }

    public void onComplete() {
    }

    public void onError(Throwable th) {
    }

    public void onNext(Camera2Result camera2Result) {
        this.mEmitter.onComplete();
    }

    public void onSubscribe(Disposable disposable) {
    }

    @WorkerThread
    public void subscribe(CompletableEmitter completableEmitter) {
        int i;
        int i2;
        this.mEmitter = completableEmitter;
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        StringBuilder sb = new StringBuilder();
        sb.append("mModuleChanged ");
        sb.append(this.mModuleChanged);
        sb.append(" LastMode is ");
        Module module = this.mLastMode;
        sb.append(module == null ? TEDefine.FACE_BEAUTY_NULL : Integer.valueOf(module.getModuleIndex()));
        String sb2 = sb.toString();
        String str = TAG;
        Log.d(str, sb2);
        if (this.mModuleChanged) {
            Module module2 = this.mLastMode;
            if (module2 != null) {
                module2.unRegisterModulePersistProtocol();
            }
            HybridZoomingSystem.clearZoomRatioHistory();
        }
        if (this.mNeedBlur) {
            this.mCameraScreenNail.animateModuleCopyTexture(this.mFromScreenSlide);
        }
        if (isLastModuleAlive()) {
            if (this.mNeedConfigData) {
                DataRepository.getInstance().backUp().backupRunning(DataRepository.dataItemRunning(), dataItemGlobal.getDataBackUpKey(this.mLastMode.getModuleIndex()), dataItemGlobal.getLastCameraId(), true);
            }
            closeLastModule();
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append("subscribe: mIntent = ");
        sb3.append(this.mIntent);
        Log.d(str, sb3.toString());
        Intent intent = this.mIntent;
        if (intent != null) {
            Pair parseIntent = dataItemGlobal.parseIntent(intent, Boolean.valueOf(this.isFromVoiceControl), this.mStartFromKeyguard, true, true);
            int intValue = ((Integer) parseIntent.first).intValue();
            int intValue2 = ((Integer) parseIntent.second).intValue();
            ThermalDetector.getInstance().onCreate(CameraAppImpl.getAndroidContext());
            if (DataRepository.dataItemFeature().Rb()) {
                NetworkUtils.tryRequestTTSticker();
            }
            if (DataRepository.dataItemFeature().Jc()) {
                DbRepository.dbItemSaveTask().markAllDepartedTask();
            }
            int i3 = intValue;
            i2 = intValue2;
            i = i3;
        } else {
            i = dataItemGlobal.getCurrentCameraId();
            i2 = dataItemGlobal.getCurrentMode();
        }
        Camera2OpenManager.getInstance().openCamera(i, i2, this, DataRepository.dataItemFeature().bb());
    }
}
