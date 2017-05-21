package com.shengdai.mobile.smack.messageConsole;

/**
 * 消息传送者
 * @author zhouan
 *
 */
public class MessageTransporter {

	private static ThreadLocal<Message> msgTransporter = new ThreadLocal<Message>();
	
	public static void setMessage(Message message) {
		msgTransporter.set(message);
	}
	
	public static Message getMessage() {
		return msgTransporter.get();
	}
}
