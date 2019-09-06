package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import java.security.MessageDigest;

/* compiled from: CenterInside */
public class k extends g {
    private static final String ID = "com.bumptech.glide.load.resource.bitmap.CenterInside";
    private static final byte[] ui = ID.getBytes(c.CHARSET);

    public boolean equals(Object obj) {
        return obj instanceof k;
    }

    public int hashCode() {
        return ID.hashCode();
    }

    /* access modifiers changed from: protected */
    public Bitmap transform(@NonNull d dVar, @NonNull Bitmap bitmap, int i, int i2) {
        return y.b(dVar, bitmap, i, i2);
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        messageDigest.update(ui);
    }
}