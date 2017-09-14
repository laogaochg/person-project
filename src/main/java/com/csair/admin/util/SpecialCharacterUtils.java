package com.csair.admin.util;
/**
 * 特殊字符过滤工具类
 * Created by 【xinyu】 on 2017/7/11
 */
public class SpecialCharacterUtils {
	  //    &lt;  < 小于号或显示标记
//  &gt;  > 大于号或显示标记
//  &amp;  & 可用于显示其它特殊字符
//  &quot; "  引号
//  &reg; ®  已注册
//  &copy; © 版权
//  &trade; ™ 商标
//  &ensp;   半个空白位
//  &emsp;   一个空白位
//  &nbsp; 不断行的空白
  private static String[] htmlSpecialCharacter = new String[]{"&lt;", "&gt;", "&amp;", "&reg;", "&copy;", "&trade;", "&ensp;", "&emsp;", "&nbsp;"};
  private static String[] commonSpecialCharacter = new String[]{"<", ">", "&", "\"", "'", " ", "!", "@", "#", "\\$", "%", "\\*", "\\^", "\\(", "\\)", "_", "\\+", "\\=", "\\-", ",", "\\.", "，", "。", "\\?", "`", "~"};

  /**
   * 过滤html特殊字符
   *
   * @param specialCharacterStr
   * @return
   */
  public static String htmlSpecialCharacterRemover(String specialCharacterStr) {
      int length = htmlSpecialCharacter.length;
      for (int i = 0; i < length; i++) {
          specialCharacterStr = specialCharacterStr.replace(htmlSpecialCharacter[i], "");
      }
      return specialCharacterStr;
  }

  /**
   * 过滤普通的特殊字符
   *
   * @param specialCharacterStr
   * @return
   */
  public static String commonsSpecialCharacterRemover(String specialCharacterStr) {
      int length = commonSpecialCharacter.length;
      for (int i = 0; i < length; i++) {
          specialCharacterStr = specialCharacterStr.replace(commonSpecialCharacter[i], "");
      }
      return specialCharacterStr;
  }
  public static String encode(String input) {
      if (input == null) {
          return input;
      }
      StringBuilder sb = new StringBuilder(input.length());
      for (int i = 0, c = input.length(); i < c; i++) {
          char ch = input.charAt(i);
          switch (ch) {
              case '&': sb.append("&amp;");
                  break;
              case '<': sb.append("&lt;");
                  break;
              case '>': sb.append("&gt;");
                  break;
              case '"': sb.append("&quot;");
                  break;
              case '\'': sb.append("&#x27;");
                  break;
              case '/': sb.append("&#x2F;");
                  break;
              default: sb.append(ch);
          }
      }
      return sb.toString();
  }

  //js端过滤
  public static String encodeForJS(String input) {
      if (input == null) {
          return input;
      }

      StringBuilder sb = new StringBuilder(input.length());

      for (int i = 0, c = input.length(); i < c; i++) {
          char ch = input.charAt(i);

          // do not encode alphanumeric characters and ',' '.' '_'
          if (ch >= 'a' && ch <= 'z' || ch >= 'A' && ch <= 'Z' ||
                  ch >= '0' && ch <= '9' ||
                  ch == ',' || ch == '.' || ch == '_') {
              sb.append(ch);
          } else {
              String temp = Integer.toHexString(ch);

              // encode up to 256 with \\xHH
              if (ch < 256) {
                  sb.append('\\').append('x');
                  if (temp.length() == 1) {
                      sb.append('0');
                  }
                  sb.append(temp.toLowerCase());

              // otherwise encode with \\uHHHH
              } else {
                  sb.append('\\').append('u');
                  for (int j = 0, d = 4 - temp.length(); j < d; j ++) {
                      sb.append('0');
                  }
                  sb.append(temp.toUpperCase());
              }
          }
      }

      return sb.toString();
  }

  /**
   * css非法字符过滤
   * http://www.w3.org/TR/CSS21/syndata.html#escaped-characters
  */
  public static String encodeForCSS(String input) {
      if (input == null) {
          return input;
      }

      StringBuilder sb = new StringBuilder(input.length());

      for (int i = 0, c = input.length(); i < c; i++) {
          char ch = input.charAt(i);

          // check for alphanumeric characters
          if (ch >= 'a' && ch <= 'z' || ch >= 'A' && ch <= 'Z' ||
                  ch >= '0' && ch <= '9') {
              sb.append(ch);
          } else {
              // return the hex and end in whitespace to terminate
              sb.append('\\').append(Integer.toHexString(ch)).append(' ');
          }
      }
      return sb.toString();
  }
  
  /**
   * 所有特殊字符替换
   *
   * @param specialCharacterStr
   * @return
   */
  public static String specialCharacterRemover(String specialCharacterStr) {
      specialCharacterStr = htmlSpecialCharacterRemover(specialCharacterStr);
      specialCharacterStr = commonsSpecialCharacterRemover(specialCharacterStr);
      //specialCharacterStr = encodeForJS(specialCharacterStr);
      //specialCharacterStr = encodeForCSS(specialCharacterStr);
      return specialCharacterStr;
  }
}
