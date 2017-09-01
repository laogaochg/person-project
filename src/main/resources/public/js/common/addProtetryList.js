/**
 * Created by Administrator on 2017/8/3.
 */
//点击删除属性值  mubiao是删除按钮的前一个input框
function deleProValue(obj,mubiao) {
    obj.prev(mubiao).remove();
}

//点击添加属性值的封装
function addProValue(obj,fa1,jiahao) {
    console.log(obj.parent(".comPro"));
    var btnHtml='';
    btnHtml=' <input type="text" class="input-text comInput" placeholder="如蓝色">'
    obj.parents(fa1).find(jiahao).before(btnHtml);
}



//点击增加属性
function addPro(obj) {
    var html='';

    html='<div class="comPro clearfix">';
    html +=' <div class="fl mr20">';
    html +=' <span class="proName">名称1</span>';
    html+='  <input type="text" class="input-text comInput" placeholder="如蓝色">';
    html+='</div>';
    html+='<div>';
    html+='<span class="proName">属性值</span>';
    html+=' <input type="text" class="input-text comInput" placeholder="如蓝色">';
    html+=' <input type="text" class="input-text comInput" placeholder="如蓝色">';
    html+=' <input type="text" class="input-text comInput" placeholder="如蓝色">';
    html+='  <i class="iconfont icon-jianhao" onclick="deleProValue($(this),\'.comInput\')"></i>';
    html+='<div class="comProBtn inlineBlock">';
    html+=' <button type="button" class="layui-btn layui-btn-normal changeBtn addProValue" onclick="addProValue($(this),\'.comPro\',\'.icon-jianhao\')">';
    html+=' <i class="iconfont icon-jia"></i>添加属性值';
    html+='</button>';
    html+='</div>';
    html+='</div>';
    html+='</div>';
    obj.append(html);   //追加到父级
}