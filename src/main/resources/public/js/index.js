layui.use(['form','laypage', 'layer','laydate','element'], function(){
		  var $ = layui.jquery, form = layui.form();
		  var laypage = layui.laypage
		  laydate = layui.laydate
           ,layer = layui.layer;
           //分页
           laypage({
		    cont: 'demo2'
		    ,pages: 100
		    ,skin: '#1E9FFF'
		    ,first: 1
		    ,last: 100
		    ,prev: '<em class="iconfont icon-zuo"></em>'
		    ,next: '<em class="iconfont icon-you-copy"></em>'
		  	,jump: function(obj, first){
		      if(!first){
		        layer.msg('第 '+ obj.curr +' 页');
		      }
    }		,skip: true
		  });
           laypage({
		    cont: 'demo3'
		    ,pages: 100
		    ,skin: '#1E9FFF'
		    ,first: 1
		    ,last: 100
		    ,prev: '<em class="iconfont icon-zuo"></em>'
		    ,next: '<em class="iconfont icon-you-copy"></em>'
		  	,jump: function(obj, first){
		      if(!first){
		        layer.msg('第 '+ obj.curr +' 页');
		      }
    }		,skip: true
		  });
           laypage({
		    cont: 'demo4'
		    ,pages: 100
		    ,skin: '#1E9FFF'
		    ,first: 1
		    ,last: 100
		    ,prev: '<em class="iconfont icon-zuo"></em>'
		    ,next: '<em class="iconfont icon-you-copy"></em>'
		  	,jump: function(obj, first){
		      if(!first){
		        layer.msg('第 '+ obj.curr +' 页');
		      }
    }		,skip: true
		  });
           laypage({
		    cont: 'demo5'
		    ,pages: 100
		    ,skin: '#1E9FFF'
		    ,first: 1
		    ,last: 100
		    ,prev: '<em class="iconfont icon-zuo"></em>'
		    ,next: '<em class="iconfont icon-you-copy"></em>'
		  	,jump: function(obj, first){
		      if(!first){
		        layer.msg('第 '+ obj.curr +' 页');
		      }
    }		,skip: true
		  });
          //面包屑
           var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
		  //监听导航点击
		  element.on('nav(demo)', function(elem){
		    //console.log(elem)
		    layer.msg(elem.text());
		  });
		  //全选
		  form.on('checkbox(allChoose)', function(data){
		    var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
		    child.each(function(index, item){
		      item.checked = data.elem.checked;
		    });
		    form.render('checkbox');
		  });
		  // 表单
		  // 日历
		   var start = {
		    min: laydate.now()
		    ,max: '2099-06-16 23:59:59'
		    ,istoday: false
		    ,choose: function(datas){
		      end.min = datas; //开始日选好后，重置结束日的最小日期
		      end.start = datas //将结束日的初始值设定为开始日
		    }
		  };
  
  			var end = {
		    min: laydate.now()
		    ,max: '2099-06-16 23:59:59'
		    ,istoday: false
		    ,choose: function(datas){
		      start.max = datas; //结束日选好后，重置开始日的最大日期
		    }
		  };
  
		  document.getElementById('LAY_demorange_s').onclick = function(){
		    start.elem = this;
		    laydate(start);
		  }
		  document.getElementById('LAY_demorange_e').onclick = function(){
		    end.elem = this
		    laydate(end);
		  }
		  
		});  
  