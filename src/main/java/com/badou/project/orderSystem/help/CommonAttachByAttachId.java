package com.badou.project.orderSystem.help;

import java.io.InputStream;
import org.springframework.beans.factory.annotation.Autowired;
import com.shengdai.factory.InstanceFactory;
import com.shengdai.kpi.attach.AttachFactory;
import com.shengdai.kpi.attach.model.Attach;
import com.shengdai.kpi.attach.service.IAttachService;

public class CommonAttachByAttachId {
	@Autowired
	private static IAttachService attachService;

	@Autowired
	private static AttachFactory attachFactory;
	
	/**
	 * 通过AttachId查询的Attach
	 * */
	public String findTempIdByattachId(String attachId) {
		String tempId = "";
		try {
			IAttachService attachService = (IAttachService) InstanceFactory
					.getInstance(IAttachService.class);
			AttachFactory attachFactory = (AttachFactory) InstanceFactory
					.getInstance(AttachFactory.class);
			// 把图片找出来并放进缓存中
			Attach attach = attachService.getById(attachId);
			if(attach!=null){
			InputStream is = attachFactory.downloadFile(attachId);
				//该方法是因为name有后缀名，故而需要将name去除后缀名
				//无后缀名时请使用ComAttach
				String fileNameWithSuffix = attach.getName();
				//String fileName = fileNameWithSuffix.substring(0,fileNameWithSuffix.lastIndexOf("."));
				tempId = AttachImgCaches.storeImg(attachId,
						new AttachImgCaches.AttachImg(attachId,null, is.available(), is));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tempId;
	}
}
