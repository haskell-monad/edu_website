// JavaScript Document
define(function (require, exports, modules) {
    var $ = require("jquery");
		var cLianDong=[
		{
			name:'所属行业', num: '001', child: [
				{name:'选择分类', num:'001'}
			]
		},
		{
			name:'工程咨询', num: '002', child: 
			[
				{name:'招标投标', num: '001'},
				{name:'工程咨询', num: '002'}
			]
		},
		{
			name:'工程设计', num: '003', child: 
			[
				{name:'建筑设计', num: '001'},
				{name:'规划设计', num: '002'},
				{name:'室内设计', num: '003'}
			]
		},
		{
			name:'工程造价', num: '004', child: 
			[
				{name:'土建工程', num: '001'},
				{name:'安装工程', num: '002'},
				{name:'市政工程', num: '003'},
				{name:'装修工程', num: '004'},
				{name:'园林工程', num: '005'}
			]
		},
		{
			name:'工程施工', num: '005', child: 
			[
				{name:'建筑工程', num: '001'},
				{name:'土木工程', num: '002'},
				{name:'市政工程', num: '003'},
				{name:'其它工程', num: '003'}
			]
		},
		{
			name:'工程监理', num: '006', child: 
			[
				{name:'房屋建筑', num: '001'},
				{name:'冶金矿山', num: '002'},
				{name:'石油化工', num: '003'},
				{name:'水利水电', num: '004'},
				{name:'电力工程', num: '005'},
				{name:'农林工程', num: '006'},
				{name:'铁路公路', num: '007'},
				{name:'港口航道', num: '008'},
				{name:'航天航空', num: '009'},
				{name:'通信机电', num: '010'},
				{name:'市政公用', num: '011'}
			]
		},
		{
			name:'工程质量检测', num: '007', child: 
			[
				{name:'地基基础', num: '001'},
				{name:'主体结构', num: '002'},
				{name:'建筑幕墙', num: '003'},
				{name:'建筑节能', num: '004'},
				{name:'室内环境', num: '005'},
				{name:'设备安装', num: '006'},
				{name:'建筑智能', num: '007'},
				{name:'砼料预拌', num: '008'},
				{name:'见证取样', num: '009'}
			]
		},
		{
			name:'材料设备', num: '008', child: 
			[
				{name:'设备设施', num: '001'},
				{name:'建筑材料', num: '002'}
			]
		},
		{
			name:'建筑院校', num: '009', child: 
			[
				{name:'中国院校', num: '001'},
				{name:'外国院校', num: '002'}
			]
		}
		
	];


	var cProvince=[
		{name:'选择省份', num: '000', child:[
			{name:'选择城市', num:'000'}
		]},
		
		{name:'北京', num: '001'},
		{name:'上海', num: '002'},
		{name:'天津', num: '003'},
		{name:'河北', num: '004', child:[
			{name:'石家庄', num: '001'},
			{name:'沧州', num: '002'},
			{name:'邯郸', num: '003'}
		]},
		{name:'河南', num: '005', child:[
			{name:'郑州', num: '001'},
			{name:'洛阳', num: '002'},
			{name:'开封', num: '003'},
			{name:'安阳', num: '004'}
		]}
	];

	$(document).ready(function(){
		var $HY = $('#cHy');
		var $FL = $('#cFl');
		var $SH = $('#cProvince');
		var $CS = $('#cCity');
		
		function setSelect(obj, obj2, sVar)
		{
			$.each(sVar, function(index, ele){
				obj.get(0).options.add(new Option(ele.name, ele.num));
			})
			setSubSelect(obj.get(0).selectedIndex, obj2, sVar)
		}
		
		function setSubSelect(n, obj2, sVar)
		{
			if(sVar[n].child)
			{
				obj2.show();
				obj2.empty('');
				$.each(sVar[n].child, function(index1, ele1){
					obj2.get(0).options.add(new Option(ele1.name, ele1.num));
				})
			}
			else
			{
				obj2.hide();
			}
		}
		
		setSelect($HY, $FL, cLianDong);
		setSelect($SH, $CS, cProvince)
		
		$HY.bind('change', function(){
			setSubSelect($(this).get(0).selectedIndex, $FL, cLianDong);
		})
		$FL.bind('change', function(){
			var $this = $(this).get(0);
			var s = $HY.get(0).options[$HY.get(0).selectedIndex].text;
			if(s == '建筑院校' && $this.options[$this.selectedIndex].text == '外国院校')
			{
				$SH.empty();
				$SH.get(0).options.add(new Option('无', '000'));
				$CS.hide();
			}
			else
			{
				$SH.empty();
				$CS.show()
				setSelect($SH, $CS, cProvince)
			}
		})
		$SH.bind('change', function(){
			setSubSelect($(this).get(0).selectedIndex, $CS, cProvince);
		})
	})

})