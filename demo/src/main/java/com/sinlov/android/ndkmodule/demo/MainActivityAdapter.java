package com.sinlov.android.ndkmodule.demo;

import javax.inject.Inject;

public class MainActivityAdapter {

    private final MainBizService mainBizService;

    @Inject
    public MainActivityAdapter(MainBizService mainBizService) {
        this.mainBizService = mainBizService;
    }
}
