package cn.freeteam.cms.action;

import java.util.Date;
import java.util.List;
import cn.freeteam.base.BaseAction;
import cn.freeteam.cms.model.Innerlink;
import cn.freeteam.cms.service.InnerlinkService;
import cn.freeteam.util.OperLogUtil;
import cn.freeteam.util.Pager;

public class InnerlinkAction extends BaseAction{
	
	private InnerlinkService innerlinkService;
	private Innerlink innerlink;
	private List<Innerlink> innerlinklist=null;
	private String ids;
	private String logContent;
	private String order=" addtime desc ";
	
	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getLogContent() {
		return logContent;
	}

	public void setLogContent(String logContent) {
		this.logContent = logContent;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public InnerlinkAction(){
		init("innerlinkService");
	}
	
	/**
	 * 列表显示页
	 * @return
	 */
	public String list(){
		if(innerlink==null){
			innerlink=new Innerlink();
		}
		if (order.trim().length()==0) {
			order=" addtime desc ";
		}
		innerlinklist=innerlinkService.findByPage(innerlink, order, currPage, pageSize);
		totalCount=innerlinkService.count(innerlink);
		Pager pager=new Pager(getHttpRequest());
		pager.appendParam("order");
		pager.appendParam("pageSize");
		pager.appendParam("pageFuncId");
		pager.setCurrPage(currPage);
		pager.setPageSize(pageSize);
		pager.setTotalCount(totalCount);
		pager.setOutStr("innerlink_list.do");
		pageStr=pager.getOutStr();
		return "list";
	}
	/**
	 * 显示编辑页面
	 * @return
	 */
	public String edit(){
		if (innerlink!=null && innerlink.getId()!=null && innerlink.getId()>0) {
			innerlink=innerlinkService.findById(innerlink.getId());
		}
		return "edit";
	}
	/**
	 * 编辑处理
	 * @return
	 */
	public String editDo(){
		if (innerlink!=null) {
			String oper="添加";
			try {
				if (innerlink.getId()!=null && innerlink.getId()>0) {
					//更新
					oper="更新";
					Innerlink oldInnerlink=innerlinkService.findById(innerlink.getId());
					if (oldInnerlink!=null) {
						oldInnerlink.setName(innerlink.getName());
						oldInnerlink.setUrl(innerlink.getUrl());
						oldInnerlink.setColor(innerlink.getColor());
						oldInnerlink.setIsbold(innerlink.getIsbold());
						innerlinkService.update(oldInnerlink);
						OperLogUtil.log(getLoginName(), oper+"信息("+oldInnerlink.getName()+")成功", getHttpRequest());
					}
				}else{
					//添加操作
					//根据名称判断数据库是否存在相同的内链
					String currname=innerlink.getName();
					Innerlink searchInnerLink=innerlinkService.findByName(currname);
					if(searchInnerLink!=null){
						write("<script>alert('该内链已存在!');location.href='innerlink_list.do?pageFuncId="+pageFuncId+"';</script>", "GBK"); 
					}else{
						//保存内链
						if (innerlink.getAddtime()==null) {
							innerlink.setAddtime(new Date());
						}
						innerlink.setCreateperson(getLoginName());
						innerlinkService.insert(innerlink);
						OperLogUtil.log(getLoginName(), oper+"信息("+innerlink.getName()+")成功", getHttpRequest());
					}
				}
				write("<script>alert('操作成功');location.href='innerlink_list.do?pageFuncId="+pageFuncId+"';</script>", "GBK");
			} catch (Exception e) {
				DBProException(e);
				OperLogUtil.log(getLoginName(), oper+"信息("+innerlink.getName()+")失败:"+e.toString(), getHttpRequest());
				showMessage="操作失败:"+e.toString();
				return showMessage(showMessage, forwardUrl, forwardSeconds);
			}
		}
		return null;
	}
	
	/**
	 * 根据id
	 * 删除内链
	 * @return
	 */
	public String del(){
		if (ids!=null && ids.trim().length()>0) {
			StringBuilder sb=new StringBuilder();
			String[] idArr=ids.split(";");
			if (idArr!=null && idArr.length>0) {
				try {
					for (int i = 0; i < idArr.length; i++) {
						if (idArr[i].trim().length()>0) {
							innerlink=innerlinkService.findById(Integer.parseInt(idArr[i]));
							if(innerlink!=null){
								innerlinkService.del(Integer.parseInt(idArr[i]));
								sb.append(idArr[i]+";");
								logContent="删除内链("+innerlink.getName()+")成功!";
							}
							OperLogUtil.log(getLoginName(), logContent, getHttpRequest());
						}
					}
				} catch (Exception e) {
					DBProException(e);
					logContent="删除内链("+innerlink.getName()+")失败:"+e.toString()+"!";
					OperLogUtil.log(getLoginName(), logContent, getHttpRequest());
				}
			}
			write(sb.toString(), "GBK");
		}
		return null;
	}
	
	public InnerlinkService getInnerlinkService() {
		return innerlinkService;
	}
	public void setInnerlinkService(InnerlinkService innerlinkService) {
		this.innerlinkService = innerlinkService;
	}
	public Innerlink getInnerlink() {
		return innerlink;
	}
	public void setInnerlink(Innerlink innerlink) {
		this.innerlink = innerlink;
	}
	public List<Innerlink> getInnerlinklist() {
		return innerlinklist;
	}
	public void setInnerlinklist(List<Innerlink> innerlinklist) {
		this.innerlinklist = innerlinklist;
	}
}
