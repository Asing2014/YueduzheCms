<!doctype html>
<html lang="en"><head>
    <meta charset="utf-8">
    <title>管理后台</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" type="text/css" href="lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="lib/font-awesome/css/font-awesome.css">

    <script src="lib/jquery-1.11.1.min.js" type="text/javascript"></script>

    

    <link rel="stylesheet" type="text/css" href="stylesheets/theme.css">
    <link rel="stylesheet" type="text/css" href="stylesheets/premium.css">

    <script type="text/javascript">
        //跳转到删除过程
        function DeleteItemGoto(id){
          window.location.href="./delete_article.php?type=<{$type}>&id=" + id;
        }
    </script>

</head>
<body class=" theme-blue">

    <!-- Demo page code -->

    <script type="text/javascript">
        $(function() {
            var match = document.cookie.match(new RegExp('color=([^;]+)'));
            if(match) var color = match[1];
            if(color) {
                $('body').removeClass(function (index, css) {
                    return (css.match (/\btheme-\S+/g) || []).join(' ')
                })
                $('body').addClass('theme-' + color);
            }

            $('[data-popover="true"]').popover({html:true});
            
        });
    </script>
    <style type="text/css">
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .navbar-default .navbar-brand, .navbar-default .navbar-brand:hover { 
            color: #fff;
        }
    </style>

    <script type="text/javascript">
        $(function() {
            var uls = $('.sidebar-nav > ul > *').clone();
            uls.addClass('visible-xs');
            $('#main-menu').append(uls.clone());
        });
    </script>

    

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
  

  <!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
  <!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
  <!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
  <!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
  <!--[if (gt IE 9)|!(IE)]><!--> 
   
  <!--<![endif]-->

    <div class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="" href="index.html"><span class="navbar-brand"><span class="fa fa-paper-plane"></span> 鑫锐和网站系统管理后台</span></a></div>
        <#include 'right.ftl'/>
      </div>
    </div>
    
    <div class="sidebar-nav">
    <ul>
    <li><a href="#" data-target=".dashboard-menu" class="nav-header" data-toggle="collapse">
          <i class="fa fa-fw fa-dashboard"></i>工作主面板<i class="fa fa-collapse"></i>
        </a>
    </li>
    <li><ul class="dashboard-menu nav nav-list collapse in">
            <#include "left.ftl">
        </ul>
  </li>
    </div>

    <div class="content">
        <div class="header">
            
            <h1 class="page-title"><{$title}></h1>
                    <ul class="breadcrumb">
            <li><a href="index.php">主页</a> </li>
            <li><a href="view_article.php?type=<{$type}>"><{$title}></a> </li>
            <li class="active">设置</li>
        </ul>

        </div>
        <div class="main-content">
            
<ul class="nav nav-tabs">
  <li class="active"><a href="#list" data-toggle="tab">列表</a></li>
  <li><a href="#add" data-toggle="tab">添加</a></li>
</ul>


<div class="row">
  <div class="col-md-8" style="padding:0 2">
    <br>
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane fade " id="add">
        <form id="tab" action="addarticle.php" method="post">
            <input type="hidden" value="<{$type}>" name="type"/>
            <div class="form-group">
            <label>标题</label>
            <input type="text" value="" class="form-control" name="title">
            </div>
            <div class="form-group">
              <label>描述</label>
              <textarea  rows="3" class="form-control" name="description"></textarea>
            </div>
            <div class="form-group">
            <label>图片链接</label>
            <input type="text" value="" class="form-control" name="image_url">
            </div>
            <div class="form-group">
            <label>内容链接</label>
            <input type="text" value="" class="form-control" name="url">
            </div>
        

            <div class="btn-toolbar list-toolbar">
              <button class="btn btn-primary"><i class="fa fa-save"></i> 保存</button>
            </div>
        </form>
  </div>

  <div class="tab-pane active in" id="list">

  <table class="table" width="">
  <thead>
    <tr>
      <th>序号</th>
      <th>标题</th>
      <th >描述</th>
      <th >图片链接</th>
      <th >网页链接</th>
      <th style="width: 20em;"></th>
    </tr>
  </thead>
  <tbody>
    <{foreach $list as $index =>$item }>
    <tr>
      <td><{$index +1}></td>
      <td><{$item['title']}></td>
      <td><{$item['description']}></td>
      <td><{$item['image_url']}></td>
      <td><{$item['url']}></td>
      <td>
          <a href="edit_article.php?type=<{$type}>&id=<{$item['id']}>"><i class="fa fa-pencil">编辑</i></a>
          <a href="#myModal_<{$item['id']}>" role="button" data-toggle="modal"><i class="fa fa-trash-o">删除</i></a>
          <{if $manager and $item['state'] eq 0}>
          <a href="confirm.php?value=1&type=<{$type}>&id=<{$item['id']}>" role="button" data-toggle="modal">确认修改</a>
          <{/if}>
          <{if $manager and $item['state'] eq 1}>
          <a href="confirm.php?value=0&type=<{$type}>&id=<{$item['id']}>" role="button" data-toggle="modal">取消修改</a>
          <{/if}>
          <div class="modal small fade" id="myModal_<{$item['id']}>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                  <h3 id="myModalLabel">删除确认</h3>
                </div>
                <div class="modal-body">
                  
                  <p class="error-text"><i class="fa fa-warning modal-icon"></i>确定删除该记录？</p>
                </div>
                <div class="modal-footer">
                  <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">取消</button>
                  <button class="btn btn-danger" data-dismiss="modal" onclick="DeleteItemGoto(<{$item['id']}>)">确认</button>
                </div>
              </div>
            </div>
          </div>
      </td>
    </tr>
    <{/foreach}>
  </tbody>
</table>
      </div>
</div>


            <footer>
                <hr>
                <p class="pull-right"><a href="#" target="_blank"></a><a href="#" target="_blank"></a></p>
                <p>© 2014 <a href="#" target="_blank">鑫锐和</a></p>
            </footer>
        </div>
    </div>


    <script src="lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
    </script>
    
  
</body></html>
