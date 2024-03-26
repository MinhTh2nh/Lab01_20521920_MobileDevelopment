package com.example.ex2_lab1;

//Exercise 1
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.content.Intent;
import android.net.Uri;
import androidx.core.app.ActivityCompat;
import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import android.app.AlertDialog;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
//Exercise 1
//public class MainActivity extends AppCompatActivity {
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        EdgeToEdge.enable(this);
//        setContentView(R.layout.activity_main);
//        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
//            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
//            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
//            return insets;
//        });
//    }
//}
//Exercise 2
//public class MainActivity extends AppCompatActivity {
//
//    private Button callButton;
//    private EditText phoneNumberEditText;
//    private static final int REQUEST_CALL_PHONE = 1;
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);
//
//        // Initialize views
//        callButton = findViewById(R.id.callButton);
//        phoneNumberEditText = findViewById(R.id.phoneNumber);
//
//        // Set click listener for callButton
//        callButton.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                String number = phoneNumberEditText.getText().toString();
//                makePhoneCall(number);
//            }
//        });
//    }
//
//    private void makePhoneCall(String number) {
//        if (ActivityCompat.checkSelfPermission(MainActivity.this, Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED) {
//            ActivityCompat.requestPermissions(MainActivity.this, new String[]{Manifest.permission.CALL_PHONE}, REQUEST_CALL_PHONE);
//        } else {
//            String dial = "tel:" + number;
//            startActivity(new Intent(Intent.ACTION_CALL, Uri.parse(dial)));
//        }
//    }
//
//    @Override
//    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
//        if (requestCode == REQUEST_CALL_PHONE) {
//            if (grantResults.length > 0 && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
//                String number = phoneNumberEditText.getText().toString();
//                makePhoneCall(number);
//            }
//        }
//    }
//}

//Exercise 3
//public class MainActivity extends AppCompatActivity {
//    Calendar calendar;
//    SimpleDateFormat simpleDateFormat;
//    TextView GetDateAndTime;
//    Button BtnGetDateAndTime;
//    AlertDialog.Builder ad;
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);
//
//        GetDateAndTime = findViewById(R.id.getDateAndTime);
//        BtnGetDateAndTime = findViewById(R.id.btnGetDateAndTime);
//        calendar = Calendar.getInstance();
//        simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss", Locale.getDefault());
//        String currentDate = simpleDateFormat.format(calendar.getTime());
//
//        BtnGetDateAndTime.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                Date currentTime = new Date();
//                String message = "Thời gian hiện tại: " + simpleDateFormat.format(currentTime);
//                // Create an AlertDialog.Builder instance
//                ad = new AlertDialog.Builder(MainActivity.this);
//                // Set the message for the dialog
//                ad.setMessage(message);
//                // Display the dialog
//                ad.show();
//            }
//        });
//    }
//}

//Exercise 4
//public class MainActivity extends AppCompatActivity {
//    Button BtnGetContent;
//    EditText edit_text; // Assuming you have an EditText with the id 'edit_text'
//    AlertDialog.Builder alert_dialog; // Assuming you want to initialize an AlertDialog.Builder
//
//    @Override
//    protected void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        setContentView(R.layout.activity_main);
//        edit_text = findViewById(R.id.edit_text); // Finding EditText by its ID
//        BtnGetContent = findViewById(R.id.btn_get_content); // Finding Button by its ID
//        alert_dialog = new AlertDialog.Builder(this);
//
//        edit_text.setOnKeyListener(new View.OnKeyListener(){
//            @Override
//            public boolean onKey(View v, int keyCode, KeyEvent event) {
//                if(event.getAction() == KeyEvent.ACTION_DOWN && keyCode == KeyEvent.KEYCODE_DPAD_CENTER){
//                    String message = edit_text.getText().toString();
//                    alert_dialog.setMessage(message);
//                    alert_dialog.show();
//                    return true;
//                }
//                return false;
//            }
//
//        });
//        BtnGetContent.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View v) {
//                String message = edit_text.getText().toString();
//                alert_dialog.setMessage(message);
//                alert_dialog.show();
//            }
//        });
//    }
//}

//Exercise 5
public class MainActivity extends AppCompatActivity {
    View.OnClickListener buttonListener;
    EditText tvresult;
    Button bt0 , bt1, bt2, bt3, bt4, bt5, bt6, bt7, bt8, bt9, btplus , btsub, btmult, btdivi, btresult, btreset;
    Integer lastValue = 0, currentValue;
    String operation;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        tvresult = findViewById(R.id.tv_result);
        bt0 = findViewById(R.id.button0);
        bt1 = findViewById(R.id.button1);
        bt2 = findViewById(R.id.button2);
        bt3 = findViewById(R.id.button3);
        bt4 = findViewById(R.id.button4);
        bt5 = findViewById(R.id.button5);
        bt6 = findViewById(R.id.button6);
        bt7 = findViewById(R.id.button7);
        bt8 = findViewById(R.id.button8);
        bt9 = findViewById(R.id.button9);
        btplus = findViewById(R.id.btplus);
        btsub = findViewById(R.id.btsub);
        btmult = findViewById(R.id.btmulti);
        btdivi = findViewById(R.id.btdivi);
        btresult = findViewById(R.id.btresult);
        btreset = findViewById(R.id.btreset);

        buttonListener = new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Button bt = (Button) v;
                String buttonText = bt.getText().toString();
                if (!buttonText.equals("+") && !buttonText.equals("-") && !buttonText.equals("*") && !buttonText.equals("/")) {
                    // If the button clicked is a number, append it to the EditText
                    setValue(tvresult, buttonText);
                } else {
                    // If the button clicked is an operation, perform the calculation
                    operation = buttonText;
                    currentValue = Integer.parseInt(tvresult.getText().toString());
                    if (lastValue != null) {
                        lastValue = process(lastValue, currentValue);
                    } else {
                        lastValue = currentValue;
                    }
                    resetValue();
                }
            }
        };


        // Set the OnClickListener for buttons
        bt1.setOnClickListener(buttonListener);
        bt2.setOnClickListener(buttonListener);
        bt3.setOnClickListener(buttonListener);
        bt4.setOnClickListener(buttonListener);
        bt5.setOnClickListener(buttonListener);
        bt6.setOnClickListener(buttonListener);
        bt7.setOnClickListener(buttonListener);
        bt8.setOnClickListener(buttonListener);
        bt9.setOnClickListener(buttonListener);

        btplus.setOnClickListener(buttonListener);
        btsub.setOnClickListener(buttonListener);
        btmult.setOnClickListener(buttonListener);
        btdivi.setOnClickListener(buttonListener);


        btreset.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                resetValue();
            }
        });

        btresult.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                currentValue = Integer.parseInt(tvresult.getText().toString());
                process(lastValue, currentValue);
            }
        });
    }

    public void setValue(EditText a, String b) {
        String last = a.getText().toString();
        if (!last.equals("0")) {
            last += b;
            b = last;
        }
        a.setText(b);
    }

    public void resetValue() {
        tvresult.setText("0");
    }

    public Integer process(Integer a, Integer b) {
        Integer preresult = 0;
        if (operation.equals("+")) {
            preresult = a + b;
            tvresult.setText(preresult.toString());
        }
        if (operation.equals("-")) {
            preresult = a - b;
            tvresult.setText(preresult.toString());
        }
        if (operation.equals("*")) {
            preresult = a * b;
            tvresult.setText(preresult.toString());
        }
        if (operation.equals("/")) {
            preresult = a / b;
            tvresult.setText(preresult.toString());
        }
        return preresult;
    }
}