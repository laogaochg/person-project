<!DOCTYPE html>
<html lang="en">
<head>
<#include "../../common/baseImport.ftl" />
</head>
<body>
<#include "../../common/left_mune.ftl" />
<style>
    .modal-dialog{
        width: 70%;
        height: 70%;
    }
</style>
<script type="text/javascript">
    $(function(){
        $("#editCertificateButton").click(function(){
            $.ajax({
                type: "POST",
                url: "${context.contextPath}/certificate/editCertificate",
                data: $("#editCertificate").serialize(),
                success: function(data) {
                    if(data.code==200) {
                        myModal("myModalTest","成功",data.msg,function() {
                            window.location.href="${context.contextPath}/certificate/list";
                        });
                    } else {
                        myModal("myModalTest","失败",data.msg,function() {
                            location.reload();
                        });
                    }
                },error: function(data) {
                    myModal("myModalTest","失败",data.msg,function() {
                        location.reload();
                    });
                }
            });
        });
    })
</script>
<#include "../../common/ModalLabel.ftl" />
<div class="container rightContent">
    <div class="row">
        <div class="col-md-5">
            <form method="post" id="editCertificate">
                证书信息<br/>
                <input name="id" type="hidden" value="${(certificate.id)!""}">
                名字<input name="name" value="${(certificate.name)!""}" class="form-control"><br/>
            <#if goodCategories??  && (goodCategories?size > 0)>
                类目：
                <#list goodCategories as g>
                    <label class="checkbox-inline">
                        <input type="checkbox" checked="checked" name="goodCategoryIds" value="${g.categoryId}"> ${g.categoryName}
                    </label>
                </#list>
                <br/>
            </#if>
                备注<input name="remark" class="form-control"  value="${(certificate.remark)!""}" ><br/>
                <button id="editCertificateButton" type="button" class="btn btn-success">提交</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
