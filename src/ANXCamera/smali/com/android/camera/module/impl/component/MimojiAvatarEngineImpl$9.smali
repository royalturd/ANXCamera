.class Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;
.super Ljava/lang/Object;
.source "MimojiAvatarEngineImpl.java"

# interfaces
.implements Lcom/arcsoft/avatar/RecordModule$MediaResultCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;


# direct methods
.method constructor <init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCaptureResult(Ljava/nio/ByteBuffer;)V
    .locals 2

    invoke-static {}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "onCapture Result"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$2600(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9$1;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9$1;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;Ljava/nio/ByteBuffer;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onVideoResult()V
    .locals 4

    invoke-static {}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "stop video record callback"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$2002(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0, v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$2102(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1900(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/android/camera/ActivityBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getImageSaver()Lcom/android/camera/storage/ImageSaver;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$2200(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$2300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/content/ContentValues;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/camera/storage/ImageSaver;->addVideo(Ljava/lang/String;Landroid/content/ContentValues;Z)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1400(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1400(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$100()Ljava/lang/String;

    move-result-object v1

    const-string v2, "fail to close fd"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$1402(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Landroid/os/ParcelFileDescriptor;)Landroid/os/ParcelFileDescriptor;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$2400(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/util/concurrent/CountDownLatch;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;->this$0:Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-static {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->access$2400(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/util/concurrent/CountDownLatch;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    :cond_1
    return-void
.end method