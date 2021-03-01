package com.sinlov.android.ndkmodule.demo;


import dagger.Component;

@Component(modules = {
        MainBizModules.class
})
public interface MainActivityComponent {

    void inject(MainActivityAbstract mainActivityAbstract);

    void tag(String tag);
}
