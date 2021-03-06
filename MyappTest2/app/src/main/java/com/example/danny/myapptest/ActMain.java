package com.example.danny.myapptest;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.AsyncTask;
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

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;


public class ActMain extends Activity {

    private Activity mainactivity;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.actmain);
        InicialComponent();
        new AsyncTaskParseJson().execute();

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
                        android.R.drawable.star_big_on,
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
                Toast.makeText(ActMain.this,"請注意通知欄",Toast.LENGTH_SHORT).show();


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

            Intent intent = new Intent(ActMain.this,ActMap.class);
            startActivity(intent);

        }
    };

    View.OnClickListener btnSc_click=new View.OnClickListener(){
        public void onClick(View arg0) {

            Intent intent = new Intent(ActMain.this,ActTodo.class);
            startActivity(intent);

        }
    };

    View.OnClickListener btnq_click = new View.OnClickListener() {
        @Override
        public void onClick(View view) {
            IntentIntegrator scanIntegrator = new IntentIntegrator(mainactivity);
            scanIntegrator.initiateScan();
        }
    };


    public void getToDoList(String pid)
    {
        ArrayList<Integer> indexList = new ArrayList<Integer>();

        for(int i=0;i<pIdList.size();i++){
            if((pIdList.get(i).contains(pid))&&(isfinishedList.get(i).equals("true"))){
                indexList.add(i);
            }
        }
        if(indexList.size()>0){
            for(int j=0;j<indexList.size();j++){
                sIdList2.add(sIdList.get(indexList.get(j)).toString());
                aNameList2.add(aNameList.get(indexList.get(j)).toString());
                aIdList2.add(aIdList.get(indexList.get(j)).toString());
                pIdList2.add(pIdList.get(indexList.get(j)).toString());
            }
            Intent intent = new Intent(ActMain.this,ActAssess.class);
            Bundle bundle = new Bundle();
            bundle.putStringArrayList("sId", sIdList2);
            bundle.putStringArrayList("aName", aNameList2);
            bundle.putStringArrayList("aId", aIdList2);
            bundle.putStringArrayList("pId", pIdList2);
            intent.putExtras(bundle);
            startActivity(intent);
        }
        else{
            Toast.makeText(ActMain.this,"該病患無填寫完畢之評估表",Toast.LENGTH_SHORT).show();
            return;
        }
    }

    //QRCode後續動作
    public void onActivityResult(int requestCode, int resultCode, Intent intent){
        IntentResult scanningResult = IntentIntegrator.parseActivityResult(requestCode, resultCode, intent);
        if(scanningResult!=null){
            getToDoList(scanningResult.getContents());
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

        pIdList = new ArrayList<String>();
        pIdList2 = new ArrayList<String>();
        aNameList2 = new ArrayList<String>();
        aNameList = new ArrayList<String>();
        aIdList = new ArrayList<String>();
        aIdList2 = new ArrayList<String>();
        isfinishedList = new ArrayList<String>();
        sIdList = new ArrayList<String>();
        sIdList2 = new ArrayList<String>();


        textTime1 = (EditText)findViewById(R.id.txtId);

    }

    public class AsyncTaskParseJson extends AsyncTask<String, String, String> {

        // set your json string url here
        String yourJsonStringUrl = "http://assessjson.azurewebsites.net/";

        // contacts JSONArray
        JSONArray dataJsonArr = null;

        @Override
        protected void onPreExecute() {}

        @Override
        protected String doInBackground(String... arg0) {

            try {

                // instantiate our json parser
                JsonParser jParser = new JsonParser();

                // get json string from url
                //JSONObject json = jParser.getJSONFromUrl(yourJsonStringUrl);

                // get the array of users
                dataJsonArr = jParser.getJSONFromUrl(yourJsonStringUrl);

                // loop through all users
                for (int i = 0; i < dataJsonArr.length(); i++) {

                    JSONObject c = dataJsonArr.getJSONObject(i);

                    // Storing each json item in variable
                    String patient_id = c.getString("patient_id");
                    String assess_name = c.getString("assess_name");
                    String isFinished = c.getString("isFinished");
                    String assess_id = c.getString("assess_id");
                    String schedule_id = c.getString("id");
                    pIdList.add(patient_id);
                    aNameList.add(assess_name);
                    isfinishedList.add(isFinished);
                    aIdList.add(assess_id);
                    sIdList.add(schedule_id);

                }

            } catch (JSONException e) {
                e.printStackTrace();
            }

            return null;
        }

    }

    EditText textTime1;
    ImageButton btnSc;
    ImageButton btnMap;
    ImageButton btnlogin;
    ImageButton btnq;
    ArrayList<String> pIdList;
    ArrayList<String> pIdList2;
    ArrayList<String> aNameList;
    ArrayList<String> aNameList2;
    ArrayList<String> aIdList;
    ArrayList<String> aIdList2;
    ArrayList<String> isfinishedList;
    ArrayList<String> sIdList;
    ArrayList<String> sIdList2;



}
