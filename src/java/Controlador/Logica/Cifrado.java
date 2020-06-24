package Controlador.Logica;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Dann
 */
public class Cifrado{


  public Cifrado() {    
  }
  
  public String hashFunction(String pass){
    String resumen = "";
    byte[] msgBytes = pass.getBytes();

    MessageDigest resHash;
    try {
      resHash = MessageDigest.getInstance("MD5");
      byte[] bytesDelResumen = resHash.digest(msgBytes);

      BigInteger resumenNumero = new BigInteger(1, bytesDelResumen);
      resumen = resumenNumero.toString(16);							
    } catch (NoSuchAlgorithmException e) {
      System.out.println(e.getMessage());
    }
    
    return resumen;    
  }
}