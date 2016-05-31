package cn.freeteam.service;

import java.util.UUID;

import cn.freeteam.base.BaseService;
import cn.freeteam.dao.DotaMapper;
import cn.freeteam.model.Dota;

public class DotaService extends BaseService {   
	private DotaMapper dotaMapper;
	public void setDotaMapper(DotaMapper dotaMapper) {
		this.dotaMapper = dotaMapper;
	}
	public DotaMapper getDotaMapper() {
		return dotaMapper;
	}
	public DotaService() {
		//初始化mapper对象可以使用initMapper()方法。
		initMapper("dotaMapper");
	}
	/**
	 *添加
	 */
	public int add(Dota dota){
		dota.setId(UUID.randomUUID().toString());
		System.out.println("uuid:"+UUID.randomUUID().toString());
		dotaMapper.insert(dota);
		DBCommit();
		System.out.println(dota.getId());
		return 11;
	}
	/**
	 * 查询
	 * @param id
	 */
	public Dota findById(String id){
		return dotaMapper.selectByPrimaryKey(id);
	}
}
