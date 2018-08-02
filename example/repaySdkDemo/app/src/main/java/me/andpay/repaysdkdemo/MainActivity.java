package me.andpay.repaysdkdemo;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

import java.util.HashMap;
import java.util.Map;

import me.andpay.ma.repay.sdk.RepayConfig;
import me.andpay.ma.repay.sdk.RepaySdkManager;

public class MainActivity extends AppCompatActivity {

    private String env;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        findViewById(R.id.stage1).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                env = "stage1";
                openRepaySdk();
            }
        });

        findViewById(R.id.pro).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                env = "pro";
                openRepaySdk();
            }
        });
    }

    private void openRepaySdk(){
        //请先使用授权接口获取token
        Map<String, Object> params = new HashMap<>();
        params.put("env", env);
        params.put("token", "");//必填
        params.put("partyId", "");//必填
        params.put("mobileNo", "");//必填
        final RepayConfig repayConfig = new RepayConfig();
        repayConfig.setDebug(true);
        RepaySdkManager.init(repayConfig);
        RepaySdkManager.startRepayModule(MainActivity.this,params);
    }
}
