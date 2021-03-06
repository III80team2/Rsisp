package com.example.danny.myapptest;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.app.Dialog;
import android.content.DialogInterface;
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


    ArrayList<String> list;
    Integer deleteNo;
    boolean delete = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.acttodo);
        InitialComponent();
        initTextType();


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
         if(txtTodo.length()==0)
             Toast.makeText(ActTodo.this,"請輸入未辨事項",Toast.LENGTH_SHORT).show();
        else {
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

         SharedPreferences table = getSharedPreferences("T", 0);
        int index = table.getInt("COUNT", 0);


        if(index==0){
            Toast.makeText(ActTodo.this,"沒有工作",Toast.LENGTH_SHORT).show();
            return;
        }

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
        build.setNegativeButton("返回",null);
        build.setItems(list.toArray(new String[list.size()]),new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int which) {  //從0開始
                //抓到是which的值
               // Toast.makeText(ActTodo.this,Integer.toString(which),Toast.LENGTH_SHORT).show();

                deleteNo = which;

                AlertDialog.Builder askDelete = new AlertDialog.Builder(ActTodo.this)
                        .setTitle("確定要刪除？")
                        .setMessage(list.get(which))
                        .setPositiveButton("確定",new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {

                                SharedPreferences table = getSharedPreferences("T", 0);

                                int inttempPut = deleteNo+1;
                                String ketT="T"+String.valueOf(deleteNo+1);
                                String ketD="D"+String.valueOf(deleteNo+1);
                                String tempketTValue;
                                String tempketDValue;
                                int tempDelete = deleteNo+2;
                                table.edit().remove(ketT).commit();
                                //Toast.makeText(ActTodo.this,"已刪除一筆資料",Toast.LENGTH_SHORT).show();
                                //Toast.makeText(ActTodo.this,table.getString("T"+String.valueOf(tempDelete),"沒"),Toast.LENGTH_SHORT).show();
                                 for(int j = deleteNo+1;j<=list.size();j++) {
                                    if (table.contains("T" + String.valueOf(tempDelete))) {
                                        tempketTValue = table.getString("T" + String.valueOf(tempDelete), "no data");
                                        tempketDValue = table.getString("D" + String.valueOf(tempDelete), "no data");
                                        table.edit().putString("T"+String.valueOf(inttempPut), tempketTValue).commit();
                                        table.edit().putString("D"+String.valueOf(inttempPut), tempketDValue).commit();
                                        table.edit().remove("T"+String.valueOf(tempDelete)).commit();
                                        table.edit().remove("D"+String.valueOf(tempDelete)).commit();
                                         tempDelete++;
                                        inttempPut++;
                                        delete = true;
                                    }
                                }
                                if(delete){
                                    table.edit().putInt("COUNT",list.size()-1).commit();
                                    //Toast.makeText(ActTodo.this,String.valueOf(list.size()-1),Toast.LENGTH_SHORT).show();
                                    delete = false;
                                }



//                                for(int i =1;i<list.size();i++){
//                                    Toast.makeText(ActTodo.this,String.valueOf(deleteNo),Toast.LENGTH_SHORT).show();

//                                    String ketD="D"+String.valueOf(deleteNo+1);
//                                    String tempKetT;
//                                    String tempKetD;

//                                    if(table.contains("T"+String.valueOf(deleteNo+2))){
//                                        tempKetT="T"+table.getString("T"+String.valueOf(deleteNo+2),"No Data");
//                                        tempKetD="D"+table.getString("D"+String.valueOf(deleteNo+2),"No Data");
//                                        table.edit().remove("T"+String.valueOf(deleteNo+2)).commit();
//                                        table.edit().remove("D"+String.valueOf(deleteNo+2)).commit();
//                                        table.edit().putString(ketT,tempKetT).commit();
//                                        table.edit().putString(ketD,tempKetD).commit();
//                                    }

//                                    if(table.contains(ketT))
//                                     table.edit().remove(ketT).commit();

                             //   }
                                   // Toast.makeText(ActTodo.this,table.getString("T"+String.valueOf(deleteNo+1),"最後失敗了"),Toast.LENGTH_SHORT).show();
                                //現在可以刪但不可跳號


//                                   int index = deleteNo;
//
//                                for(int i=1;i<=list.size();i++){
//                                    index++;
//                                    String ketT="T"+String.valueOf(index);
//                                    String tempketT ="";
//
//                                    if(table.contains(ketT)) {
//                                    table.edit().remove(ketT).commit();
//                                     //下一個
//                                        index++;
//                                        if(table.contains(ketT)) {
//                                            tempketT = ketT;
//                                            table.edit().remove(ketT).commit();
//                                            return;
//                                            table.edit().putString("T" + String.valueOf(index - 1), "No data");
//                                        }
//                                        }else {
//                                            index--;
//                                        }



//                                    }
//                                }

                                   // tempKetT = ketT.indexOf(1,2);



                                   // Toast.makeText(ActTodo.this,String.valueOf(tempIndex-1),Toast.LENGTH_SHORT).show();
//                                    for(int j =index;j<list.size();j++)
//                                    tempIndex++;
//                                    tempKetT = "T"+String.valueOf(index);
//                                    table.edit().remove(ketT).commit();
//                                    ketT = tempKetT;
//
//                                    tempKetT = table.getString(ketT,"no data");
//
//                                    table.edit().putString(ketT,)


                              //table.edit().remove("T"+Integer.toString(2)).commit();//可刪
                       // Toast.makeText(ActTodo.this,(list.get(deleteNo)).toString(),Toast.LENGTH_SHORT).show();


                        //table.edit().clear().commit();
//                                int index = table.getInt("COUNT", 0);
//                                for(int i=1;i<=index;i++) {
//                                    String ketT="T"+String.valueOf(i);
//                                    if(i == which) {
//                                        editor.remove("KeT").commit();
//                                        // list.remove(table.getString(ketT, "No Data"));
//                                    }
//                                }

                                //Toast.makeText(ActTodo.this, "你刪除了一筆備忘", Toast.LENGTH_SHORT).show();

                            }
                        })
                        .setNegativeButton("取消",new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {

                                build.create().show();
                            }
                        });
                askDelete.create().show();
            }
        }).create().show();

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


