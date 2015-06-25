package com.example.danny.myapptest;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;


public class LoginMain extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.loginmain);
        InicialComponent();
        new AsyncTaskq().execute();
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

            String id = txtId.getText().toString();
            String pwd = txtPwd.getText().toString();

            isAccessSuceed(id,pwd);

        }
    };


    private void InicialComponent() {

        btnSubmit = (Button) findViewById(R.id.btnSubmit);
        txtId = (EditText) findViewById(R.id.txtId);
        txtPwd = (EditText) findViewById(R.id.txtPassword);
        lblResult = (TextView) findViewById(R.id.lblResult);
        idList = new ArrayList<String>();
        pwdList = new ArrayList<String>();
        btnSubmit.setOnClickListener(btnSubmit_click);
        result = "";

    }

    public class AsyncTaskq extends AsyncTask<String, String, String> {

        final String TAG = "AsyncTaskParseJson.java";

        // set your json string url here
        String yourJsonStringUrl = "http://rsisp-assess.azurewebsites.net/test2.aspx";

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
                dataJsonArr = jParser.getJSONFromUrl(yourJsonStringUrl);//json.getJSONArray("Users");

                // loop through all users
                for (int i = 0; i < dataJsonArr.length(); i++) {

                    JSONObject c = dataJsonArr.getJSONObject(i);

                    // Storing each json item in variable
                    String account = c.getString("account");
                    String password = c.getString("password");
                    idList.add(account);
                    pwdList.add(password);

                }

            } catch (JSONException e) {
                e.printStackTrace();
            }

            return null;
        }

        @Override
        protected void onPostExecute(String strFromDoInBg) {}
    }

    public void isAccessSuceed(String id,String pwd)
    {
        for(int i=0;i<idList.size();i++){
            if((idList.get(i).equals(id))&&(pwdList.get(i).equals(pwd))){
                Intent intent = new Intent(LoginMain.this,ActMain.class);

                startActivity(intent);
                break;
            }
            else {
                result = "帳號密碼錯誤!!登入失敗";
                lblResult.setText(result);
            }

        }
    }

    Button btnSubmit;
    EditText txtId,txtPwd;
    ArrayList<String> idList;
    ArrayList<String> pwdList;
    TextView lblResult;
    String result;


}
