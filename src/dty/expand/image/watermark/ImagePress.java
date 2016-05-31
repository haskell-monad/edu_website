package dty.expand.image.watermark;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

public class ImagePress {

	/**图片格式：JPG*/
    private static final String PICTRUE_FORMATE_JPG = "jpg";
	private FileInputStream fis;
	
	/**
     * 判断文件是否存在
     * @param filePath 文件路径
     * @return boolean
     */
	public boolean isExist(String filePath) {
		File file = new File(filePath);
		if (file.exists()) {
			return true;
		}
		return false;
	}

	/**
     * 获取文件大小
     * @param filePath 文件路径
     * @return long 字节数
     */
	public long getImgSize(String filePath) {
		long size = -1l;
		if (this.isExist(filePath)) {
			File f = new File(filePath);
			try {
				fis = new FileInputStream(f);
				try {
					size = fis.available();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			} catch (FileNotFoundException e2) {
				e2.printStackTrace();
			}
		}
		return size;
	}
	
	/**
     * 获取图片宽度
     * @param filePath  图片文件
     * @return 宽度
     */
    public int getImgWidth(String filePath) {
        InputStream is = null;
        BufferedImage src = null;
        int ret = -1;
        if (this.isExist(filePath)) {
	        try {
	            is = new FileInputStream(filePath);
	            src = javax.imageio.ImageIO.read(is);
	            ret = src.getWidth(null); // 得到源图宽
	            is.close();
	        } catch (Exception e) {
	        	e.printStackTrace();
	        }
        }
        return ret;
    }
    
    /**
     * 获取图片高度
     * @param filePath  图片文件
     * @return 高度
     */
    public int getImgHeight(String filePath) {
        InputStream is = null;
        BufferedImage src = null;
        int ret = -1;
        if (this.isExist(filePath)) {
	        try {
	            is = new FileInputStream(filePath);
	            src = javax.imageio.ImageIO.read(is);
	            ret = src.getHeight(null); // 得到源图高
	            is.close();
	        } catch (Exception e) {
	        	e.printStackTrace();
	        }
        }
        return ret;
    }

    /**
     * 获取字符长度，一个汉字作为 1 个字符, 一个英文字母作为 0.5 个字符
     * @param text
     * @return 字符长度，如：text="中国",返回 2；text="test",返回 2；text="中国ABC",返回 4.
     */
    public int getLength(String text) {
        int textLength = text.length();
        int length = textLength;
        for (int i = 0; i < textLength; i++) {
            if (String.valueOf(text.charAt(i)).getBytes().length > 1) {
                length++;
            }
        }
        return (length % 2 == 0) ? length / 2 : length / 2 + 1;
    }
    
    /**
     * 添加文字水印
     * @param targetImg 目标图片路径，如：C:\myPictrue\1.jpg
     * @param pressText 水印文字， 如：中国证券网
     * @param fontName 字体名称，    如：宋体
     * @param fontStyle 字体样式，如：粗体和斜体(Font.BOLD|Font.ITALIC)
     * @param fontSize 字体大小，单位为像素
     * @param color 字体颜色
     * @param x 水印文字距离目标图片左侧的偏移量，如果x<0, 则在正中间
     * @param y 水印文字距离目标图片上侧的偏移量，如果y<0, 则在正中间
     * @param alpha 透明度(0.0 -- 1.0, 0.0为完全透明，1.0为完全不透明)
     */
    public boolean pressText(String filePath, String pressText, String fontName, int fontStyle, int fontSize, Color color, int x, int y, float alpha) {
    	
    	if (this.isExist(filePath)) {
	        try {
	        	File file = new File(filePath);

	        	Image imgFile = ImageIO.read(file);
	        	int imgWidth = imgFile.getWidth(null);
	        	int imgHeight = imgFile.getHeight(null);
	        	
	        	BufferedImage bufferedImage = new BufferedImage(imgWidth, imgHeight, BufferedImage.TYPE_INT_RGB);
	        	Graphics2D g = bufferedImage.createGraphics();
	        	g.drawImage(imgFile, 0, 0, imgWidth, imgHeight, null);
	        	g.setFont(new Font(fontName, fontStyle, fontSize));
	        	g.setColor(color);
	        	g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, alpha));

	        	int fontWidth = fontSize * this.getLength(pressText);
	        	int fontHeight = fontSize;
	        	
	        	int widthDiff = imgWidth - fontWidth;
	        	int heightDiff = imgHeight - fontHeight;
	        	
	        	if(x < 0){
		        	x = widthDiff / 2;
		        	}else if(x > widthDiff){
		        	x = widthDiff;
	        	}
	        	
	        	if(y < 0){
		        	y = heightDiff / 2;
		        	}else if(y > heightDiff){
		        	y = heightDiff;
	        	}
	        	g.drawString(pressText, x, y + fontHeight);
	        	g.dispose();
	        	ImageIO.write(bufferedImage, PICTRUE_FORMATE_JPG, file);
	            return true;
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
    	}
    	
    	return false;
    	
    }
	
	public static void main(String[] args) {
		String filePath = "D:/201311/1383532773535.jpg";
		ImagePress iu = new ImagePress();
		System.out.println(iu.getImgSize(filePath));
		System.out.println(iu.getImgWidth(filePath));
		System.out.println(iu.getImgHeight(filePath));
		iu.pressText(filePath, "www.10333.com", "宋体", Font.BOLD|Font.ITALIC, 10, Color.RED, 100, 0, 1.0f);
	}

}