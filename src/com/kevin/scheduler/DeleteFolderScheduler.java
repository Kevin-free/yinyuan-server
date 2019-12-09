package com.kevin.scheduler;

import java.io.File;
import java.util.Calendar;
import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * 定时删除指定文件夹中的文件任务
 * @author Kevin
 *
 */
@Component
public class DeleteFolderScheduler {	
	
	@Scheduled(cron="1 0 0 ? * *")   //每天的0:0:1秒触发
	public void scheduler() {
		System.out.println("sched. del file----");
		try {
			File srcFolder = new File("/home/pydata/comments");
			deleteFiles(srcFolder);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 删除指定文件夹中的文件
	private void deleteFiles(File srcFolder) {
		File[] fileArrayFiles = srcFolder.listFiles();
		if (fileArrayFiles != null) {
			for (File file : fileArrayFiles) {
				if (file.isDirectory()) {
					deleteFiles(file);
				} else {
					System.out.println("del "+ file.getName() + " : " + file.delete());
				}
			}
		}
	}
}
