package com.android.camera.module.impl.component;

import com.android.camera.module.BaseModule;
import java.util.function.Consumer;

/* compiled from: lambda */
public final /* synthetic */ class h implements Consumer {
    public static final /* synthetic */ h INSTANCE = new h();

    private /* synthetic */ h() {
    }

    public final void accept(Object obj) {
        ConfigChangeImpl.g((BaseModule) obj);
    }
}
