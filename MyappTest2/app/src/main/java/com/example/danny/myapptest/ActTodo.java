package com.example.danny.myapptest;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Calendar;



public class ActTodo extends Activity {


    ArrayList<String> list;// = new ArrayList<String>();
    String listSize = "0";
            //getString(list.size());
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.acttodo);
        InitialComponent();


        Notification message =new Notification(
                android.R.drawable.stat_sys_download,
                "您有3封簡訊未讀取",
                System.currentTimeMillis());

        PendingIntent pend  = PendingIntent.getActivity(
                ActTodo.this,
                0,
                new Intent(ActTodo.this,ActMain.class),
                PendingIntent.FLAG_UPDATE_CURRENT);

        message.setLatestEventInfo(
                ActTodo.this,
                "下載來自帥哥",
                "您有高雄周愚民的照片下載中",
                pend);

        NotificationManager manager=(NotificationManager)getSystemService(NOTIFICATION_SERVICE);
        manager.notify(0, message);


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
            new AlertDialog.Builder(ActTodo.this)
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


View.OnClickListener btnAdd_click =new View.OnClickListener(){
    public void onClick(View arg0) {
        if(txtTodo.length()==0){
                  Toast.makeText(ActTodo.this,"您尚未輸入待辨事項",Toast.LENGTH_SHORT).show();
        }else {
            SharedPreferences table = getSharedPreferences("T", 0);
            int index = table.getInt("COUNT", 0);
            index++;
            table.edit().putInt("COUNT", index).commit();

            String ketT = "T" + String.valueOf(index);
            String ketD = "D" + String.valueOf(index);
            table.edit().putString(ketT, txtTodo.getText().toString()).commit();
            table.edit().putString(ketD, txtDatePicker.getText().toString()).commit();

            Toast.makeText(ActTodo.this, "新增資料成功", Toast.LENGTH_SHORT).show();

            txtDatePicker.setText("");
            txtTodo.setText("");
            initTextType();
        }
    }
};


View.OnClickListener btnList_click=new View.OnClickListener(){
    public void onClick(View arg0) {

        final SharedPreferences table = getSharedPreferences("T", 0);
        final int index = table.getInt("COUNT", 0);

        if(index==0){
            Toast.makeText(ActTodo.this,"沒有工作",Toast.LENGTH_SHORT).show();
            return;
        }

        ////////////////原本ArrayList位置
        list = new ArrayList<String>();
        for(int i=1;i<=index;i++){
            String ketT="T"+String.valueOf(i);
            String ketD="D"+String.valueOf(i);

            if(table.contains(ketT)){

                list.add(
                        table.getString(ketT, "No Data")+"\r\n"+
                                table.getString(ketD, "No Data"));


            }
        }
        if(list.size()==0){
            Toast.makeText(ActTodo.this,"沒有工作",Toast.LENGTH_SHORT).show();
            return;
        }

        final AlertDialog.Builder build=new AlertDialog.Builder(ActTodo.this);
        build.setTitle("未完成工作列表");
        build.setPositiveButton("返回",null);
        build.setItems(list.toArray(new String[list.size()]), new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {
                AlertDialog.Builder askDelete = new AlertDialog.Builder(ActTodo.this)
                        .setTitle("確定要刪除？")
                        .setMessage(list.get(which))
                        .setPositiveButton("確定", new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                // list.remove(which);
                                Toast.makeText(ActTodo.this, "你刪除了一筆備忘", Toast.LENGTH_SHORT).show();
                                //重新排列table ListArray
                               resetList();

                                    //////////
                                    // list.remove(2);
//                                ArrayList<String> temList = new ArrayList<String>();
//                                temList = list;
//                                temList.remove(2);


                                }
                            }

                            )


                            .setNegativeButton("取消", new DialogInterface.OnClickListener() {
                                        @Override
                                        public void onClick(DialogInterface dialog, int which) {
                                            build.create().show();
                                        }
                                    }

                            );
                            askDelete.create().

                            show();


//                Toast.makeText(ActTodo.this,list.get(which),Toast.LENGTH_SHORT).show();

//                String message="";
//                for(int i=0;i<list.size();i++){
//
//
//                }
//                message = list.get(which);


                        }
            }

            )


                    .

            create()

            .

            show();


        }
    };

DatePickerDialog.OnDateSetListener btnDateSetting_click=new DatePickerDialog.OnDateSetListener(){

    @Override
    public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {

        txtDatePicker.setText(""+
                String.valueOf(year)+"-"+
                String.valueOf(monthOfYear+1)+"-"+
                String.valueOf(dayOfMonth) );
                //選擇完日期
                txtDatePicker.setTextColor(Color.BLACK);
                txtDatePicker.setTypeface(Typeface.DEFAULT);
                txtDatePicker.setTextSize(30);
    }
};


View.OnClickListener txtDatePicker_click =new View.OnClickListener(){
    public void onClick(View arg0) {


        Calendar today=Calendar.getInstance();

        Dialog dialog=new DatePickerDialog(
                ActTodo.this,
                btnDateSetting_click,
                today.get(Calendar.YEAR),
                today.get(Calendar.MONTH),
                today.get(Calendar.DATE)


        );

        dialog.show();

    }
};
    
    private void initTextType(){
        //預設當天
        Calendar today=Calendar.getInstance();
        int year = today.get(Calendar.YEAR);
        int monthOfYear = today.get(Calendar.MONTH);
        int dayOfMonth = today.get(Calendar.DATE);
        txtDatePicker.setText(""+
                String.valueOf(year)+"-"+
                String.valueOf(monthOfYear+1)+"-"+
                String.valueOf(dayOfMonth) );
        //載入時字體顏色樣式
        txtDatePicker.setTextColor(Color.GRAY);
        txtDatePicker.setTypeface(Typeface.defaultFromStyle(3),Typeface.ITALIC);
        txtDatePicker.setTextSize(18);
    }


    private void resetList(){

        SharedPreferences tempTable = getSharedPreferences("T", 0);
         int index = tempTable.getInt("COUNT", 0);

        if(index==0){
            Toast.makeText(ActTodo.this,"沒有工作",Toast.LENGTH_SHORT).show();
            return;
        }
        ArrayList<String> temList = new ArrayList<String>();
        for (int i = 1; i <= index; i++) {
            String ketT = "T" + String.valueOf(i);
            String ketD = "D" + String.valueOf(i);

            if (tempTable.contains(ketT)) {

                temList.add(
                        tempTable.getString(ketT, "No Data") + "\r\n" +
                                tempTable.getString(ketD, "No Data"));


            }
        }


    }


    private void InitialComponent(){
        btnAdd = (Button)findViewById(R.id.btnAdd);
        btnAdd.setOnClickListener(btnAdd_click);
        btnList = (Button)findViewById(R.id.btnList);
        btnList.setOnClickListener(btnList_click);

        txtDatePicker = (EditText)findViewById(R.id.txtDatePicker);
        txtDatePicker.setOnClickListener(txtDatePicker_click);


        txtTodo = (EditText)findViewById(R.id.txtTodo);
        initTextType();
       



    }
    Button btnAdd;
    Button btnList;


    EditText txtTodo;
    EditText txtDatePicker;
}


