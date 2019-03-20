package com.cheng.shiro;

import com.cheng.common.LoginTypeEnum;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2019/3/19 15:37
 */
public class RetryLimitHashedCredentialsMatcher extends HashedCredentialsMatcher{
    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        EasyTypeToken tk = (EasyTypeToken)token;
        //如果是免密登录，直接返回true
        if (tk.getLoginType().equals(LoginTypeEnum.NOPASSWD)){
            return true;
        }
        //不是免密登录，调用父类的方法
        return super.doCredentialsMatch(tk, info);
    }
}
