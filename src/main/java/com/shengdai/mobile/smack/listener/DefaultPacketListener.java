package com.shengdai.mobile.smack.listener;

import org.apache.log4j.Logger;
import org.jivesoftware.smack.PacketListener;
import org.jivesoftware.smack.packet.Packet;

/**
 * 默认openfire数据包接收监听器
 * @author zhouan
 *
 */
public class DefaultPacketListener implements PacketListener {

	private Logger logger = Logger.getLogger(DefaultPacketListener.class);
	
	//接受消息处理
	public void processPacket(Packet packet) {
		logger.info(packet.toXML());
	}

}
