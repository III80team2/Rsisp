package com.example.danny.myapptest;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import android.app.Activity;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.KeyEvent;


public class ActMain extends Activity {




    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.actmain);
        InicialComponent();




        new Thread(new Runnable(){
            @Override
            public void run() {
                // TODO Auto-generated method stub
                while(true){
                    try{
                        Calendar calendar=Calendar.getInstance();
                        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                        setTitle(simpleDateFormat.format(calendar.getTime()));
                        Thread.sleep(1000);

                    }
                    catch(Exception e){
                        e.printStackTrace();
                    }
                }
            }
        }).start();

    }



    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_act_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }




    View.OnClickListener btnisp_click=new View.OnClickListener(){
        public void onClick(View arg0) {

            Intent intent = new Intent(ActMain.this,LoginMain.class);
            startActivity(intent);
        }
    };

    View.OnClickListener btnMap_click=new View.OnClickListener(){
        public void onClick(View arg0) {

            Uri uri = Uri.parse("geo:22.638692,120.397787,3a,75y,343.8h,71.11t");	//經緯度
            final Intent intent = new Intent(Intent.ACTION_VIEW, uri);
            startActivity(intent);
        }
    };


   //----離開對話框
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {


        if (keyCode == KeyEvent.KEYCODE_BACK) {
            new AlertDialog.Builder(ActMain.this)
                    .setTitle("結束程式")
                    .setMessage("是否確定?")

                    .setPositiveButton("確定",
                            new DialogInterface.OnClickListener() {

                                @Override
                                public void onClick(DialogInterface dialog,
                                                    int which) {
                                    finish();
                                }
                            })
                    .setNegativeButton("取消",
                            new DialogInterface.OnClickListener() {

                                @Override
                                public void onClick(DialogInterface dialog,
                                                    int which) {


                                }
                            }).show();
        }
        return true;
    }


    private void InicialComponent()
    {

        btnisp = (ImageButton) findViewById(R.id.btnisp);
        btnisp.setOnClickListener(btnisp_click);

        btnMap = (ImageButton) findViewById(R.id.btnMap);
        btnMap.setOnClickListener(btnMap_click);

        textTime1 = (EditText)findViewById(R.id.txtId);

    }


    EditText textTime1;

    ImageButton btnMap;
    ImageButton btnisp;

}
