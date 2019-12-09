package com.kevin.test;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

/**
 * 类描述:定时删除某个文件夹里面所有数据的的例子
 * 
 * @author: 张宇
 * @date: 日期: 2018年9月4日 时间: 上午11:11:05
 * @version 1.0
 */

public class DeleteFolderAtRegularTime {

	public static void main(String[] args) throws ParseException {
		Timer t = new Timer();
		String string = "2018-9-4 11:15:00";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d = sdf.parse(string);
//		t.schedule(new DeleteFolder(t), d);

		Calendar calendar = Calendar.getInstance(); //获取当前时间
		Date date = calendar.getTime();

		// 设置定时任务，从现在开始，每24小时执行一次
		t.schedule(new DeleteFolder(t), date, 24 * 60 * 60 * 1000);
	}
}

// 删除文件夹的类
class DeleteFolder extends TimerTask {

	private Timer timer;

	public DeleteFolder(Timer t) {
		this.timer = t;
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub
		File srcFolder = new File("/home/pydata/testDel");
		Deletefiles(srcFolder);
		// 最后释放资源
		timer.cancel();
	}

	// 删除文件夹的方法
	private void Deletefiles(File srcFolder) {
		File[] fileArrayFiles = srcFolder.listFiles();
		if (fileArrayFiles != null) {
			for (File file : fileArrayFiles) {
				if (file.isDirectory()) {
					Deletefiles(file);
				} else {
					System.out.println("del "+ file.getName() + " : " + file.delete());
				}
			}
		}
//		System.out.println(srcFolder.getName() + ":" + srcFolder.delete());
	}
}
