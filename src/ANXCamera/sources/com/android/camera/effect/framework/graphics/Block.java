package com.android.camera.effect.framework.graphics;

public class Block {
    public int mAdjHeight;
    public int mAdjWidth;
    public int mHeight;
    public int mOffset;
    public int mRowStride;
    public int mWidth;

    public int[] getOffset(int i, int i2) {
        int i3 = this.mOffset;
        int i4 = i3 % i;
        int i5 = this.mAdjWidth;
        int i6 = i4 / i5;
        int i7 = i3 / i;
        int i8 = this.mAdjHeight;
        return new int[]{i6 * i5, (i7 / i8) * i8};
    }

    public int[] getYUVOffset(int i, int i2, int i3, int i4) {
        int i5 = this.mOffset;
        int i6 = i5 / i3;
        int i7 = i5 % i3;
        return new int[]{(i * i6) + i7, (((int) Math.floor(((double) i6) / 2.0d)) * i2) + i7};
    }
}
