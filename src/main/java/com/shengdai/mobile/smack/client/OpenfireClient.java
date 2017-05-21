package com.shengdai.mobile.smack.client;

import org.jivesoftware.smack.AccountManager;
import org.jivesoftware.smack.Chat;
import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.ConnectionListener;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;

import com.shengdai.mobile.smack.listener.DefaultConnectionListener;
import com.shengdai.mobile.smack.listener.DefaultPacketFilter;

/**
 * openfire客户端连接处理类
 * @author zhouan
 *
 */
public class OpenfireClient {

	private XMPPConnection connection;
	
	public OpenfireClient() {
	}

	private ConnectionConfiguration initConfig(String host, int port) {
		ConnectionConfiguration config = new ConnectionConfiguration(host, port);
		// 是否启用安全验证 
		config.setSASLAuthenticationEnabled(false);
		// 是否启用调试
		config.setDebuggerEnabled(false);
		// 是否启用压缩
		config.setCompressionEnabled(false);
		// 是否允许重连
		config.setReconnectionAllowed(true);
		return config;
	}

	/**
	 * 连接openfire服务器
	 * @param _context
	 * @param host openfire服务器主机域名/IP
	 * @param port openfire服务器主机 端口
	 * @return
	 */
	public boolean connectServer(String host, int port) {
		connection = new XMPPConnection(initConfig(host, port));
		if (connection == null)
			return false;
		try {
			connection.connect();
		} catch (XMPPException e) {
			e.printStackTrace();
		}
		if (!connection.isConnected())
			return false;
		connection.addConnectionListener(new DefaultConnectionListener());
		return true;
	}
	
	/**
	 * 注册用户
	 * @param user
	 * @param psd
	 * @return
	 */
	public boolean register(String user, String psd) {
		if (connection == null && connection.isConnected())
			return false;
		AccountManager am = connection.getAccountManager();
		try {
			am.createAccount(user, psd);
		} catch (XMPPException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	/**
	 * 登录openfire服务器
	 * @param user 用户名
	 * @param psd 密码
	 * @return
	 */
	public boolean login(String user, String psd) {
		if (connection == null && connection.isConnected())
			return false;
		try {
			connection.login(user, psd);
			return true;
		} catch (XMPPException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public void disconnect() {
		if (connection == null && connection.isConnected())
			return;
		connection.disconnect();
	}

	public void registerPacketListener(PacketListener packetListener) {
		connection.addPacketListener(packetListener, new DefaultPacketFilter());
	}
	
	public void registerConnectionListener(ConnectionListener connectionListener) {
		connection.addConnectionListener(connectionListener);
	}
	
	public boolean isConnected() {
		if (connection == null)
			return false;
		return connection.isConnected();
	}
	
	public Chat createChat(String user, String domain) {
		Chat chat = connection.getChatManager().createChat(user + "@" + domain, null);
		return chat;
	}
	
	public boolean sendMessage(String toUser, String domain, String message) {
		Chat chat = createChat(toUser, domain);
		try {
			chat.sendMessage(message);
			chat = null;
		} catch (XMPPException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public static void main(String args[]) {
		OpenfireClient client = new OpenfireClient();
		boolean flag = client.connectServer("60.29.82.148", 5222);
		if (flag) {
			boolean status = client.login("xmz", "123456");
			if (status) {
				System.out.println("ok");
			}else {
				System.out.println("false");
			}
		}
	}
	
	
}
