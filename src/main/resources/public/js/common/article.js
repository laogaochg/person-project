layui.use(['form', 'layer','element','layedit', 'laydate','upload'], function(){
		  var $ = layui.jquery, form = layui.form(),
		  
           layer = layui.layer,
           layedit = layui.layedit,
  			laydate = layui.laydate;
           
          //面包屑
           var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
		  //监听导航点击
		  element.on('nav(demo)', function(elem){
		    //console.log(elem)
		    layer.msg(elem.text());
		  });
		 //表单
		 //创建一个编辑器
		  layedit.set({
			  uploadImage: {
			    url: '/article/ims' 
			    ,type: 'post' //默认post
			  }
			});
		  var editIndex = layedit.build('LAY_demo_editor');
  		　//自定义验证规则
  		　form.verify({
		    title: function(value){
		      if(value.length < 5){
		        return '标题至少得5个字符啊';
		      }
		    }
		    ,pass: [/(.+){6,12}$/, '密码必须6到12位']
		    ,content: function(value){
		      layedit.sync(editIndex);
		    }
		  });
  
		  //监听指定开关
		  form.on('switch(switchTest)', function(data){
		    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
		      offset: '6px'
		    });
		    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
		  });
  
		  //监听提交
		  form.on('submit(demo1)', function(data){
		    layer.alert(JSON.stringify(data.field), {
		      title: '最终的提交信息'
		    })
		    return false;
		  });
		  // 上传文件
		   layui.upload({
		    url: '/article/ims'  
		    ,success: function(res){ //上传成功后的回调
		      console.log(res)
		      var src=res.data.src;
		      var imgbox= $('.img-box img');
		      console.log(src);
		      console.log(imgbox);
		      imgbox.attr('src',src);
		    }
		  });
		  layui.upload({
		    url: '/article/ims'
		    ,elem: '#test' //指定原始元素，默认直接查找class="layui-upload-file"
		    ,method: 'get' //上传接口的http类型
		    ,success: function(res){
		      LAY_demo_upload.src = res.url;
		    }
		  });
				 
		});  
  
					document.getElementById('sel').onclick = function(){
				document.getElementById('fixed').style.display = 'block';
		
			}
		
			document.getElementById('close_fixed').onclick = function	(){
				document.getElementById('fixed').style.display = 'none';
			}
	
