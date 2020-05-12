package com.ck.utils;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id ="2016102200738408";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCiQw4ha0mQJ5jjsOt0bsi/gkh9Edr7trvhSa/HFeYY6olvoeSWf3hZID+nNlbME4+nnCw4kKVJ03CtN17z1Rhw8zZQ5OUuPb1dHfYWzQrVmzwtq+r8v4R3Pf52w+l6sYG8nmBVade6BG3sVd0TEWkysIWy/MZ5xwScpsT+T9B7OPgVVtWCEaor7nxwI6xwkuRsfGHdpPNWwdJeeLuHwGNx0s8kar0RmG4nq/vb6gozusyevKVJTgewdEm7OwNEd90klodhlmEX0PMIeYKyW3Og2pbV/0/GWRbUMelNQvDNc+1Sf+tEgDa50doBt1IIVKzs3X0sJiEzRJtr2fIvpvl7AgMBAAECggEAVDjb/8qxb0quWBj/zfqm5oiYWZrIAHl0Adb+jya1vV8XoUL15Iwbip9rir5wxRKuMQCmD2I8+Rnv1Wj1Nzj3q8ECA3Eb6CmRveCMWH9rTT57OPWQTkqWVlJuX3UHHnE+dwn51LvQhrQ/3jkfPAOAiBgJ/cKovpLnuOvzOlFxVFOCma9rrF0d3iCfOaaWxN7PxqoCOeDl6GiFx3dIFPx72+pygSpIq7MO6sQ1PjHvhLK5ejjiSWsIP0uevOGzZt0pZJeX8D323D/TzvfPcrlmVP2mDKJ8brSWfVA0Am/q4g05NXqn/IMDn4vYw6qzDMeTJSsovr3ZDUshugEDSheSQQKBgQDtgw31U7P/pWqgWntCNDlDniW09ugheIUNmqC7udVnN+L98qePJYUiKDUwpKJj6+yhx0baPxJU/PXZs+pzEWh+ypG599Hjm+yMYOHuUiN8rDPquO62+/yCtXZG4hujoyk43SRj/WM6LAHUUfIEMyOqPFYBTZbScLKBosqctS1BoQKBgQCu5HrKZ0yLJEOYdQJdrAbANui5+1OqXwcxLfo+jRw7+RvJT3e+VulaDqCVa2ihC57zOj00NWm4TDpaUiGjg3ekW2k+RN65S9QGVd3OSgqq2IkO/5kPFa+KNaLEbBJ7qppzxxg5GZ7krapFbrkZfQBOGTdb4thO2WrNN+onrTEdmwKBgEZ5Wozutzwl4wuNjYFJaaxsopedo6c60ZAFz6ekLnQgGxRrCdjpsyU9dPrn/t9TQ7WFIbrkeBYLsQ9V2T0nbzAf/zmFFRxKSdglbyR97tWxav48vWhCQNyv51aFBNp7MWIUDBY3O1gpcqmDXyJr4itDF+nvEc+DbRQWL7Rr9e/BAoGAT/DXv5SgBCm7TACP6EktfMaccgZTI9jz7KLbc6QEd9VRwh602SfY2fU9qY7C8HnjWcIRH8AaZsdRFN/dyGPbWCEAZhoMxB3I+GxfSl/FqHn5jAWA7Mg4yK/jimzrteMxXiJvDAqN+nD3F22Y5fGhJhGYoEN8I+51RwB7407i2GkCgYBNAiwfNLHoTZ0qOQw7O6IsZ6ePQlDADnwz9TwMD62aLLQuHcHq7zl2Gh7CvuNdypXMycWvn4GhU/8dTDKde5d+WyTkNxlOvHYjrPA3kPVOYQlbSI9gM/FdZYvVDflF1qWXQrYNQpFQPDjkHj5ADTE5UGoePdMujfbYZzUfmU9chQ==";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAokMOIWtJkCeY47DrdG7Iv4JIfRHa+7a74UmvxxXmGOqJb6Hkln94WSA/pzZWzBOPp5wsOJClSdNwrTde89UYcPM2UOTlLj29XR32Fs0K1Zs8Lavq/L+Edz3+dsPperGBvJ5gVWnXugRt7FXdExFpMrCFsvzGeccEnKbE/k/Qezj4FVbVghGqK+58cCOscJLkbHxh3aTzVsHSXni7h8BjcdLPJGq9EZhuJ6v72+oKM7rMnrylSU4HsHRJuzsDRHfdJJaHYZZhF9DzCHmCsltzoNqW1f9PxlkW1DHpTULwzXPtUn/rRIA2udHaAbdSCFSs7N19LCYhM0Sba9nyL6b5ewIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/CK-Demo/jsp/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/CK-Demo/jsp/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

