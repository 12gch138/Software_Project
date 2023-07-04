<%@ page language="java" import="java.util.*,java.sql.*" 
contentType="text/html; charset=utf-8"
%>
<%@include file="./Const.jsp" %>
<!DOCTYPE html>
 
<head>
    <meta charset="utf-8">
    <title> 搜索结果 </title>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_1309180_m0vigzfu7y.css">
    <style type="text/css">
        .bod1 {
            /*background: -webkit-linear-gradient(to right, #f7797d, #FBD786, #C6FFDD);*/
            /*background-image: url(" 2558.jpg");*/
            /*background-size:cover;*/
            background: #aa4b6b;
            /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #3b8d99, #6b6b83, #aa4b6b);
            /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #3b8d99, #6b6b83, #aa4b6b);
            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
 
 
        }
        .content { 
            margin: 20px; 
            padding: 20px;
            background-color: rgba(255,255,255,0.8); 
            border-radius: 15px; 
            font-family: "Microsoft YaHei UI Light";
            flex: 1 0 auto;
        }
        
        table {
            width: 50%;
            border: 1px solid white;
            background-color: #bce774;
            margin: 0 auto;
            border-collapse: collapse;
        }

        td {
            height: 50px;
            border: 1px solid white;
            text-align: center;
            vertical-align: center;
            color:rgb(122, 144, 166);
        }

        tbody tr:nth-child(even) {
            background-color: #e5f1f4;
        }
        .arrow{
            border: 9px solid transparent;
            border-bottom-color: #3DA0DB;
            width: 0px;
            height: 0px;
            top:0px
        }
        .stick{
            width: 8px;
            height: 14px;
            border-radius: 1px;
            background-color: #3DA0DB;
            top:15px;
        }
        #back_top div{
            position: absolute;
            margin: auto;
            right: 0px;
            left: 0px;
        }
        #back_top{
            background-color: #dddddd;
            height: 38px;
            width: 38px;
            border-radius: 3px;
            display: block;
            cursor: pointer;
            position: fixed;
            right: 50px;
            bottom: 100px;
            display: none;
        }
    </style>
</head>
 
<body class = "bod1">
    <div class="content">
        <h1>详情：</h1>  
        <table>
            <%
            request.setCharacterEncoding("utf-8");
	        String msg ="";
            try{
                String drug_ID = request.getParameter("drug_ID");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection(connectString, dbuser, dbpwd);
                Statement stmt=con.createStatement();
                ResultSet rs=stmt.executeQuery("select * from warehouse where 药品编号 = " + drug_ID + ";");
                while(rs.next()){ 
            %>
                <tr>
                    <td> 药品编号 </td>
                    <td><%=rs.getString("药品编号")%></td>
                </tr>
                <tr>
                    <td> 药品名称 </td>
                    <td><%=rs.getString("药品名称")%></td>
                </tr>
                <tr>
                    <td> 供应商名称 </td>
                    <td><%=rs.getString("供应商名称")%></td>
                </tr>
                <tr>
                    <td> 生产批号 </td>
                    <td><%=rs.getString("生产批号")%></td>
                </tr>
                <tr>
                    <td> 产地 </td>
                    <td><%=rs.getString("产地")%></td>
                </tr>
                <tr>
                    <td> 进价 </td>
                    <td><%=rs.getString("进价")%></td>
                </tr>
                <tr>
                    <td> 会员折扣 </td>
                    <td><%=rs.getString("会员折扣")%></td>
                </tr>
                <tr>
                    <td> 库存 </td>
                    <td><%=rs.getString("库存")%></td>
                </tr>
                <tr>
                    <td> 包装规格 </td>
                    <td><%=rs.getString("包装规格")%></td>
                </tr>
                <tr>
                    <td> 生产日期 </td>
                    <td><%=rs.getString("生产日期")%></td>
                </tr>
                <tr>
                    <td> 有效期 </td>
                    <td><%=rs.getString("有效期")%></td>
                </tr>
          <%}	    
            rs.close();
            stmt.close();
            con.close();
          }
          catch (Exception e){
            msg = e.getMessage();
          }
            %>
        </table>
    </div>
    <div id="back_top">
        <div class="arrow"></div>
        <div class="stick"></div>
    </div>
<script src="http://cdn.staticfile.org/jquery/1.11.1-rc2/jquery.min.js"></script>
<script>
$(function(){

    $(window).scroll(function(){  //只要窗口滚动,就触发下面代码

        var scrollt = document.documentElement.scrollTop + document.body.scrollTop; //获取滚动后的高度

        if( scrollt >200 ){  //判断滚动后高度超过200px,就显示

            $("#back_top").fadeIn(400); //淡入

        }else{

            $("#back_top").stop().fadeOut(400); //如果返回或者没有超过,就淡出.必须加上stop()停止之前动画,否则会出现闪动

        }

    });

    $("#back_top").click(function(){ //当点击标签的时候,使用animate在200毫秒的时间内,滚到顶部

        $("html,body").animate({scrollTop:"0px"},200);

    }); 

});
</script>
</body>
 
</html>