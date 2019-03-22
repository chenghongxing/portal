package com.cheng.shiro;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2019/3/22 16:02
 */
public class ShiroPwdUtil {

    public static String getPassByMd5(String pass,String salt){
        ByteSource byteSource = ByteSource.Util.bytes(salt);
        SimpleHash newPwd = new SimpleHash("MD5",pass,byteSource,1024);
        return newPwd.toString();
    }
}
