package dty.expand.image.watermark;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.commons.lang3.StringUtils;

public class PressImage {
	
	public static String getFileSuffix(String filePath){
		String suffix = "";
		if ((filePath != null) && (filePath.length() > 0)) {   
            int dot = filePath.lastIndexOf('.');   
            if ((dot >-1) && (dot < (filePath.length() - 1))) {   
            	suffix = filePath.substring(dot + 1);   
            }   
        }   
        return suffix;
	}

    /**
     * 添加图片水印
     * @param targetImg 目标图片路径，如：C://myPictrue//1.jpg
     * @param waterImg  水印图片路径，如：C://myPictrue//logo.png
     * @param alpha 透明度(0.0 -- 1.0, 0.0为完全透明，1.0为完全不透明)
     */
    public static boolean pressImage(String targetImg, String waterImg) {
            try {
            	String suffix = getFileSuffix(targetImg);
            	String PICTRUE_FORMATE = StringUtils.isBlank(suffix)?"jpg":suffix;
            	
                File targetImgFile = new File(targetImg);
                Image targetImage = ImageIO.read(targetImgFile);
                int targetImageWidth = targetImage.getWidth(null);
                int targetImageHeight = targetImage.getHeight(null);
                BufferedImage bufferedImage = new BufferedImage(targetImageWidth, targetImageHeight, BufferedImage.TYPE_INT_RGB);
                Graphics2D g = bufferedImage.createGraphics();
                g.drawImage(targetImage, 0, 0, targetImageWidth, targetImageHeight, null);
            
                Image waterImage = ImageIO.read(new File(waterImg));// 水印文件
                int waterImgWidth = waterImage.getWidth(null);
                int waterImgHeight = waterImage.getHeight(null);
                g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, 0.7f));//透明度(0.0f -- 1.0f, 0.0为完全透明，1.0为完全不透明)
                
                int x = targetImageWidth - waterImgWidth;
                int y = targetImageHeight - waterImgHeight;
                
                g.drawImage(waterImage, x, y, waterImgWidth, waterImgHeight, null); // 水印文件结束
                g.dispose();
                ImageIO.write(bufferedImage, PICTRUE_FORMATE, targetImgFile);
                return true;
            } catch (IOException e) {
                e.printStackTrace();
            }
            return false;
    }
    
    public static void main(String[] args) {
    	pressImage("C:\\Users\\Administrator\\Desktop\\ceshi\\壁纸20131126143119.jpg","C:\\Users\\Administrator\\Desktop\\ceshi\\swatermark.png");
    	//pressImage("C://Users//Public//Pictures//Sample Pictures//460 (2).jpg", "C://Users//Public//Pictures//Sample Pictures//水印.png");
	}
}
