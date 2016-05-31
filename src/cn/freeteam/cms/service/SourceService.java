package cn.freeteam.cms.service;

import java.util.Date;
import java.util.List;
import java.util.UUID;


import cn.freeteam.base.BaseService;
import cn.freeteam.cms.dao.SourceMapper;
import cn.freeteam.cms.model.Info;
import cn.freeteam.cms.model.Source;
import cn.freeteam.cms.model.SourceExample;
import cn.freeteam.cms.model.SourceExample.Criteria;

/**
 * 
 * <p>Title: InfoService.java</p>
 * 
 * <p>Description: 信息服务</p>
 * 
 * <p>Date: Feb 7, 2012</p>
 * 
 * <p>Time: 1:55:57 PM</p>
 * 
 * <p>Copyright: 2012</p>
 * 
 * <p>Company: freeteam</p>
 * 
 * @author freeteam
 * @version 1.0
 * 
 * <p>============================================</p>
 * <p>Modification History
 * <p>Mender: </p>
 * <p>Date: </p>
 * <p>Reason: </p>
 * <p>============================================</p>
 */
public class SourceService extends BaseService{

	private SourceMapper sourceMapper;
	private InfoService infoService;
	public SourceService(){
		initMapper("sourceMapper");
	}
	/**
	 * 添加来源
	 * @param source
	 * @return
	 */
	public String insert(Source source){
		if (source!=null) {
			source.setId(UUID.randomUUID().toString());
			sourceMapper.insert(source);
			DBCommit();
			return source.getId();
		}
		return "";
	}
	/**
	 * 更新来源信息
	 * @param info
	 */
	public void update(Source source){
		sourceMapper.updateByPrimaryKey(source);
		DBCommit();
	}
	/**
	 * 根据id查询来源
	 * @param id
	 * @return
	 */
	public Source findById(String id){
		return sourceMapper.selectByPrimaryKey(id);
	}
	/**
	 * 查询出所有的来源
	 * @param source
	 * @param order
	 * @return
	 */
	public List<Source> findAll(Source source,String order){
		SourceExample example=new SourceExample();
		Criteria criteria=example.createCriteria();
		proSearchParam(source, criteria);
		if (order!=null && order.trim().length()>0) {
			example.setOrderByClause(order);
		}
		return sourceMapper.selectByExample(example);
	}
	/**
	 * 删除来源
	 * @return
	 */
	public void del(String id){
		sourceMapper.deleteByPrimaryKey(id);
		DBCommit();
	}
	/**
	 * 根据来源名称查看是否存在
	 * name 来源的名称
	 * 返回true 说明存在
	 * 返回false 不存在
	 * @return
	 */
	public boolean isexist(String editor,String name){
		boolean flag=true;
		int n=0;
		n=sourceMapper.selectByName(name);
		if(n<1){
			//如果来源表中不存在就将它加入到来源表中
			Source source=new Source();
			source.setName(name);
			source.setAddtime(new Date());
			if(editor.trim().equals("")){
				editor="admin";
			}
			source.setAddperson(editor);
			source.setReference(0);
			insert(source);
			flag=false;
			return flag;
		}
		return flag;
	}
	/**
	 * 设置reference引用次数
	 */
	public void setReference(){
		init("infoService");
		int total=0;
		/**
		 * 获取所有的来源列表
		 */
		SourceExample source_example=new SourceExample();
		List<Source> sourceList=null;
		sourceList=sourceMapper.selectByExample(source_example);
		Info infos=null;
		String id="";
		String name="";
		Source newSource=null;
		for(Source sos : sourceList){
			infos=new Info();
			id=sos.getId();
			name=sos.getName();
			infos.setSource(name);
			total=infoService.sourceCount(infos);
			newSource=sourceMapper.selectByPrimaryKey(id);
			if(newSource!=null){
				newSource.setReference(total);
				update(newSource);
			}
		}
	}
	
	/**
	 * 处理查询条件
	 * @param 
	 * @param criteria
	 */
	public void proSearchParam(Source source,Criteria criteria){
		if(source!=null){
			if(source.getId()!=null && source.getId().trim().length()>0){
				criteria.andIdEqualTo(source.getId());
			}
			if(source.getName()!=null && source.getName().trim().length()>0){
				criteria.andNameEqualTo(source.getName());
			}
			if(source.getAddperson()!=null && source.getAddperson().trim().length()>0){
				criteria.andAddpersonEqualTo(source.getAddperson());
			}
			if(source.getSort()!=null && source.getSort()>0){
				criteria.andAddpersonEqualTo(source.getAddperson());
			}
		}
	}
	public SourceMapper getSourceMapper() {
		return sourceMapper;
	}
	public void setSourceMapper(SourceMapper sourceMapper) {
		this.sourceMapper = sourceMapper;
	}
	public InfoService getInfoService() {
		return infoService;
	}
	public void setInfoService(InfoService infoService) {
		this.infoService = infoService;
	}
	
}
