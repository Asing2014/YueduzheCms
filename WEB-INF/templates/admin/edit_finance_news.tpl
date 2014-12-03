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

        <div class="navbar-collapse collapse" style="height: 1px;">
          <ul id="main-menu" class="nav navbar-nav navbar-right">
            <li class="dropdown hidden-xs">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-user padding-right-small" style="position:relative;top: 3px;"></span> 小鑫
                    <i class="fa fa-caret-down"></i>
                </a>

              <ul class="dropdown-menu">
                <li><a href="./">修改密码</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="sign-in.html">退出</a></li>
              </ul>
            </li>
          </ul>

        </div>
      </div>
    </div>
    
    <div class="sidebar-nav">
    <ul>
    <li><a href="#" data-target=".dashboard-menu" class="nav-header" data-toggle="collapse">
          <i class="fa fa-fw fa-dashboard"></i>工作主面板<i class="fa fa-collapse"></i>
        </a>
    </li>
    <li><ul class="dashboard-menu nav nav-list collapse in">
            <li><a href="view_article.php?type=5"><span class="fa fa-caret-right"></span>鑫品上市</a></li>
            <li ><a href="view.php?type=2"><span class="fa fa-caret-right"></span>火爆热销</a></li>
            <li ><a href="view_article.php?type=4"><span class="fa fa-caret-right"></span> 金融快讯</a></li>
            <li ><a href="view.php?type=3"><span class="fa fa-caret-right"></span> 了解品牌</a></li>
            <li ><a href="view.php?type=1"><span class="fa fa-caret-right"></span> 合作企业</a></li>
        </ul>
  </li>
    </div>

    <div class="content">
        <div class="header">
            
            <h1 class="page-title"><{$title}></h1>
            <ul class="breadcrumb">
                <li><a href="index.php">主页</a> </li>
                <li><a href="view_article.php?type=<{$type}>"><{$title}></a> </li>
                <li class="active">编辑</li>
            </ul>

        </div>
        <div class="main-content">
            
<ul class="nav nav-tabs">
  <li  class="active"><a href="#edit" data-toggle="tab">编辑</a></li>
</ul>


<div class="row">
  <div class="col-md-8" style="padding:0 2">
    <br>
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane active in " id="edit">
        <form id="tab" action="save_article.php" method="post">
            <input type="hidden" value="<{$type}>" name="type"/>
            <input type="hidden" value="<{$item['id']}>" name="id"/>
            <div class="form-group">
            <label>标题</label>
            <input type="text" value="<{$item['title']}>" class="form-control" name="title">
            </div>
            <div class="form-group">
              <label>描述</label>
              <textarea  rows="3" class="form-control" name="description" value=""><{$item['description']}></textarea>
            </div>
            <div class="form-group">
            <label>图片链接</label>
            <input type="text" value="<{$item['image_url']}>" class="form-control" name="image_url">
            </div>
            <div class="form-group">
            <label>内容链接</label>
            <input type="text" value="<{$item['url']}>" class="form-control" name="url">
            </div>
        

            <div class="btn-toolbar list-toolbar">
              <button class="btn btn-primary"><i class="fa fa-save"></i> 保存</button>
            </div>
        </form>
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
