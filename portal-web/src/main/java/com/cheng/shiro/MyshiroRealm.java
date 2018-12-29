package com.cheng.shiro;

import com.cheng.exception.CustomException;
import com.cheng.login.domain.User;
import com.cheng.login.service.IUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2018/12/20 15:42
 */
public class MyshiroRealm extends AuthenticatingRealm {
    private static final Logger logger = LoggerFactory.getLogger(MyshiroRealm.class);

    @Autowired
    private IUserService userService;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken userToken =(UsernamePasswordToken)token;
        String username = userToken.getUsername();
        User user = null;
        try {
            user = userService.selectUserByName(username);
            logger.info("查询用户信息-----username="+username);
        } catch (CustomException e) {
            logger.error("查询用户信息发生异常----"+e.getMessage());
            throw new CustomException("3","查询用户信息发生异常");
        }
        if (user==null){
            throw new UnknownAccountException("账户"+username+"不存在！");
        }
        String password = user.getPassword();
        String realmName = getName();
        ByteSource credentialsSalt = ByteSource.Util.bytes(username);
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(username,password,credentialsSalt,realmName);
        return info;
    }

    public static void main(String[] args) {
        ByteSource byteSource = ByteSource.Util.bytes("201501450300");
        Object obj = new SimpleHash("MD5","123456",byteSource,1024);
        System.out.println(obj);
    }
}
