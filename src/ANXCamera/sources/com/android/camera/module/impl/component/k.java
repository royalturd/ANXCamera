package com.android.camera.module.impl.component;

import com.android.camera.module.BaseModule;
import java.util.function.Consumer;

/* compiled from: lambda */
public final /* synthetic */ class k implements Consumer {
    public static final /* synthetic */ k INSTANCE = new k();

    private /* synthetic */ k() {
    }

    public final void accept(Object obj) {
        ((BaseModule) obj).onSharedPreferenceChanged();
    }
}
