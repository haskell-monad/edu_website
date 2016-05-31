package dty.test;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Urlset {

	private String url;
	private String loc;
	private String priority;
	private String lastmod;
	private String changefreq;
	public String getUrl() {
		return url;
	}
	@XmlElement
	public void setUrl(String url) {
		this.url = url;
	}
	public String getLoc() {
		return loc;
	}
	 @XmlElement
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getPriority() {
		return priority;
	}
	 @XmlElement
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getLastmod() {
		return lastmod;
	}
	@XmlElement
	public void setLastmod(String lastmod) {
		this.lastmod = lastmod;
	}
	public String getChangefreq() {
		return changefreq;
	}
	@XmlElement
	public void setChangefreq(String changefreq) {
		this.changefreq = changefreq;
	}
}
