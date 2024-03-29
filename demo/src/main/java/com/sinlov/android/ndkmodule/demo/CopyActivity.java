package com.sinlov.android.ndkmodule.demo;

import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;

import androidx.annotation.Nullable;

import com.sinlov.temp.android.AbsTemplateActivity;

import timber.log.Timber;

public class CopyActivity extends AbsTemplateActivity {

    private TextView tvInfo;
    private TextView tvResult;

    @Override
    protected int getLayoutId() {
        return R.layout.activity_copy;
    }

    @Override
    protected void initView() {
        Timber.d("now TAG %s", TAG);
        tvInfo = findViewById(R.id.tv_info);
        tvResult = findViewById(R.id.tv_result);
        setOnClickListener(
                R.id.btn_init_check,
                R.id.btn_version
        );
    }

    @Override
    protected void initData(Bundle savedInstanceState) {

    }

    @Override
    public void onClick(View view) {
        int id = view.getId();
        if (id == R.id.btn_init_check) {
            toastBottom("module init check");
        } else if (id == R.id.btn_version) {
            toast("want show version");
            showInfo("want show version");
        }
    }

    private void showInfo(@Nullable String info) {
        if (TextUtils.isEmpty(info)) {
            info = "empty";
        }
        tvInfo.setText(info);
        Timber.d("showInfo: %s", info);
        tvResult.setText("");
    }
}