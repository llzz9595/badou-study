package com.shengdai.mobile.smack.listener;

import org.jivesoftware.smack.filter.PacketFilter;
import org.jivesoftware.smack.packet.Packet;

/**
 * 默认openfire数据包过滤器
 * @author zhouan
 *
 */
public class DefaultPacketFilter implements PacketFilter {

	public boolean accept(Packet arg0) {
		return true;
	}

}
