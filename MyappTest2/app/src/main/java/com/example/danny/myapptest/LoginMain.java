package com.example.danny.myapptest;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;


public class LoginMain extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.loginmain);
        InicialComponent();


        setTitle("***********歡迎進入本系統***********");

    }


    View.OnClickListener btnSubmit_click = new View.OnClickListener() {
        public void onClick(View arg0) {

            Toast message = Toast.makeText(
                    LoginMain.this,
                    "偵測到 帥哥  在附近",
                    Toast.LENGTH_LONG);
            message.show();
        }
    };


    private void InicialComponent() {

        btnSubmit = (Button) findViewById(R.id.btnSubmit);
        aa = (TextView) findViewById(R.id.txtId);
        btnSubmit.setOnClickListener(btnSubmit_click);


    }

    Button btnSubmit;
    TextView aa;

}
