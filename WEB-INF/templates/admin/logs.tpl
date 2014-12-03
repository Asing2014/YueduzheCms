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
          <a class="" href="index.html"><span class="navbar-brand"><span class="fa fa-paper-plane"></span> 鑫锐和微信管理后台</span></a></div>

        <{include file='admin/right.tpl'}>
      </div>
    </div>
    
    <div class="sidebar-nav">
    <ul>
    <li><a href="#" data-target=".dashboard-menu" class="nav-header" data-toggle="collapse">
          <i class="fa fa-fw fa-dashboard"></i>工作主面板<i class="fa fa-collapse"></i>
        </a>
    </li>
    <li><ul class="dashboard-menu nav nav-list collapse in">
            <{include file="admin/left.tpl"}>
        </ul>
  </li>
    </div>

    <div class="content">
        <div class="header">
            
            <h1 class="page-title">操作日志</h1>
                    <ul class="breadcrumb">
            <li><a href="index.php">主页</a> </li>
            <li><a href="logs.php">操作日志</a> </li>
            <li class="active">查看</li>
        </ul>

        </div>
        <div class="main-content">
            
<ul class="nav nav-tabs">
  <li class="active"><a href="#list" data-toggle="tab">列表</a></li>
  
</ul>


<div class="row">
  <div class="col-md-8" style="padding:0 2">
    <br>
    <div id="myTabContent" class="tab-content">
      
  <div class="tab-pane active in" id="list">

  <table class="table" width="">
  <thead>
    <tr>
      <th>序号</th>
      <th>操作人</th>
      <th >操作内容</th>
      <th >操作时间</th>
    </tr>
  </thead>
  <tbody>
    <{foreach $list as $index =>$item }>
    <tr>
      <td><{$index +1}></td>
      <td><{$item['user_name']}></td>
      <td><{$item['more']}></td>
      <td><{$item['create_time']}></td>
    </tr>
    <{/foreach}>
  </tbody>
</table>
<a href="?page=<{$page-1}>">上一页</a>
<a href="?page=<{$page+1}>">下一页</a>
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
