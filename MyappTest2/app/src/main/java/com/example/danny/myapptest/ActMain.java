package com.example.danny.myapptest;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.Toast;

import com.google.zxing.integration.android.IntentIntegrator;
import com.google.zxing.integration.android.IntentResult;

import java.text.SimpleDateFormat;
import java.util.Calendar;


public class ActMain extends Activity {

    private Activity mainactivity;
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
    private static final int MENU_Login = Menu.FIRST;
    //private static final int MENU_Add = Menu.FIRST + 1;
    private static final int MENU_About = Menu.FIRST + 1;
    private static final int MENU_exit = Menu.FIRST + 2;

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {


            menu.add(0, MENU_Login, 0, "登入");
           // menu.add(0, MENU_Add, 0,"註冊");
            menu.add(0, MENU_About, 0, "關於我們");
            menu.add(0, MENU_exit, 0,"離開本系統");

        return super.onCreateOptionsMenu(menu);
    }



    @Override
    public boolean onOptionsItemSelected(MenuItem item)
    {

        switch(item.getItemId()) {
            case MENU_Login:
//撰寫點選此選單要執行的功能，例如：變更標題列...
                Intent intent = new Intent(ActMain.this,LoginMain.class);
                startActivity(intent);
                break;

            case MENU_About:

                Notification message =new Notification(
                        android.R.drawable.stat_notify_error,
                        "您有3封簡訊未讀取",
                        System.currentTimeMillis());

                PendingIntent pend  = PendingIntent.getActivity(
                        ActMain.this,
                        0,
                        new Intent(ActMain.this,ActMain.class),
                        PendingIntent.FLAG_UPDATE_CURRENT);

                message.setLatestEventInfo(
                        ActMain.this,
                        "威爵工作室",
                        "成員:黃大仙,蘇愚民,薛大神,林神手,陳小明",
                        pend);

                NotificationManager manager=(NotificationManager)getSystemService(NOTIFICATION_SERVICE);
                manager.notify(0, message);

                Toast.makeText(ActMain.this,"歡迎使用威爵工作室系統",Toast.LENGTH_SHORT).show();
                Toast.makeText(ActMain.this,"請注意通知欄",Toast.LENGTH_LONG).show();



                break;

            case MENU_exit :
//結束此程式
                new AlertDialog.Builder(ActMain.this)
                        .setTitle("離開本系統")
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


    View.OnClickListener btnlogin_click=new View.OnClickListener(){
        public void onClick(View arg0) {

            Intent intent = new Intent(ActMain.this,LoginMain.class);
            startActivity(intent);


        }
    };

    View.OnClickListener btnMap_click=new View.OnClickListener(){
        public void onClick(View arg0) {

//            Uri uri = Uri.parse("geo:22.638692,120.397787,3a,75y,343.8h,71.11t");	//經緯度
//            Intent intent = new Intent(Intent.ACTION_VIEW, uri);
//            startActivity(intent);
            Intent intent = new Intent(ActMain.this,ActMap.class);
            startActivity(intent);

        }
    };

    View.OnClickListener btnSc_click=new View.OnClickListener(){
        public void onClick(View arg0) {

            Intent intent1 = new Intent(ActMain.this,ActTodo.class);
            startActivity(intent1);

        }
    };

    View.OnClickListener btnq_click = new View.OnClickListener() {
        @Override
        public void onClick(View view) {
            IntentIntegrator scanIntegrator = new IntentIntegrator(mainactivity);
            scanIntegrator.initiateScan();
        }
    };

    public void onActivityResult(int requestCode, int resultCode, Intent intent){
        IntentResult scanningResult = IntentIntegrator.parseActivityResult(requestCode, resultCode, intent);
        if(scanningResult!=null){
            String scanContent=scanningResult.getContents();
            //String scanFormat=scanningResult.getFormatName();

            AlertDialog.Builder build=new AlertDialog.Builder(ActMain.this);
            build.setTitle("掃描到帥哥在附近");
            build.setMessage(scanContent).create().show();

//            scan_content.setText(scanContent);
//            scan_format.setText(scanFormat);
        }else{
            Toast.makeText(getApplicationContext(), "nothing", Toast.LENGTH_SHORT).show();
        }
    }

   //----離開對話框
    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {


        if (keyCode == KeyEvent.KEYCODE_BACK) {
            new AlertDialog.Builder(ActMain.this)
                    .setTitle("離開本系統")
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

        btnlogin = (ImageButton) findViewById(R.id.btnlogin);
        btnlogin.setOnClickListener(btnlogin_click);

        btnMap = (ImageButton) findViewById(R.id.btnMap);
        btnMap.setOnClickListener(btnMap_click);

        btnSc = (ImageButton) findViewById(R.id.btnSc);
        btnSc.setOnClickListener(btnSc_click);

        btnq = (ImageButton) findViewById(R.id.btnq);
        btnq.setOnClickListener(btnq_click);
        this.mainactivity=this;

        textTime1 = (EditText)findViewById(R.id.txtId);

    }


    EditText textTime1;


    ImageButton btnSc;
    ImageButton btnMap;
    ImageButton btnlogin;
    ImageButton btnq;

}
