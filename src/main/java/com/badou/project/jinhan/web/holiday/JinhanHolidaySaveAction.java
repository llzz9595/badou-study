package com.badou.project.jinhan.web.holiday;
import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.shengdai.base.support.struts.used.BaseSaveStrutsAction;
import com.shengdai.global.util.DateUtils;
import com.shengdai.global.util.param.ParamDateUtils;
import com.shengdai.kpi.attach.model.Attach;
import com.shengdai.ssl.local.LogonCertificate;
import com.shengdai.ssl.local.LogonCertificateHolder;
import com.badou.project.jinhan.model.JinhanHolidayEntity;
import com.badou.project.jinhan.service.IJinhanHolidayService;
import com.badou.project.jinhan.web.form.JinhanHolidayForm;

@Controller
public class JinhanHolidaySaveAction extends BaseSaveStrutsAction<JinhanHolidayEntity, Serializable,JinhanHolidayForm> {

	private static final long serialVersionUID = -4265325489459574831L;
	//注意，file并不是指前端jsp上传过来的文件本身，而是文件上传过来存放在临时文件夹下面的文件
   private File[] file1;
   //提交过来的file的名字
private String[] file1FileName;

//提交过来的file的MIME类型
private String[] file1ContentType;

	public String[] getFile1FileName() {
	return file1FileName;
}

public void setFile1FileName(String[] file1FileName) {
	this.file1FileName = file1FileName;
}

public String[] getFile1ContentType() {
	return file1ContentType;
}

public void setFile1ContentType(String[] file1ContentType) {
	this.file1ContentType = file1ContentType;
}

	public File[] getFile1() {
		return file1;
	}

	public void setFile1(File[] file1) {
		this.file1 = file1;
	}


	//private  JinhanHolidayEntity holiday;
	@Autowired
	private IJinhanHolidayService jinhanHolidayService ;
	@Autowired
	public void setJinhanHolidayService(IJinhanHolidayService jinhanHolidayService) {
		this.jinhanHolidayService = jinhanHolidayService;
		super.setBaseService(jinhanHolidayService);
	}
	
	// 临时保存上传的文件
	@Action(interceptorRefs = @InterceptorRef("fileUploadStack"))
			public void saveholiday() throws Exception{
				List<Attach> attachList = null;
			//	System.out.print("文件个数是："+file1.length+"\n\n");
				if(file1!= null && file1.length!= 0){
					attachList = new ArrayList<Attach>();
					for(int i=0; i<file1.length; i++) {
						System.out.println(file1FileName[i]);
						System.out.println(file1ContentType[i]);
						attachList.add(this.getAttach(file1[i],file1FileName[i]));
					}
				}
				JinhanHolidayEntity holiday=new JinhanHolidayEntity();
				holiday.setMemberId(request.getParameter("memberId"));
				holiday.setMemberName(request.getParameter("memberName"));
				holiday.setMemberPart(request.getParameter("memberPart"));
				holiday.setReason(request.getParameter("reason"));
				holiday.setDays(Integer.parseInt(request.getParameter("days")));
				Date periodb = ParamDateUtils.getParameter(request, "periodb",DateUtils.DATE_FMT_CN_YMD);
				Date periode = ParamDateUtils.getParameter(request, "periode",DateUtils.DATE_FMT_CN_YMD);
				holiday.setPeriodb(periodb);
				holiday.setPeriode(periode);
				String s=jinhanHolidayService.saveJinhanHoliday(holiday, attachList);
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out=response.getWriter();
				if(s.equals("1"))
				out.print("保存成功");
				else if(s.equals("2"))
					out.print("修改成功");
				else
					out.print("发生错误");
				out.close();
			}
	
	@SuppressWarnings("resource")
	private Attach getAttach(File file,String fileName) throws Exception{
		byte content[] = null;
		Attach attach = new Attach();
		InputStream is = new FileInputStream(file);
		content = new byte[is.available()];
		is.read(content);
		LogonCertificate logon = LogonCertificateHolder.getLogonCertificate();
		String suffix = fileName.substring(fileName.indexOf("."));
		attach.setName(fileName);
		attach.setFileName(fileName);
		attach.setFileContent(content);
		attach.setFileSize(content.length);
		attach.setExtendName(suffix);
		attach.setGenPersonId(logon.getUserId());
		attach.setGenPersonName(logon.getLoginId());
		return attach;
	}
	
	@Action
	public void downholiday(){
		String id=request.getParameter("id");
		int  link=Integer.parseInt(request.getParameter("link"));
		int success=jinhanHolidayService.downloadFile(id, response, link);
		if(success==0){
			System.out.print("失败");
		}
		else{
			
		}
	}
	}

	
