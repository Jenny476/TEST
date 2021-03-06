
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>广告图片上传</title>
    <link rel="stylesheet" href="../static/layui/css/layui.css">
</head>
<body>
<table>
    <tr>
        <td>用户账号：</td>
        <td><select name="city" lay-verify="" lay-search>
<c:forEach items="${list}" var="users">
            <option>${users.phone}</option>
</c:forEach>
        </select> </td>
    </tr>
    <tr>
        <td>图片：</td>
        <td>
        <div class="layui-upload">
             <button class="layui-btn" id="upimage" type="button">上传图片</button>
             <div class="layui-upload-list">
                <img class="layui-upload-img" id="demo1">
                 <p id="demoText"></p>
             </div>
        </div>
        </td>
    </tr>
</table>
<script>
    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#upimage'
            , url: 'https://httpbin.org/post' //改成您自己的上传接口
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });

    })
</script>
</body>
</html>
