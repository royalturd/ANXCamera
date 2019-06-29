.class public Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;
.super Lcom/android/camera/ui/drawable/CameraPaintBase;
.source "CameraSnapPaintCircle.java"


# instance fields
.field public isInBeautyMode:Z

.field private mArcRectF:Landroid/graphics/RectF;

.field private mBeautyColor:I

.field private mNeedRing:Z

.field private mNoNeedArc:Z

.field private mOffsetPaint:Landroid/graphics/Paint;

.field private mRingWidth:F

.field private mSegmentRatios:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field private mSegmentTimes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mSpaceAngle:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;-><init>(Landroid/content/Context;)V

    const p1, -0x3967c

    iput p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mBeautyColor:I

    const/high16 p1, 0x40400000    # 3.0f

    iput p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSpaceAngle:F

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mNeedRing:Z

    return-void
.end method

.method private drawElapsedArc(Landroid/graphics/Canvas;FF)V
    .locals 6

    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mArcRectF:Landroid/graphics/RectF;

    const/high16 v0, -0x3d4c0000    # -90.0f

    add-float/2addr v0, p2

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSpaceAngle:F

    add-float/2addr v2, v0

    sub-float/2addr p3, p2

    iget p2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSpaceAngle:F

    sub-float v3, p3, p2

    iget-object v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    const/4 v4, 0x0

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawOffset(Landroid/graphics/Canvas;F)V
    .locals 6

    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mArcRectF:Landroid/graphics/RectF;

    const/high16 v0, -0x3d4c0000    # -90.0f

    add-float/2addr v0, p2

    iget p2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSpaceAngle:F

    sub-float v2, v0, p2

    iget p2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSpaceAngle:F

    const/high16 v0, 0x40000000    # 2.0f

    mul-float v3, p2, v0

    iget-object v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mOffsetPaint:Landroid/graphics/Paint;

    const/4 v4, 0x0

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    return-void
.end method


# virtual methods
.method public addSegmentNow(J)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentRatios:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentRatios:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentRatios:Ljava/util/List;

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->timeAngle:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentTimes:Ljava/util/List;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentTimes:Ljava/util/List;

    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentTimes:Ljava/util/List;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public clearSegments()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentRatios:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentRatios:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    :cond_0
    return-void
.end method

.method protected draw(Landroid/graphics/Canvas;)V
    .locals 11

    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mNoNeedArc:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->isRecording:Z

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->isRecording:Z

    if-eqz v0, :cond_7

    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mBaseRadius:F

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentWidthPercent:F

    mul-float/2addr v0, v1

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mMiddleX:F

    sub-float/2addr v1, v0

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mMiddleY:F

    sub-float/2addr v2, v0

    iget v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mMiddleX:F

    add-float/2addr v3, v0

    iget v4, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mMiddleY:F

    add-float/2addr v4, v0

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    iget-boolean v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->isInBeautyMode:Z

    if-eqz v5, :cond_1

    iget v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentAlpha:I

    goto :goto_0

    :cond_1
    sget v5, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->ALPHA_HINT:I

    :goto_0
    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mArcRectF:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v6, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mArcRectF:Landroid/graphics/RectF;

    const/high16 v7, -0x3d4c0000    # -90.0f

    const/high16 v8, 0x43b40000    # 360.0f

    const/4 v9, 0x0

    iget-object v10, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    move-object v5, p1

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    sget v1, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->ALPHA_OPAQUE:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->isInBeautyMode:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mBeautyColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    :cond_2
    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mArcRectF:Landroid/graphics/RectF;

    const/high16 v0, -0x3d4c0000    # -90.0f

    iget-boolean v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->isClockwise:Z

    const/4 v8, 0x0

    if-eqz v1, :cond_3

    move v1, v8

    goto :goto_1

    :cond_3
    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->timeAngle:F

    :goto_1
    add-float v4, v0, v1

    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->isClockwise:Z

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->timeAngle:F

    goto :goto_2

    :cond_4
    const/high16 v0, 0x43b40000    # 360.0f

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->timeAngle:F

    sub-float/2addr v0, v1

    :goto_2
    invoke-static {v8, v0}, Ljava/lang/Math;->max(FF)F

    move-result v5

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mOffsetPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    add-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->timeAngle:F

    cmpl-float v0, v0, v8

    if-eqz v0, :cond_5

    invoke-direct {p0, p1, v8}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->drawOffset(Landroid/graphics/Canvas;F)V

    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->timeAngle:F

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->drawOffset(Landroid/graphics/Canvas;F)V

    :cond_5
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentRatios:Ljava/util/List;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentRatios:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-direct {p0, p1, v1}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->drawOffset(Landroid/graphics/Canvas;F)V

    goto :goto_3

    :cond_6
    goto :goto_4

    :cond_7
    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mNeedRing:Z

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    sget v1, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->ALPHA_OUTSTANDING:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mMiddleX:F

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mMiddleY:F

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mBaseRadius:F

    iget v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mRingWidth:F

    mul-float/2addr v2, v3

    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentAlpha:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_4

    :cond_8
    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mMiddleX:F

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mMiddleY:F

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mBaseRadius:F

    iget v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentWidthPercent:F

    mul-float/2addr v2, v3

    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :goto_4
    return-void
.end method

.method public getSegmentRatios()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentRatios:Ljava/util/List;

    return-object v0
.end method

.method public hasSegments()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentRatios:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentRatios:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected initPaint(Landroid/content/Context;)V
    .locals 3

    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mArcRectF:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mOffsetPaint:Landroid/graphics/Paint;

    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mOffsetPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mOffsetPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mOffsetPaint:Landroid/graphics/Paint;

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mOffsetPaint:Landroid/graphics/Paint;

    const/high16 v0, -0x1000000

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mOffsetPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    return-void
.end method

.method public removeLastSegmentAndGetLastTime()J
    .locals 4

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentRatios:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_0

    return-wide v1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentRatios:Ljava/util/List;

    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentRatios:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v0, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentTimes:Ljava/util/List;

    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentTimes:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v0, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentRatios:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->timeAngle:F

    return-wide v1

    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentRatios:Ljava/util/List;

    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentRatios:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->timeAngle:F

    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentTimes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    return-wide v1

    :cond_2
    iget-object v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentTimes:Ljava/util/List;

    iget-object v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSegmentTimes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public resetRecordingState()V
    .locals 1

    invoke-super {p0}, Lcom/android/camera/ui/drawable/CameraPaintBase;->resetRecordingState()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->setNeedSplit(Z)V

    return-void
.end method

.method public setNeedSplit(Z)V
    .locals 1

    xor-int/lit8 v0, p1, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mNoNeedArc:Z

    if-eqz p1, :cond_0

    const/high16 p1, 0x3fc00000    # 1.5f

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mSpaceAngle:F

    return-void
.end method

.method public setRingVisible(I)V
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mNeedRing:Z

    return-void
.end method

.method public updateValue(F)V
    .locals 3

    invoke-super {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;->updateValue(F)V

    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentWidthPercent:F

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mCurrentWidthPercent:F

    const v2, 0x3ecccccd    # 0.4f

    mul-float/2addr v2, v1

    mul-float/2addr v2, p1

    add-float/2addr v0, v2

    iput v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintCircle;->mRingWidth:F

    return-void
.end method