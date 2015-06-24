package com.example.danny.myapptest;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import java.net.URI;
import java.util.ArrayList;


public class LoginMain extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.loginmain);
        InicialComponent();


    }

    private static final int MENU_exit = Menu.FIRST ;
    @Override

    public boolean onCreateOptionsMenu(Menu menu) {

        menu.add(0, MENU_exit, 0,"首頁");

        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item)
    {

        switch(item.getItemId()) {


            case MENU_exit :
//結束此程式
                new AlertDialog.Builder(LoginMain.this)
                        .setTitle("回首頁")
                        .setMessage("是否確定?")
                        .setPositiveButton("確定", new DialogInterface.OnClickListener()
                        {
                            @Override
                            public void onClick(DialogInterface dialog,int which)
                            {
                                finish();
                            }
                        }).setNegativeButton("取消",new DialogInterface.OnClickListener()
                {
                    @Override

                    public void onClick(DialogInterface dialog,int which)
                    {

                    }
                }).show();


                break;
            default:
        }
        return super.onOptionsItemSelected(item);


    }



   View.OnClickListener btnSubmit_click = new View.OnClickListener() {
        public void onClick(View arg0) {


            Uri uri = Uri.parse("http://rsisp-assess.azurewebsites.net/patientSelect.aspx");

            Intent intent = new Intent(Intent.ACTION_VIEW,uri);
            startActivity(intent);

            Toast.makeText(LoginMain.this ,"登入成功" , Toast.LENGTH_SHORT);

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
