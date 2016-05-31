package cn.freeteam.cms.service;

import java.util.List;

import cn.freeteam.base.BaseService;
import cn.freeteam.cms.dao.InnerlinkMapper;
import cn.freeteam.cms.model.Info;
import cn.freeteam.cms.model.InfoExample;
import cn.freeteam.cms.model.Innerlink;
import cn.freeteam.cms.model.InnerlinkExample;
import cn.freeteam.cms.model.InnerlinkExample.Criteria;
public class InnerlinkService extends BaseService{

	private InnerlinkMapper innerlinkMapper;
	public InnerlinkService(){
		initMapper("innerlinkMapper");
	}
	
	/**
	 * 添加内链
	 * @param source
	 * @return
	 */
	public void insert(Innerlink innerlink){
		if (innerlink!=null) {
			innerlinkMapper.insert(innerlink);
			DBCommit();
		}
	}
	/**
	 * 更新内链信息
	 * @param innerlink
	 */
	public void update(Innerlink innerlink){
		innerlinkMapper.updateByPrimaryKey(innerlink);
		DBCommit();
	}
	/**
	 * 根据id查询内链
	 * @param id
	 * @return
	 */
	public Innerlink findById(int id){
		return innerlinkMapper.selectByPrimaryKey(id);
	}
	/**
	 * 根据name查询内链
	 * @param name
	 * @return
	 */
	public Innerlink findByName(String name){
		return innerlinkMapper.selectByName(name);
	}
	/**
	 * 查询出所有的内链
	 * @param Innerlink
	 * @param order
	 * @return
	 */
	public List<Innerlink> findAll(Innerlink innerlink,String order){
		InnerlinkExample example=new InnerlinkExample();
		Criteria criteria=example.createCriteria();
		proSearchParam(innerlink, criteria);
		if (order!=null && order.trim().length()>0) {
			example.setOrderByClause(order);
		}
		return innerlinkMapper.selectByExample(example);
	}
	/**
	 * 查询出所有的内链
	 * @return
	 */
	public List<Innerlink> findAllInnerLink(){
		return innerlinkMapper.findAllInnerLink();
	}
	/**
	 * 分页查询
	 * @param innerlink
	 * @param order
	 * @param currPage
	 * @param pageSize
	 * @return
	 */
	public List<Innerlink> findByPage(Innerlink innerlink,String order,int currPage,int pageSize){
		InnerlinkExample example=new InnerlinkExample();
		Criteria criteria=example.createCriteria();
		proSearchParam(innerlink, criteria);
		if (order!=null && order.trim().length()>0) {
			example.setOrderByClause(order);
		}
		example.setCurrPage(currPage);
		example.setPageSize(pageSize);
		return innerlinkMapper.selectPageByExample(example);
	}
	/**
	 * 统计
	 * @param info
	 * @return
	 */
	public int count(Innerlink innerlink){
		InnerlinkExample example=new InnerlinkExample();
		Criteria criteria=example.createCriteria();
		proSearchParam(innerlink, criteria);
		return innerlinkMapper.countByExample(example);
	}
	/**
	 * 处理查询条件
	 * @param 
	 * @param criteria
	 */
	public void proSearchParam(Innerlink innerlink,Criteria criteria){
		if(innerlink!=null){
			if(innerlink.getId()!=null && innerlink.getId()>0){
				criteria.andIdEqualTo(innerlink.getId());
			}
			if(innerlink.getName()!=null && innerlink.getName().trim().length()>0){
				criteria.andNameEqualTo(innerlink.getName());
			}
			if(innerlink.getCreateperson()!=null && innerlink.getCreateperson().trim().length()>0){
				criteria.andCreatepersonEqualTo(innerlink.getCreateperson());
			}
			if(innerlink.getUrl()!=null && innerlink.getUrl().trim().length()>0){
				criteria.andUrlEqualTo(innerlink.getUrl());
			}
		}
	}
	/**
	 * 删除内链
	 * @return
	 */
	public void del(int id){
		innerlinkMapper.deleteByPrimaryKey(id);
		DBCommit();
	}
	
	
	
	
	public InnerlinkMapper getInnerlinkMapper() {
		return innerlinkMapper;
	}
	public void setInnerlinkMapper(InnerlinkMapper innerlinkMapper) {
		this.innerlinkMapper = innerlinkMapper;
	}
}
