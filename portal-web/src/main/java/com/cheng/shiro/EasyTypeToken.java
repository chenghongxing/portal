package com.cheng.shiro;

import com.cheng.common.LoginTypeEnum;
import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2019/3/19 15:16
 */
public class EasyTypeToken extends UsernamePasswordToken {
    private LoginTypeEnum loginType;

    public EasyTypeToken(){
        super();
    }

    public EasyTypeToken(String username, String password, LoginTypeEnum type, boolean rememberMe,String host) {
        super(username, password, rememberMe, host);
        this.loginType = type;
    }

    /**
     * 免密登录
     */
    public EasyTypeToken(String username,boolean rememberMe){
        super(username,"",rememberMe,null);
        this.loginType=LoginTypeEnum.NOPASSWD;
    }

    /**
     * 账号密码登录
     */
    public EasyTypeToken(String username,String password,boolean rememberMe){
        super(username,password,rememberMe,null);
        this.loginType=LoginTypeEnum.PASSWORD;
    }

    public LoginTypeEnum getLoginType() {
        return loginType;
    }

    public void setLoginType(LoginTypeEnum loginType) {
        this.loginType = loginType;
    }
}
