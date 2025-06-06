package com.sinlov.android.ndkmodule;

/**
 * this class can delete if not use Singleton
 */
public final class Plugin {

    static {
        System.loadLibrary("ndkmodule-lib");
    }

    public native String moduleVersion();

    public native String sayHello();

    public native String getPackageName();

    /**
     * do biz
     */
    public void biz() {

    }

    /**
     * plugin instance
     *
     * @return {@link Plugin}
     */
    public static Plugin getInstance() {
        return Instance.instance;
    }

    private Plugin() {
    }

    private static class Instance {
        private static final Plugin instance = new Plugin();
    }
}
