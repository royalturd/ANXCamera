.class Lcom/xiaomi/rendermanager/videoRender/VideoStreamsView$1;
.super Ljava/lang/Object;
.source "VideoStreamsView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/rendermanager/videoRender/VideoStreamsView;->setSize(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/rendermanager/videoRender/VideoStreamsView;

.field final synthetic val$height:I

.field final synthetic val$self:Lcom/xiaomi/rendermanager/videoRender/VideoStreamsView;

.field final synthetic val$width:I


# direct methods
.method constructor <init>(Lcom/xiaomi/rendermanager/videoRender/VideoStreamsView;Lcom/xiaomi/rendermanager/videoRender/VideoStreamsView;II)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/rendermanager/videoRender/VideoStreamsView$1;->this$0:Lcom/xiaomi/rendermanager/videoRender/VideoStreamsView;

    iput-object p2, p0, Lcom/xiaomi/rendermanager/videoRender/VideoStreamsView$1;->val$self:Lcom/xiaomi/rendermanager/videoRender/VideoStreamsView;

    iput p3, p0, Lcom/xiaomi/rendermanager/videoRender/VideoStreamsView$1;->val$width:I

    iput p4, p0, Lcom/xiaomi/rendermanager/videoRender/VideoStreamsView$1;->val$height:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "VideoStreamView: The thread id for videoSizeChanged is:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "VideoStreamsView"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/rendermanager/videoRender/VideoStreamsView$1;->val$self:Lcom/xiaomi/rendermanager/videoRender/VideoStreamsView;

    iget v1, p0, Lcom/xiaomi/rendermanager/videoRender/VideoStreamsView$1;->val$width:I

    iget p0, p0, Lcom/xiaomi/rendermanager/videoRender/VideoStreamsView$1;->val$height:I

    invoke-virtual {v0, v1, p0}, Lcom/xiaomi/rendermanager/videoRender/VideoStreamsView;->videoSizeChanged(II)V

    return-void
.end method
