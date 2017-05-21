package com.badou.project.orderSystem.help;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

public class AttachImgCaches {
	public static Logger logger = Logger.getLogger(AttachImgCaches.class);
	public static String DEFAULT_SUFFIX = ".png";

	public static Map<String, AttachImg> imgCaches = new HashMap<String, AttachImg>();

	public static String storeImg(AttachImg img) {
		return storeImg(null, img);
	}

	public static String storeImg(String imgId, AttachImg img) {
		if (imgCaches.size() > 100) {
			imgCaches.clear();
		}
		if (StringUtils.isNotEmpty(imgId)) {
			imgCaches.put(imgId, img);
			return imgId;
		} else {
			String _key = getUid();
			imgCaches.put(_key, img);
			return _key;
		}
	}

	public static AttachImg getImg(String imgId) {
		return imgCaches.get(imgId);
	}

	private static String getUid() {
		return System.currentTimeMillis() + "" + (int) (Math.random() * 10000);
	}

	public static class AttachImg {

		private String name = "";

		private long size = 0l;

		private String suffix = "";

		private InputStream is;

		private byte[] content = {};

		public AttachImg() {

		}

		public AttachImg(String name, String suffix, long size, InputStream is) {
			this.name = name;
			this.suffix = suffix;
			this.size = size;
			this.is = is;
			this.content = getContent();
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public long getSize() {
			if (size == 0 && is != null) {
				try {
					size = is.available();
				} catch (IOException e) {
					logger.error("获取文件大小错误：" + e.getMessage());
				}
			}
			return size;
		}

		public void setSize(long size) {
			this.size = size;
		}

		public String getSuffix() {
			if (StringUtils.isEmpty(suffix) && StringUtils.isNotEmpty(name)) {
				suffix = name.substring(name.lastIndexOf("\\.") + 1);
			} else {
				suffix = DEFAULT_SUFFIX;
			}
			return suffix;
		}

		public void setSuffix(String suffix) {
			this.suffix = suffix;
		}

		public InputStream getIs() {
			try {
				if (is == null || is.available() == 0) {
					is = new ByteArrayInputStream(content);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			return is;
		}

		public void setIs(InputStream is) {
			this.is = is;
		}

		public byte[] getContent() {
			if (content.length == 0 && is != null) {
				try {
					content = new byte[is.available()];
					is.read(content);
				} catch (IOException e) {
					logger.error("获取文件错误：" + e.getMessage());
				}
			}
			return content;
		}

		public void setContent(byte[] content) {
			this.content = content;
		}

	}
}
