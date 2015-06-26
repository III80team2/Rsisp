package com.example.danny.myapptest;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebView;


public class ActBrowser extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.actbrowser);
        InicialComponent();
        Bundle bundle =this.getIntent().getExtras();
        url = bundle.getString("url");
        webBrowser.loadUrl(url.toString());

    }


    private void InicialComponent() {

        webBrowser=(WebView)findViewById(R.id.browser);

    }

    String url;
    WebView webBrowser;


}
