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
        
        table, td{
            font:100% Arial, Helvetica, sans-serif; 
        }
        table{width:100%;border-collapse:collapse;margin:1em 0;}
        th, td{text-align:left;padding:.5em;border:1px solid #fff;}
        th{background:#328aa4 url(tr_back.gif) repeat-x;color:#f1f0f0;}
        td{background:#e5f1f4; color:rgb(122, 144, 166);}

        /* tablecloth styles */
        tr.even td{background:#e5f1f4;}
        tr.odd td{background:#f8fbfc;}
        
        th.over, tr.even th.over, tr.odd th.over{background:#4a98af;}
        th.down, tr.even th.down, tr.odd th.down{background:#bce774;}
        th.selected, tr.even th.selected, tr.odd th.selected{background:#bce774;color:#555;}
        
        td.over, tr.even td.over, tr.odd td.over{background:#ecfbd4;}
        td.down, tr.even td.down, tr.odd td.down{background:#bce774;color:#fff;}
        td.selected, tr.even td.selected, tr.odd td.selected{background:#bce774;color:#555;}

        /* use this if you want to apply different styleing to empty table cells*/
        td.empty, tr.odd td.empty, tr.even td.empty{background:#fff;}
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
        <h1>搜索结果</h1>  
        <table>
            <tr>
                <th>药品编号</th>
                <th>药品名称</th>
                <th>供应商编号</th>
                <th>生产批号</th>
                <th>产地</th>
                <th>类别</th>
              <th>进价</th>
              <th>单价</th>
              <th>会员折扣</th>
              <th>库存</th>
              <th>包装规格</th>
              <th>生产日期</th>
              <th>有效期</td>
              <th>操作</th>
            </tr>
            <%
            request.setCharacterEncoding("utf-8");
	        String msg ="";
            try{
                String searchString = request.getParameter("searchString");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=DriverManager.getConnection(connectString, dbuser, dbpwd);
                Statement stmt=con.createStatement();
                ResultSet rs = stmt.executeQuery("select * from warehouse where 药品名称 like '%"+ searchString +
                        "%' or 供应商名称 like '%" + searchString + "%' or 供应商名称 like '%" + searchString + 
                        "%' or 生产批号 like '%" + searchString + "%' or 产地 like '%" + searchString +
                        "%' or 所属类别 like '%" + searchString + "%';");
                while(rs.next()){ 
                    String drug_ID = rs.getString("药品编号");
            %>
                <tr>
                <td><%=drug_ID%></td>
                <td><%=rs.getString("药品名称")%></td>
                <td><%=rs.getString("供应商名称")%></td>
                <td><%=rs.getString("生产批号")%></td>
                <td><%=rs.getString("产地")%></td>
                <td><%=rs.getString("所属类别")%></td>
                <td><%=rs.getString("进价")%></td>
                <td><%=rs.getString("单价")%></td>
                <td><%=rs.getString("会员折扣")%></td>
                <td><%=rs.getString("库存")%></td>
                <td><%=rs.getString("包装规格")%></td>
                <td><%=rs.getString("生产日期")%></td>
                <td><%=rs.getString("有效期")%></td>
                <td><a href="detail.jsp?drug_ID=<%=drug_ID%>">详情</a>  </td>
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