/**
 * Created by Administrator on 2017/7/19.
 */
layui.use('laydate', function(){
    var laydate = layui.laydate;

    var start = {
        min: laydate.now(-2095)
        ,max: '2099-06-16 23:59:59'
        ,istoday: true
        ,choose: function(datas){
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };

    var end = {
        min: laydate.now(-2095)
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

/*---------------   layui中编辑器中的图片上传     -------------------*/
layui.use('upload', function(){
    layui.upload({
        url: '' //上传接口
        ,success: function(res){ //上传成功后的回调
            console.log(res)
        }
    });

    layui.upload({
        url: '/test/upload.json'
        ,elem: '#test' //指定原始元素，默认直接查找class="layui-upload-file"
        ,method: 'get' //上传接口的http类型
        ,success: function(res){
            LAY_demo_upload.src = res.url;
        }
    });
});
