package com.ss.android.ugc.effectmanager;

import android.support.annotation.Nullable;
import com.ss.android.ugc.effectmanager.effect.listener.ICheckChannelListener;
import com.ss.android.ugc.effectmanager.effect.listener.IDownloadProviderEffectListener;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchCategoryEffectListener;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchEffectChannelListener;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchEffectListListener;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchEffectListener;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchFavoriteList;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchPanelInfoListener;
import com.ss.android.ugc.effectmanager.effect.listener.IFetchProviderEffect;
import com.ss.android.ugc.effectmanager.effect.listener.IModFavoriteList;
import com.ss.android.ugc.effectmanager.effect.listener.IReadUpdateTagListener;
import com.ss.android.ugc.effectmanager.effect.listener.IWriteUpdateTagListener;
import java.util.HashMap;
import java.util.Map;

public class ListenerManger {
    private Map<String, ICheckChannelListener> checkChannelListenerMap = new HashMap();
    private Map<String, IFetchEffectChannelListener> fetchEffectChannelListenerMap = new HashMap();
    private Map<String, IFetchEffectListListener> fetchEffectListListenerMap = new HashMap();
    private Map<String, IFetchEffectListener> fetchEffectListenerMap = new HashMap();
    private Map<String, IDownloadProviderEffectListener> mDownloadProviderEffectMap;
    private Map<String, IFetchCategoryEffectListener> mFetchCategoryEffectListenerMap;
    private Map<String, IFetchFavoriteList> mFetchFavoriteListMap = new HashMap();
    private Map<String, IFetchPanelInfoListener> mFetchPanelInfoListenerMap;
    private Map<String, IFetchProviderEffect> mFetchProviderEffectMap;
    private Map<String, IModFavoriteList> mModFavoriteListMap = new HashMap();
    private Map<String, IReadUpdateTagListener> mReadUpdateTagMap = new HashMap();
    private Map<String, IWriteUpdateTagListener> mWriteUpdateTagMap = new HashMap();

    public void destroy() {
        for (String put : this.checkChannelListenerMap.keySet()) {
            this.checkChannelListenerMap.put(put, null);
        }
        for (String put2 : this.fetchEffectChannelListenerMap.keySet()) {
            this.fetchEffectChannelListenerMap.put(put2, null);
        }
        for (String put3 : this.fetchEffectListListenerMap.keySet()) {
            this.fetchEffectListListenerMap.put(put3, null);
        }
        for (String put4 : this.fetchEffectListenerMap.keySet()) {
            this.fetchEffectListenerMap.put(put4, null);
        }
        for (String put5 : this.mModFavoriteListMap.keySet()) {
            this.mModFavoriteListMap.put(put5, null);
        }
        for (String put6 : this.mFetchFavoriteListMap.keySet()) {
            this.mFetchFavoriteListMap.put(put6, null);
        }
        for (String put7 : this.mReadUpdateTagMap.keySet()) {
            this.mReadUpdateTagMap.put(put7, null);
        }
        for (String put8 : this.mWriteUpdateTagMap.keySet()) {
            this.mWriteUpdateTagMap.put(put8, null);
        }
        Map<String, IFetchProviderEffect> map = this.mFetchProviderEffectMap;
        if (map != null) {
            map.clear();
        }
    }

    public ICheckChannelListener getCheckChannelListener(String str) {
        if (this.checkChannelListenerMap == null) {
            this.checkChannelListenerMap = new HashMap();
        }
        return (ICheckChannelListener) this.checkChannelListenerMap.get(str);
    }

    @Nullable
    public IDownloadProviderEffectListener getDownloadProviderEffectListener(String str) {
        Map<String, IDownloadProviderEffectListener> map = this.mDownloadProviderEffectMap;
        if (map == null) {
            return null;
        }
        return (IDownloadProviderEffectListener) map.get(str);
    }

    public IFetchCategoryEffectListener getFetchCategoryEffectListener(String str) {
        Map<String, IFetchCategoryEffectListener> map = this.mFetchCategoryEffectListenerMap;
        if (map == null) {
            return null;
        }
        return (IFetchCategoryEffectListener) map.get(str);
    }

    public IFetchEffectChannelListener getFetchEffectChannelListener(String str) {
        if (this.fetchEffectChannelListenerMap == null) {
            this.fetchEffectChannelListenerMap = new HashMap();
        }
        return (IFetchEffectChannelListener) this.fetchEffectChannelListenerMap.get(str);
    }

    public IFetchEffectListListener getFetchEffectLisListener(String str) {
        if (this.fetchEffectListListenerMap == null) {
            this.fetchEffectListListenerMap = new HashMap();
        }
        return (IFetchEffectListListener) this.fetchEffectListListenerMap.get(str);
    }

    public IFetchEffectListener getFetchEffectListener(String str) {
        if (this.fetchEffectListenerMap == null) {
            this.fetchEffectListenerMap = new HashMap();
        }
        return (IFetchEffectListener) this.fetchEffectListenerMap.get(str);
    }

    public IFetchFavoriteList getFetchFavoriteListListener(String str) {
        if (this.mFetchFavoriteListMap == null) {
            this.mFetchFavoriteListMap = new HashMap();
        }
        return (IFetchFavoriteList) this.mFetchFavoriteListMap.get(str);
    }

    public IFetchPanelInfoListener getFetchPanelInfoListener(String str) {
        Map<String, IFetchPanelInfoListener> map = this.mFetchPanelInfoListenerMap;
        if (map == null) {
            return null;
        }
        return (IFetchPanelInfoListener) map.get(str);
    }

    @Nullable
    public IFetchProviderEffect getFetchProviderEffectListener(String str) {
        Map<String, IFetchProviderEffect> map = this.mFetchProviderEffectMap;
        if (map == null) {
            return null;
        }
        return (IFetchProviderEffect) map.get(str);
    }

    public IModFavoriteList getModFavoriteListListener(String str) {
        if (this.mModFavoriteListMap == null) {
            this.mModFavoriteListMap = new HashMap();
        }
        return (IModFavoriteList) this.mModFavoriteListMap.get(str);
    }

    public IReadUpdateTagListener getReadUpdateTagListener(String str) {
        if (this.mReadUpdateTagMap == null) {
            this.mReadUpdateTagMap = new HashMap();
        }
        return (IReadUpdateTagListener) this.mReadUpdateTagMap.get(str);
    }

    public IWriteUpdateTagListener getWriteUpdateTagListener(String str) {
        if (this.mWriteUpdateTagMap == null) {
            this.mWriteUpdateTagMap = new HashMap();
        }
        return (IWriteUpdateTagListener) this.mWriteUpdateTagMap.get(str);
    }

    public void removeReadUpdateTagListener(String str) {
        Map<String, IReadUpdateTagListener> map = this.mReadUpdateTagMap;
        if (map != null) {
            map.remove(str);
        }
    }

    public void removeWriteUpdateTagListener(String str) {
        Map<String, IWriteUpdateTagListener> map = this.mWriteUpdateTagMap;
        if (map != null) {
            map.remove(str);
        }
    }

    public void setCheckChannelListener(String str, ICheckChannelListener iCheckChannelListener) {
        if (this.checkChannelListenerMap == null) {
            this.checkChannelListenerMap = new HashMap();
        }
        this.checkChannelListenerMap.put(str, iCheckChannelListener);
    }

    public void setDownloadProviderEffectListener(String str, IDownloadProviderEffectListener iDownloadProviderEffectListener) {
        if (this.mDownloadProviderEffectMap == null) {
            this.mDownloadProviderEffectMap = new HashMap();
        }
        this.mDownloadProviderEffectMap.put(str, iDownloadProviderEffectListener);
    }

    public void setFetchCategoryEffectListener(String str, IFetchCategoryEffectListener iFetchCategoryEffectListener) {
        if (this.mFetchCategoryEffectListenerMap == null) {
            this.mFetchCategoryEffectListenerMap = new HashMap();
        }
        this.mFetchCategoryEffectListenerMap.put(str, iFetchCategoryEffectListener);
    }

    public void setFetchEffectChannelListener(String str, IFetchEffectChannelListener iFetchEffectChannelListener) {
        if (this.fetchEffectChannelListenerMap == null) {
            this.fetchEffectChannelListenerMap = new HashMap();
        }
        this.fetchEffectChannelListenerMap.put(str, iFetchEffectChannelListener);
    }

    public void setFetchEffectListListener(String str, IFetchEffectListListener iFetchEffectListListener) {
        if (this.fetchEffectListenerMap == null) {
            this.fetchEffectListenerMap = new HashMap();
        }
        this.fetchEffectListListenerMap.put(str, iFetchEffectListListener);
    }

    public void setFetchEffectListener(String str, IFetchEffectListener iFetchEffectListener) {
        if (this.fetchEffectListenerMap == null) {
            this.fetchEffectListenerMap = new HashMap();
        }
        this.fetchEffectListenerMap.put(str, iFetchEffectListener);
    }

    public void setFetchFavoriteListListener(String str, IFetchFavoriteList iFetchFavoriteList) {
        if (this.mFetchFavoriteListMap == null) {
            this.mFetchFavoriteListMap = new HashMap();
        }
        this.mFetchFavoriteListMap.put(str, iFetchFavoriteList);
    }

    public void setFetchPanelInfoListener(String str, IFetchPanelInfoListener iFetchPanelInfoListener) {
        if (this.mFetchPanelInfoListenerMap == null) {
            this.mFetchPanelInfoListenerMap = new HashMap();
        }
        this.mFetchPanelInfoListenerMap.put(str, iFetchPanelInfoListener);
    }

    public void setFetchProviderEffectListener(String str, IFetchProviderEffect iFetchProviderEffect) {
        if (this.mFetchProviderEffectMap == null) {
            this.mFetchProviderEffectMap = new HashMap();
        }
        this.mFetchProviderEffectMap.put(str, iFetchProviderEffect);
    }

    public void setModFavoriteListener(String str, IModFavoriteList iModFavoriteList) {
        if (this.mModFavoriteListMap == null) {
            this.mModFavoriteListMap = new HashMap();
        }
        this.mModFavoriteListMap.put(str, iModFavoriteList);
    }

    public void setReadUpdateTagListener(String str, IReadUpdateTagListener iReadUpdateTagListener) {
        if (this.mReadUpdateTagMap == null) {
            this.mReadUpdateTagMap = new HashMap();
        }
        this.mReadUpdateTagMap.put(str, iReadUpdateTagListener);
    }

    public void setWriteUpdateTagListener(String str, IWriteUpdateTagListener iWriteUpdateTagListener) {
        if (this.mWriteUpdateTagMap == null) {
            this.mWriteUpdateTagMap = new HashMap();
        }
        this.mWriteUpdateTagMap.put(str, iWriteUpdateTagListener);
    }
}
