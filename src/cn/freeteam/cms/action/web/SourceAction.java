package cn.freeteam.cms.action.web;

import java.util.List;

import cn.freeteam.base.BaseAction;
import cn.freeteam.cms.model.Source;
import cn.freeteam.cms.service.SourceService;
import dty.expand.util.Json;

public class SourceAction extends BaseAction{

	private SourceService sourceService;
	private Source source;
	
	public SourceAction(){
		init("sourceService");
	}
	/**
	 * 获取所有的来源
	 * 返回json
	 * @return
	 */
	public String findAllSource(){
			List<Source> sourceList=null;
			String order=" reference desc,addtime desc";
			sourceList=sourceService.findAll(source, order);
			if(sourceList.size()>0){
				Json json=new Json();
				String data=json.toJson(sourceList);
				write(data, "UTF-8");
			}
		return null;
	}
	/**
	 * 更改来源的信息
	 * 设置reference次数
	 * @return
	 */
	public String setReference(){
		sourceService.setReference();
		return null;
	}
	
	public SourceService getSourceService() {
		return sourceService;
	}
	public void setSourceService(SourceService sourceService) {
		this.sourceService = sourceService;
	}
	public Source getSource() {
		return source;
	}
	public void setSource(Source source) {
		this.source = source;
	}
}
