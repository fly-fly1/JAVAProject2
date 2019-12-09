package com.zhiyou.util;

import java.io.IOException;
import java.io.InputStream;
import java.net.SocketException;

import org.apache.commons.net.ftp.FTPClient;

public class FTPUtil {
	public static String upload(InputStream input, String fileName) {
		fileName = System.currentTimeMillis() + fileName;

		// 1.实例化ftpClient
		FTPClient ftp = new FTPClient();
		String url = "ftp://192.168.124.81/";
		// 2.连接服务器
		try {
			ftp.connect("192.168.124.81");
			// 3.登录服务器
			ftp.login("admin", "123");
			// 4.修改客户端模式
			ftp.enterLocalPassiveMode();
			// 5.设置文件上传到服务器的位置
			ftp.changeWorkingDirectory("/");
			// 6.设置文件类型(图片类型/视频类型)
			ftp.setFileType(FTPClient.BINARY_FILE_TYPE);
			// 7.上传文件
			ftp.storeFile(fileName, input);
			return url + fileName;

		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				ftp.logout();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
}
