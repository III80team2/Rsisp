package com.example.danny.myapptest;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
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



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.acttodo);
        InitialComponent();

        //setTitle("*****歡迎進入本系統*****");


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

        SharedPreferences table = getSharedPreferences("T", 0);
        int index = table.getInt("COUNT", 0);
        index++;
        table.edit().putInt("COUNT",index).commit();

        String ketT="T"+String.valueOf(index);
        String ketD="D"+String.valueOf(index);
        table.edit().putString(ketT,txtTodo.getText().toString()).commit();
        table.edit().putString(ketD,txtDatePicker.getText().toString()).commit();

        Toast.makeText(ActTodo.this,"新增資料成功",Toast.LENGTH_SHORT).show();

        txtDatePicker.setText("");
        txtTodo.setText("");

    }
};





View.OnClickListener btnList_click=new View.OnClickListener(){
    public void onClick(View arg0) {

        SharedPreferences table = getSharedPreferences("T", 0);
        int index = table.getInt("COUNT", 0);

        if(index==0){
            Toast.makeText(ActTodo.this,"沒有工作",Toast.LENGTH_SHORT).show();
            return;
        }

        ArrayList<String> list = new ArrayList<String>();
        for(int i=1;i<=index;i++){
            String ketT="T"+String.valueOf(i);
            String ketD="D"+String.valueOf(i);

            if(table.contains(ketT)){

                list.add(
                        table.getString(ketT, "No Data")+"\r\n"+
                                table.getString(ketD, "No Data"));
//                list.remove(table.getString(ketT, "No Data")+"\r\n"+
//                        table.getString(ketD, "No Data"));

            }
        }
        if(list.size()==0){
            Toast.makeText(ActTodo.this,"沒有工作",Toast.LENGTH_SHORT).show();
            return;
        }

        AlertDialog.Builder build=new AlertDialog.Builder(ActTodo.this);
        build.setTitle("未完成工作列表");
        build.setItems(list.toArray(new String[list.size()]),null).create().show();

    }
};

DatePickerDialog.OnDateSetListener btnDateSetting_click=new DatePickerDialog.OnDateSetListener(){

    @Override
    public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {

        txtDatePicker.setText(""+
                String.valueOf(year)+"-"+
                String.valueOf(monthOfYear+1)+"-"+
                String.valueOf(dayOfMonth) );
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


    private void InitialComponent(){
        btnAdd = (Button)findViewById(R.id.btnAdd);
        btnAdd.setOnClickListener(btnAdd_click);
        btnList = (Button)findViewById(R.id.btnList);
        btnList.setOnClickListener(btnList_click);

        txtDatePicker = (EditText)findViewById(R.id.txtDatePicker);
        txtDatePicker.setOnClickListener(txtDatePicker_click);


        txtTodo = (EditText)findViewById(R.id.txtTodo);


    }
    Button btnAdd;
    Button btnList;


    EditText txtTodo;
    EditText txtDatePicker;
}


