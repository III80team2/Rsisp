package com.example.danny.myapptest;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;


public class ActAssess extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.actassess);
    }

    View.OnClickListener btn1_click = new View.OnClickListener() {
        public void onClick(View arg0) {
            String url = "http://assessjson.azurewebsites.net/assessment.aspx?pid=P100126&aid=1&sid=11";

            Uri uri = Uri.parse(url);
            Intent intentWeb = new Intent(Intent.ACTION_VIEW,uri);
            startActivity(intentWeb);

        }
    };

    private void InicialComponent() {

        btn1 = (Button) findViewById(R.id.button);
        btn1.setOnClickListener(btn1_click);

    }

Button btn1;

}
