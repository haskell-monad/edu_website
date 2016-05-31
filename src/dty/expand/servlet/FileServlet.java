package dty.expand.servlet;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.freeteam.cms.model.UploadImages;
import cn.freeteam.util.DateUtil;
import cn.freeteam.util.PropertiesUtil;
import dty.expand.image.watermark.PressImage;
import dty.expand.util.Json;
public class FileServlet extends HttpServlet {
    @SuppressWarnings("unchecked")
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	doGet(request, response);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	
    	String currDate=DateUtil.format(new Date(), "yyyyMM");
    	String iswater=request.getParameter("iswater");
        String savePath = this.getServletConfig().getServletContext().getRealPath("");
        savePath = savePath + "/upload/"+currDate+"/";
        File f1 = new File(savePath);
        if (!f1.exists()) {
            f1.mkdirs();
        }
       // System.out.println("上传图片路径:"+savePath);
        DiskFileItemFactory fac = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(fac);
        upload.setHeaderEncoding("utf-8");
        // 设置允许上传的最大文件大小 30M 
        //upload.setSizeMax(30 * 1024 * 1024); 
        List fileList = null;
        try {
            fileList = upload.parseRequest(request);
        } catch (FileUploadException ex) {
            return;
        }
        Iterator<FileItem> it = fileList.iterator();
        String name = "";
        String extName = "";
        String newnames="";
        while (it.hasNext()) {
            FileItem item = it.next();
            UploadImages uimage=null; //创建对象
            if (!item.isFormField()) {
            	uimage=new UploadImages();
                name = item.getName();
                long size = item.getSize();
                String type = item.getContentType();
                if (name == null || name.trim().equals("")) {
                    continue;
                }
                //扩展名格式：  
                if (name.lastIndexOf(".") >= 0) {
                    extName = name.substring(name.lastIndexOf("."));
                }
                File file = null;
                //设置旧的名称
                uimage.setOldname(name);
                do {
                    //生成新的文件名(毫秒数)
                	long currentTime=System.currentTimeMillis();
                	//设置新的名称
                	newnames=currentTime+extName;
                    //name = UUID.randomUUID().toString();
                    file = new File(savePath + newnames);
                } while (file.exists());
	                uimage.setNewname(newnames);
	                uimage.setType(type);
	                uimage.setSize(size);
	                //设置后缀
	                uimage.setExtName(extName);
	                uimage.setUrl("/upload/"+currDate+"/"+newnames);
	                File saveFile = new File(savePath+newnames);
                try {
                    item.write(saveFile);
                    /**
                	 * 判断是否添加水印
                	 * 返回true，添加水印成功
                	 */
                	if(iswater!=null && !iswater.equals("0")){
                		String rootpath=request.getSession().getServletContext().getRealPath("");
                		boolean flag=createWater(rootpath,savePath,newnames,iswater);
                		//System.out.println(iswater+":flag:"+flag);
                	}
                    Json json=new Json();
                    String value=json.toJson(uimage);
                    response.getWriter().print(value);
                } catch (FileUploadException e) {
                    e.printStackTrace();
                } catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            }
        }
        response.getWriter().print(""); 
    }
    /**
     * 水印方法
     * @param iswater
     * rootpath 根目录
     * waterpath 水印所在目录
	 * newname 图片名称
	 * 1为大水印，2为小水印
     * @return
     */
    public static boolean createWater(String rootpath,String uploadpath,String newname,String iswater){
    	boolean flags=false;
    	FileServlet servlet=new FileServlet();
    	//配置文件路径
    	String connfigpath=servlet.getClass().getClassLoader().getResource("").getPath()+"watermark.properties";
    	String opppath=""; //水印图片所在相对路径 ，如：    /img/watermark/*.png
    	String waterpath="";
		if(iswater.trim().equals("1")){
			opppath=PropertiesUtil.getConfig(connfigpath,"bwatermark");
		}else if(iswater.trim().equals("2")){
			opppath=PropertiesUtil.getConfig(connfigpath,"swatermark");
		}
		waterpath=rootpath+opppath;
		//System.out.println("获取到的水印所在位置："+waterpath);
		//上传的图片的路径
		String uploadpaths=uploadpath+newname;
		flags=PressImage.pressImage(uploadpaths,waterpath);
    	return flags;
    }
}
