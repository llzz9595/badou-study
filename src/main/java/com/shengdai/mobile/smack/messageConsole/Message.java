package com.shengdai.mobile.smack.messageConsole;

import java.util.List;

/**
 * 推送消息实体
 * @author zhouan
 *
 */
public class Message {

	private String code;
	
	private String title;
	
	private String content;
	
	private List<String> toUser;
	
	private String msgXml;

	public Message(String code, String title, String content,
			List<String> toUser) {
		super();
		this.code = code;
		this.title = title;
		this.content = content;
		this.toUser = toUser;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public List<String> getToUser() {
		return toUser;
	}

	public void setToUser(List<String> toUser) {
		this.toUser = toUser;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMsgXml() {
		msgXml = "[code]" + code + "[/code][title]" + title + "[/title][content]" + content + "[/content]";
		return msgXml;
	}
	
}
