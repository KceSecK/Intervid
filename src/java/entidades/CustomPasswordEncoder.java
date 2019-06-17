/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidades;


import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.StringUtils;

/**
 *
 * @author SaitaM
 */
public class CustomPasswordEncoder  implements PasswordEncoder {
    private static String salt ="interpass" ;
    private static String value ="sad" ;
    
    public static String encrypt(String value) {
        System.out.println("WAAAAAAAAA"+value);
    if(value == null){
        
        return value;
    }
    // SALT is your secret key
    Key key = new SecretKeySpec(salt.getBytes(), "AES");
    try {

        Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, key);
        return Base64.encodeBase64String(cipher.doFinal(value.getBytes()));
    } catch (Exception exception) {
        throw new RuntimeException(exception);
    }
}
    
    public String encode(CharSequence rawPassword) {
    return encrypt(rawPassword.toString());
}
   public boolean matches(CharSequence rawPassword, String encodedPassword) {
    if (!StringUtils.isEmpty(rawPassword) && encode(rawPassword).equals(encodedPassword)) {
        return true;
    }
    return false;
} 
}
 