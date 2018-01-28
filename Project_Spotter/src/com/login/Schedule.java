package com.login;

import java.sql.SQLException;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class Schedule {
	
	static ScheduledExecutorService service;
	
	public static void startService() {
		
	  System.out.println("mail service started!");
		Runnable r = ()->{
			
			try {
				CheckLoop.start();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		};
		
		service = Executors.newSingleThreadScheduledExecutor();
		service.scheduleAtFixedRate(r, 0, 1, TimeUnit.MINUTES);
		
	}
	
	public static void stopService() {
	    service.shutdown();
	    System.out.println("mail service stoped");
	}

}
