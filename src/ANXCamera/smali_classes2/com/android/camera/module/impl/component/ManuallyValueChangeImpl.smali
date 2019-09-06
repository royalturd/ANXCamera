.class public Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;
.super Ljava/lang/Object;
.source "ManuallyValueChangeImpl.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$ManuallyValueChanged;


# static fields
.field private static final TAG:Ljava/lang/String; = "ManuallyValueChangeImpl"


# instance fields
.field private mActivity:Lcom/android/camera/ActivityBase;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    return-void
.end method

.method public static create(Lcom/android/camera/ActivityBase;)Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;
    .locals 1

    new-instance v0, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;-><init>(Lcom/android/camera/ActivityBase;)V

    return-object v0
.end method


# virtual methods
.method public getBaseModule()Lcom/android/camera/module/BaseModule;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-virtual {p0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object p0

    check-cast p0, Lcom/android/camera/module/BaseModule;

    return-object p0
.end method

.method public onBokehFNumberValueChanged(Ljava/lang/String;)V
    .locals 2

    invoke-static {p1}, Lcom/android/camera/CameraSettings;->writeFNumber(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p0

    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 v0, 0x0

    const/16 v1, 0x30

    aput v1, p1, v0

    invoke-virtual {p0, p1}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    return-void
.end method

.method public onDualLensSwitch(Lcom/android/camera/data/data/config/ComponentManuallyDualLens;I)V
    .locals 3

    invoke-static {}, Lcom/android/camera/HybridZoomingSystem;->clearZoomRatioHistory()V

    invoke-virtual {p1, p2}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Lcom/android/camera/data/data/config/ComponentManuallyDualLens;->next(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xa7

    if-ne p2, v2, :cond_0

    sget-boolean v2, Lcom/android/camera/HybridZoomingSystem;->IS_4_OR_MORE_SAT:Z

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    invoke-virtual {p1, p2, v0}, Lcom/android/camera/data/data/ComponentData;->setComponentValue(ILjava/lang/String;)V

    const-string p1, "ultra"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    invoke-static {p2, p1}, Lcom/android/camera/CameraSettings;->setUltraWideConfig(IZ)V

    const-string p1, "wide"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->switchOffUltraPixel()V

    :cond_1
    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackLensChanged(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->mActivity:Lcom/android/camera/ActivityBase;

    invoke-static {p2}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 p2, 0x5

    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 p2, 0x2

    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/android/camera/AppController;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    return-void
.end method

.method public onDualLensZooming(Z)V
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isZoomByCameraSwitchingSupported()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->getActualCameraId()I

    move-result v0

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getSATCameraId()I

    move-result v1

    if-ne v0, v1, :cond_2

    invoke-virtual {p0, p1}, Lcom/android/camera/module/BaseModule;->notifyZooming(Z)V

    :cond_2
    return-void
.end method

.method public onDualZoomHappened(Z)V
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p0

    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isZoomByCameraSwitchingSupported()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/BaseModule;->getActualCameraId()I

    move-result v0

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getSATCameraId()I

    move-result v1

    if-ne v0, v1, :cond_2

    invoke-virtual {p0, p1}, Lcom/android/camera/module/BaseModule;->notifyDualZoom(Z)V

    :cond_2
    return-void
.end method

.method public onDualZoomValueChanged(FI)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/module/BaseModule;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/module/BaseModule;->onZoomRatioChanged(FI)V

    return-void
.end method

.method public onETValueChanged(Lcom/android/camera/data/data/config/ComponentManuallyET;Ljava/lang/String;)V
    .locals 3

    invoke-static {p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackExposureTimeChanged(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xa4

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFlashSupportedInManualMode()Z

    move-result p2

    const-string v0, "mm"

    if-nez p2, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result p2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v1

    const-string v2, "0"

    invoke-virtual {v1, p2, v2}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->setComponentValue(ILjava/lang/String;)V

    const/4 p2, 0x1

    new-array p2, p2, [I

    const/4 v1, 0x0

    const/16 v2, 0xc1

    aput v2, p2, v1

    invoke-interface {p1, v0, p2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->closeMutexElement(Ljava/lang/String;[I)V

    goto :goto_0

    :cond_0
    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreMutexFlash(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p0

    const/4 p1, 0x3

    new-array p1, p1, [I

    fill-array-data p1, :array_0

    invoke-virtual {p0, p1}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    return-void

    nop

    :array_0
    .array-data 4
        0x10
        0x14
        0xa
    .end array-data
.end method

.method public onFocusValueChanged(Lcom/android/camera/data/data/config/ComponentManuallyFocus;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-static {p2}, Lcom/android/camera/CameraSettings;->getMappingFocusMode(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getMappingFocusMode(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p2, :cond_1

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setFocusModeSwitching(Z)V

    const/16 p2, 0xa7

    invoke-virtual {p1, p2}, Lcom/android/camera/data/data/config/ComponentManuallyFocus;->getDefaultValue(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    invoke-static {}, Lcom/mi/config/b;->qj()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    const/16 p3, 0xac

    invoke-virtual {p2, p3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    const/16 p3, 0xc7

    if-eqz p1, :cond_0

    invoke-interface {p2, p3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->removeConfigItem(I)V

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/android/camera/effect/EffectController;->setDrawPeaking(Z)V

    goto :goto_0

    :cond_0
    invoke-interface {p2, p3}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->insertConfigItem(I)V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    const-string p2, "pref_camera_peak_key"

    invoke-virtual {p1, p2}, Lcom/android/camera/data/data/runing/DataItemRunning;->isSwitchOn(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/android/camera/effect/EffectController;->setDrawPeaking(Z)V

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p0

    new-array p1, v1, [I

    const/16 p2, 0xe

    aput p2, p1, v0

    invoke-virtual {p0, p1}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    return-void
.end method

.method public onISOValueChanged(Lcom/android/camera/data/data/config/ComponentManuallyISO;Ljava/lang/String;)V
    .locals 3

    invoke-static {p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackIsoChanged(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 p2, 0xa4

    invoke-virtual {p1, p2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFlashSupportedInManualMode()Z

    move-result p2

    const-string v0, "mm"

    if-nez p2, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/module/BaseModule;->getModuleIndex()I

    move-result p2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemConfig()Lcom/android/camera/data/data/config/DataItemConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentFlash()Lcom/android/camera/data/data/config/ComponentConfigFlash;

    move-result-object v1

    const-string v2, "0"

    invoke-virtual {v1, p2, v2}, Lcom/android/camera/data/data/config/ComponentConfigFlash;->setComponentValue(ILjava/lang/String;)V

    const/4 p2, 0x1

    new-array p2, p2, [I

    const/4 v1, 0x0

    const/16 v2, 0xc1

    aput v2, p2, v1

    invoke-interface {p1, v0, p2}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->closeMutexElement(Ljava/lang/String;[I)V

    goto :goto_0

    :cond_0
    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->restoreMutexFlash(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p0

    const/4 p1, 0x2

    new-array p1, p1, [I

    fill-array-data p1, :array_0

    invoke-virtual {p0, p1}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    return-void

    nop

    :array_0
    .array-data 4
        0xf
        0xa
    .end array-data
.end method

.method public onWBValueChanged(Lcom/android/camera/data/data/config/ComponentManuallyWB;Ljava/lang/String;Z)V
    .locals 1

    if-eqz p3, :cond_0

    goto :goto_0

    :cond_0
    const/16 v0, 0xa7

    invoke-virtual {p1, v0}, Lcom/android/camera/data/data/config/ComponentManuallyWB;->getKey(I)Ljava/lang/String;

    :goto_0
    if-eqz p3, :cond_1

    const-string p2, "manual"

    :cond_1
    invoke-static {p2}, Lcom/android/camera/statistic/CameraStatUtil;->trackAwbChanged(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p0

    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 p2, 0x0

    const/4 p3, 0x6

    aput p3, p1, p2

    invoke-virtual {p0, p1}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    return-void
.end method

.method public registerProtocol()V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xae

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xae

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    return-void
.end method

.method public updateSATIsZooming(Z)V
    .locals 0

    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/ManuallyValueChangeImpl;->getBaseModule()Lcom/android/camera/module/BaseModule;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/android/camera/module/BaseModule;->updateSATZooming(Z)V

    return-void
.end method
