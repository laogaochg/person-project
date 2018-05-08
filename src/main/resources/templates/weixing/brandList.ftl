<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品列表</title>
</head>
<body>
<#list pageResult.listData as item>
---------------------------------------
<br/>
<p style="font-size: 30px;">名字：${(item.brandName)!""}</p>
<br/>
<p style="font-size: 30px;">说明：${(item.brandDesc)!""}</p>
<br/>
<#list item.imgs as img>
<img style="width: 80%;align-content: center" name="file2img" src="/my${(img)!""}">
</#list>
<br/>
</#list>
<br/>
</body>
</html>