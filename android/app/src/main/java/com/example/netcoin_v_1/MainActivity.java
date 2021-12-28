package com.example.netcoin_v_1;

import static java.nio.charset.StandardCharsets.UTF_8;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

import android.content.Context;



import android.annotation.TargetApi;
import android.content.Context;

import android.os.Build;
import android.util.Base64;
import android.util.Log;


import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;

import java.nio.charset.StandardCharsets;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "samples.netcoin.dev/Encryption";



    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            // Note: this method is invoked on the main thread.
                            String massage = call.argument("massage");
                            String method = call.argument("method");
                            String keyString = call.argument("key");
                            assert method != null;
                            byte[] key;
                            if (method.equals("signUp")) {
                                assert keyString != null;
                                key = hexStringToBytes(new String(keyString.getBytes(StandardCharsets.UTF_8)));
                            } else {
                                try{

                                    assert keyString != null;
                                    byte[] key1=new byte[keyString.length()];
                                    for(int i=0;i<keyString.length();i++){
                                        key1[i]=(byte)(int)keyString.charAt(i);
                                        System.out.println(key1[i]);
                                    }

                                    key = key1;

                                }catch(Exception e){
                                    throw e;
                                }

                            }
                            String IV = call.argument("iv");
                            if (call.method.equals("Encrypt")) {
                                try {
                                    if(massage != null){
                                        String response = Encrypt(
                                                massage,
                                                key,
                                                hexStringToBytes(new String(IV.getBytes(StandardCharsets.UTF_8))));
                                        result.success(response);
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                    result.error("UNAVAILABLE", e.getMessage(), e.getStackTrace());
                                }
                            }else if(call.method.equals("Decrypt")){
                                String response = null;
                                try {
                                    assert IV != null;
                                    response = Decrypt( massage ,
                                            key,
                                            hexStringToBytes(new String(IV.getBytes(StandardCharsets.UTF_8))));
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                                result.success(response);
                            }else {
                                result.notImplemented();
                            }
                        }
                );
    }
    @TargetApi(Build.VERSION_CODES.KITKAT)
    public  String Encrypt(String message, byte[] key,byte[] IV)
            throws Exception {

        Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        DESKeySpec desKeySpec = new DESKeySpec(key);
        SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
        IvParameterSpec iv = new IvParameterSpec(IV);
        cipher.init(Cipher.ENCRYPT_MODE, secretKey, iv);
        byte[] encryptbyte = cipher.doFinal(message.getBytes(StandardCharsets.UTF_8));
        String enc = new String(Base64.encode(encryptbyte, Base64.DEFAULT));
        return enc;
    }
    @TargetApi(Build.VERSION_CODES.KITKAT)
    public static String Decrypt(String message, byte[] key,byte[] IV)
            throws Exception {
              byte[] bytesrc = Base64.decode(message.getBytes(), Base64.DEFAULT);
        Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
        DESKeySpec desKeySpec = new DESKeySpec(key);
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
        SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
        IvParameterSpec iv = new IvParameterSpec(IV);
        cipher.init(Cipher.DECRYPT_MODE, secretKey, iv);
        byte[] retByte = cipher.doFinal(bytesrc);
        return new String(retByte);
    }

    @RequiresApi(api = Build.VERSION_CODES.KITKAT)
    public  static  byte[] hexStringToBytes(String src){
        byte[] ret =new  byte[8];
        byte[] tmp=src.getBytes(StandardCharsets.UTF_8);
        for (int i=0;i<8;i++){
            ret[i]=uniteBytes(tmp[i*2],tmp[i*2+1]);
        }
        return  ret;
    }
    public  static  byte uniteBytes(byte src0,byte src1){
        byte _b0= Byte.decode("0x" + new String(new byte[]{src0}));
        _b0=(byte) (_b0<<4);
        byte _b1= Byte.decode("0x" + new String(new byte[]{src1}));
        return (byte) (_b0^_b1);
    }

}
