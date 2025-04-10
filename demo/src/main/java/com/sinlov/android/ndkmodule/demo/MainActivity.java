package com.sinlov.android.ndkmodule.demo;

import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;

import com.hjq.permissions.OnPermissionCallback;
import com.hjq.permissions.Permission;
import com.hjq.permissions.XXPermissions;
import com.sinlov.android.ndkmodule.Plugin;
import com.sinlov.temp.android.AbsTemplateActivity;
import com.sinlov.temp.android.system.PMSUtil;
import com.sinlov.temp.android.utils.ClipboardUtils;

import java.util.List;

import timber.log.Timber;

public class MainActivity extends AbsTemplateActivity {

    @Override
    protected int getLayoutId() {
        return R.layout.activity_main;
    }

    @Override
    protected void initView() {
        setOnClickListener(
                R.id.btn_init_check,
                R.id.btn_skip_to_module,
                R.id.btn_skip_app_details,
                R.id.btn_grant_permission,
                R.id.btn_get_package_name,
                R.id.btn_get_module_version,
                R.id.tv_result
        );
        TextView tvInfo = findViewById(R.id.tv_info);
        tvInfo.setText(String.format("Name: %s, %s",
                PMSUtil.selfAppName(this),
                PMSUtil.isSelfDebug(this) ? "mode DEBUG" : "Release"
        ));

        Timber.d("now TAG %s", TAG);
    }

    @Override
    protected void initData(Bundle savedInstanceState) {
        if (BuildConfig.DEBUG) {
            Timber.d("activity initData, only show at debug package");
        }
    }

    @Override
    public void onClick(View view) {
        int id = view.getId();
        if (id == R.id.btn_init_check) {
            toastBottom("module init check");
        } else if (id == R.id.btn_skip_to_module) {
//            toast("Skip to module wait change!");
            toast(String.format("Skip to module wait change!\nndk sayHello: %s", Plugin.getInstance().sayHello()));
        } else if (id == R.id.btn_skip_app_details) {
            XXPermissions.startApplicationDetails(this);
        } else if (id == R.id.btn_grant_permission) {
            requestFullPermission();
        } else if (id == R.id.btn_get_package_name) {
            String showInfo = String.format("ndk getPackageName: %s", Plugin.getInstance().getPackageName());
            showAtTvResult(showInfo);
            toast(showInfo);
        } else if (id == R.id.btn_get_module_version) {
            String showInfo = String.format("ndk moduleVersion: %s", Plugin.getInstance().moduleVersion());
            showAtTvResult(showInfo);
            toast(showInfo);
        } else if (id == R.id.tv_result) {
            TextView tvResult = findViewById(R.id.tv_result);
            ClipboardUtils.copy2Clipboard(getBaseContext(), tvResult.getText().toString());
            toast("copy at Clipboard");
        }
    }

    private void showAtTvResult(String info) {
        if (TextUtils.isEmpty(info)) {
            info = "<info nil please check>";
        }
        TextView tvResult = findViewById(R.id.tv_result);
        tvResult.setText(info);
    }

    private void requestFullPermission() {
        XXPermissions.with(MainActivity.this)
//                .permission(Permission.MANAGE_EXTERNAL_STORAGE)
                .permission(Permission.READ_EXTERNAL_STORAGE)
                .permission(Permission.WRITE_EXTERNAL_STORAGE)
                .request(new NeedPermissionCall());
    }

    private class NeedPermissionCall implements OnPermissionCallback {
        @Override
        public void onGranted(List<String> permissions, boolean all) {
            if (all) {
                toast("已授权全部权限");
            } else {
                toast("获取部分权限成功，但部分权限未正常授予");
                requestFullPermission();
            }
        }

        @Override
        public void onDenied(List<String> permissions, boolean never) {
            if (never) {
                toast("被永久拒绝授权，请手动授予权限");
                // 如果是被永久拒绝就跳转到应用权限系统设置页面
                XXPermissions.startPermissionActivity(MainActivity.this, permissions);
            } else {
                toast("文件存储权限失败");
                requestFullPermission();
            }
        }
    }
}
