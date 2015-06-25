package com.example.danny.myapptest;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.Button;
import android.widget.TableLayout;
import android.widget.TableRow;
import android.widget.TextView;

import java.util.ArrayList;


public class ActAssess extends Activity {


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.actassess);
        InicialComponent();

        Bundle bundle0311 =this.getIntent().getExtras();
        sId = bundle0311.getStringArrayList("sId");
        aId = bundle0311.getStringArrayList("aId");
        aName = bundle0311.getStringArrayList("aName");
        pId = bundle0311.getStringArrayList("pId");
        getView();
    }

    public void getView()
    {
        TableLayout assessList = (TableLayout)findViewById(R.id.assess_list);
        assessList.setStretchAllColumns(true);
        TableLayout.LayoutParams row_layout = new TableLayout.LayoutParams(TableLayout.LayoutParams.WRAP_CONTENT, TableLayout.LayoutParams.WRAP_CONTENT);
        TableRow.LayoutParams view_layout = new TableRow.LayoutParams(TableRow.LayoutParams.WRAP_CONTENT, TableRow.LayoutParams.WRAP_CONTENT);

        try {
            TableRow tr1 = new TableRow(ActAssess.this);
            tr1.setLayoutParams(row_layout);
            tr1.setGravity(Gravity.CENTER_HORIZONTAL);

            TextView test = new TextView(ActAssess.this);
            test.setText("病患編號\t評估表名稱\t");
            test.setTextSize(16);
            test.setLayoutParams(view_layout);
            Button btn1 = new Button(ActAssess.this);
            btn1.setText("進入編輯");
            btn1.setBackgroundColor(Color.TRANSPARENT);
            btn1.setLayoutParams(view_layout);

            tr1.addView(test);
            tr1.addView(btn1);
            assessList.addView(tr1);
            for(int i = 0; i < pId.size(); i++) {
                TableRow tr = new TableRow(ActAssess.this);
                tr.setLayoutParams(row_layout);
                tr.setGravity(Gravity.CENTER_HORIZONTAL);

                String title="";
                String pString = pId.get(i);
                String aNameString = aName.get(i);
                title = pString+"\t"+aNameString;

                TextView user_acc = new TextView(ActAssess.this);
                user_acc.setText(title);
                user_acc.setLayoutParams(view_layout);

                Button btn = new Button(ActAssess.this);
                btn.setText(aNameString);
                btn.setLayoutParams(view_layout);
                btn.setOnClickListener(btn1_click);

                tr.addView(user_acc);
                tr.addView(btn);
                assessList.addView(tr);
            }
        } catch(Exception e) {
            // Log.e("log_tag", e.toString());
        }

    }

    View.OnClickListener btn1_click = new View.OnClickListener() {
        public void onClick(View arg0) {

            ArrayList<Integer> indexList = new ArrayList<Integer>();
            String btnText = ((Button) arg0).getText().toString();
            for(int i=0;i<aName.size();i++){
                if((aName.get(i).contains(btnText))){
                    indexList.add(i);
                }
            }
            String qstring_p = pId.get(indexList.get(0));
            String qstring_a = aId.get(indexList.get(0));
            String qstring_s = sId.get(indexList.get(0));
            String url = "http://assessjson.azurewebsites.net/assessment.aspx?pid="+qstring_p+
                    "&aid="+qstring_a+"&sid="+qstring_s;

            Uri uri = Uri.parse(url);
            Intent intentWeb = new Intent(Intent.ACTION_VIEW,uri);
            startActivity(intentWeb);

        }
    };

    private void InicialComponent() {

        lblTitle = (TextView) findViewById(R.id.lblTitle);
        sId = new ArrayList<String>();
        aId = new ArrayList<String>();
        pId = new ArrayList<String>();
        aName = new ArrayList<String>();
    }

    TextView lblTitle;
    ArrayList<String> sId;
    ArrayList<String> aId;
    ArrayList<String> pId;
    ArrayList<String> aName;

}
