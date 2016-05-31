package cn.freeteam.action;

import cn.freeteam.base.BaseAction;
import cn.freeteam.model.Dota;
import cn.freeteam.service.DotaService;

public class DotaAction extends BaseAction {
	private DotaService dotaService;
    private Dota dota;
    private String ids;
    public DotaAction() {
    	//初始化service对象可以使用init()方法
		init("dotaService");
	}
	public String add(){
		if(dota==null){
			dota=new Dota();
			dota.setAge(23);
			dota.setPassword("password");
			dota.setUsername("username");
			dotaService.add(dota);
		}
		return "add";
	}
	public String find(){
		dota=dotaService.findById(ids);
		return "list";
	}
	public DotaService getDotaService() {
		return dotaService;
	}
	public void setDotaService(DotaService dotaService) {
		this.dotaService = dotaService;
	}
	public Dota getDota() {
		return dota;
	}
	public void setDota(Dota dota) {
		this.dota = dota;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}
}
