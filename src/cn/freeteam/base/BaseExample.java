package cn.freeteam.base;

/**
 * 共用的属性和方法 
 * @author freeteam
 * 2011-4-5
 */
public class BaseExample {
	
	/**
	 * update by limengyu @20131204
	 */
	protected int start;
    public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	protected int currPage;
    protected int pageSize;
    protected int skip;
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getSkip() {
		return (currPage-1)*pageSize;
	}
	public void setSkip(int skip) {
		this.skip = skip;
	}
}
