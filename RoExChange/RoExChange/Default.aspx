<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="../bower_components/bootstrap/dist/css/bootstrap.min.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css" />
    <!-- Morris charts -->
    <link rel="stylesheet" href="../bower_components/morris.js/morris.css" />
    <!-- Theme style -->
    <link rel="stylesheet" href="../dist/css/AdminLTE.min.css" />
    <!-- icheck-bootstrap 目前沒用到
    <link rel="stylesheet" href="../icheck-bootstrap-master/icheck-bootstrap.min.css" />
        -->
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="../../plugins/iCheck/all.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../dist/css/skins/_all-skins.min.css" />
    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic" />

    <title>RoExchange</title>
    <script src="../../utils.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
    <style>
        canvas {
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
        }
    </style>
</head>

<body>
    
    <nav class="navbar navbar-default">
        <a class="navbar-brand" href="/Default.aspx">
            <b>RoExchange </b></a>
        <!--
        <ul class="nav navbar-nav" id="exampleAccordion">
            <li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#exampleModal" href ="#">
                    <i class="fa fa-fw fa-sign-in"></i>
                    <span class="nav-link-text">Login</span>
                </a>
            </li>
        </ul>
        -->
    </nav>
    <div class="content">
        <form runat="server">
            <asp:DropDownList runat="server" ID="dl_item_name" AutoPostBack="true" CssClass="btn btn-default dropdown-toggle" Visible="false">
                <asp:ListItem Value="0">請選擇</asp:ListItem>
            </asp:DropDownList>
            <div class="row">
                <div class="col-sm-12">
                    <div class="box box-danger">
                        <div class="box-header">
                            <h3 class="box-title text-bold">卡片</h3>
                            <button type="button" class="btn btn-sm" onclick="goaddnewdata()"><i class="fa fa-pencil-square-o"></i>新增資料</button>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <div class="box-body" id="accordion">
                            <div class="list-group col-sm-1" id="heading">
                                <a href="#" class="text-bold list-group-item list-group-item-warning text-center" data-toggle="collapse" data-target="#collapse_01" aria-expanded="false" aria-controls="collapse_01">武器</a>
                                <a href="#" class="text-bold list-group-item list-group-item-info text-center" data-toggle="collapse" data-target="#collapse_02" aria-expanded="false" aria-controls="collapse_02">副手</a>
                                <a href="#" class="text-bold list-group-item list-group-item-success text-center" data-toggle="collapse" data-target="#collapse_03" aria-expanded="false" aria-controls="collapse_03">盔甲</a>
                                <a href="#" class="text-bold list-group-item list-group-item-danger text-center" data-toggle="collapse" data-target="#collapse_04" aria-expanded="false" aria-controls="collapse_04">披風</a>
                                <a href="#" class="text-bold list-group-item list-group-item-warning text-center" data-toggle="collapse" data-target="#collapse_05" aria-expanded="false" aria-controls="collapse_05">鞋子</a>
                                <a href="#" class="text-bold list-group-item list-group-item-info text-center" data-toggle="collapse" data-target="#collapse_06" aria-expanded="false" aria-controls="collapse_06">飾品</a>
                                <a href="#" class="text-bold list-group-item list-group-item-success text-center" data-toggle="collapse" data-target="#collapse_07" aria-expanded="false" aria-controls="collapse_07">頭部</a>
                            </div>

                            <div class="col-sm-11">
                                <div class="collapse box box-solid box-warning" id="collapse_01" aria-labelledby="heading" data-parent="#accordion">
                                    <div class="box-header text-bold">武器</div>
                                    <asp:CheckBox runat="server" ID="瘋兔卡" Text="瘋兔卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="綠棉蟲卡" Text="綠棉蟲卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="吸血蝙蝠卡" Text="吸血蝙蝠卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="蝗蟲卡" Text="蝗蟲卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="螃蟹卡" Text="螃蟹卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="水母卡" Text="水母卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="哥布靈卡" Text="哥布靈卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="噬人花卡" Text="噬人花卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="白蟻卡" Text="白蟻卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="大嘴鳥蛋卡" Text="大嘴鳥蛋卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="巨石怪卡" Text="巨石怪卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="木乃伊卡" Text="木乃伊卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="妖道卡" Text="妖道卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="邪惡使者卡" Text="邪惡使者卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="浮勒盜蟲卡" Text="浮勒盜蟲卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="重金屬蝗蟲卡" Text="重金屬蝗蟲卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="曼陀羅魔花卡" Text="曼陀羅魔花卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="狼卡" Text="狼卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="邪骸戰士卡" Text="邪骸戰士卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="蜂兵卡" Text="蜂兵卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="彩蝶精靈卡" Text="彩蝶精靈卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="魔鍋蛋卡" Text="魔鍋蛋卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="螞蟻卵卡" Text="螞蟻卵卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="紅蝙蝠卡" Text="紅蝙蝠卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="邪骸獸人卡" Text="邪骸獸人卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="赤蒼蠅卡" Text="赤蒼蠅卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="畢帝特地龍卡" Text="畢帝特地龍卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="犬妖弓箭手卡" Text="犬妖弓箭手卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="暗黑祭司卡" Text="暗黑祭司卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="幽靈弓箭手卡" Text="幽靈弓箭手卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="邪骸浪人卡" Text="邪骸浪人卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="邪靈魔導士卡" Text="邪靈魔導士卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="獸人女戰士卡" Text="獸人女戰士卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="玩具士兵卡" Text="玩具士兵卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="拉鍊熊卡" Text="拉鍊熊卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="封印的伊芙利特卡" Text="封印的伊芙利特卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="搖滾蝗蟲卡" Text="搖滾蝗蟲卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="曼陀羅卡" Text="曼陀羅卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="海葵卡" Text="海葵卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="海神卡" Text="海神卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="弓箭哥布靈卡" Text="弓箭哥布靈卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="噴射哥布靈卡" Text="噴射哥布靈卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="直升機哥布靈卡" Text="直升機哥布靈卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="黑蟻卡" Text="黑蟻卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="沙漠之狼卡" Text="沙漠之狼卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="邪骸士兵卡" Text="邪骸士兵卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="獅鷲獸卡" Text="獅鷲獸卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="米諾斯卡" Text="米諾斯卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="邪骸弓箭手卡" Text="邪骸弓箭手卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="半龍人卡" Text="半龍人卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="顎梟首領卡" Text="顎梟首領卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="顎梟男爵卡" Text="顎梟男爵卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="血腥騎士卡" Text="血腥騎士卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="艾斯恩魔女卡" Text="艾斯恩魔女卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="大本鐘卡" Text="大本鐘卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="魔靈娃娃卡" Text="魔靈娃娃卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="邪骸礦工卡" Text="邪骸礦工卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="海豹寶寶卡" Text="海豹寶寶卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="聖誕夜祝福卡" Text="聖誕夜祝福卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="聖光精靈卡" Text="聖光精靈卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="海盜之王卡" Text="海盜之王卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="哥布靈首領卡" Text="哥布靈首領卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="皮里恩卡" Text="皮里恩卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="阿特羅斯卡" Text="阿特羅斯卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="死靈卡" Text="死靈卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="犬妖首領卡" Text="犬妖首領卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="深淵騎士卡" Text="深淵騎士卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="巴風特卡" Text="巴風特卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="德古拉男爵卡" Text="德古拉男爵卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="蘭特克力斯卡" Text="蘭特克力斯卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="斯佩夏爾卡" Text="斯佩夏爾卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="冰暴騎士卡" Text="冰暴騎士卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                </div>

                                <div class="collapse box box-default box-solid box-info" id="collapse_02" aria-labelledby="headingTwo" data-parent="#accordion">
                                    <div class="box-header text-bold">副手</div>
                                    <asp:CheckBox runat="server" ID="盜蟲卡" Text="盜蟲卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="大腳熊卡" Text="大腳熊卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="僵屍卡" Text="僵屍卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="獸人戰士卡" Text="獸人戰士卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="畢帝特飛龍卡" Text="畢帝特飛龍卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="史汀卡" Text="史汀卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="盜蟲卵卡" Text="盜蟲卵卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="馬克卡" Text="馬克卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="獸人戰士長卡" Text="獸人戰士長卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="卡利斯格卡" Text="卡利斯格卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="安畢斯卡" Text="安畢斯卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="幸福白色季節卡" Text="幸福白色季節卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="枯樹精卡" Text="枯樹精卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="梅納海葵卡" Text="梅納海葵卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="玩偶熊卡" Text="玩偶熊卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="水元素卡" Text="水元素卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="飛龍卡" Text="飛龍卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="毒黃蜂卡" Text="毒黃蜂卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="變異蜈蚣卡" Text="變異蜈蚣卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="飛馬卡" Text="飛馬卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="黑影幽靈卡" Text="黑影幽靈卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="愛麗絲女僕卡" Text="愛麗絲女僕卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="黃金蟲卡" Text="黃金蟲卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="蟻后卡" Text="蟻后卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="草精卡" Text="草精卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                </div>

                                <div class="collapse box box-default box-solid box-success" id="collapse_03" aria-labelledby="headingTwo" data-parent="#accordion">
                                    <div class="box-header text-bold">盔甲</div>
                                    <asp:CheckBox runat="server" ID="波利卡" Text="波利卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="羅達蛙卡" Text="羅達蛙卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="蟲蛹卡" Text="蟲蛹卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="小雞卡" Text="小雞卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="魔法雪熊卡" Text="魔法雪熊卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="艾吉歐蜈蚣卡" Text="艾吉歐蜈蚣卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="野豬卡" Text="野豬卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="土人卡" Text="土人卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="虎蜥人卡" Text="虎蜥人卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="古鐘魔卡" Text="古鐘魔卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="伊特瓢蟲卡" Text="伊特瓢蟲卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="達拉蛙卡" Text="達拉蛙卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="大嘴鳥卡" Text="大嘴鳥卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="惡魔女僕卡" Text="惡魔女僕卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="暗神官卡" Text="暗神官卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="幽靈波利卡" Text="幽靈波利卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="異變魚卡" Text="異變魚卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="帕莎納卡" Text="帕莎納卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="泥人卡" Text="泥人卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="巫婆卡" Text="巫婆卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="阿加波卡" Text="阿加波卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="天使波利卡" Text="天使波利卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="獸人酋長卡" Text="獸人酋長卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="迪塔勒泰晤勒卡" Text="迪塔勒泰晤勒卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="凱美拉卡" Text="凱美拉卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="卡侖卡" Text="卡侖卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                </div>

                                <div class="collapse box box-default box-solid box-danger" id="collapse_04" aria-labelledby="headingTwo" data-parent="#accordion">
                                    <div class="box-header text-bold">披風</div>
                                    <asp:CheckBox runat="server" ID="蛇女伊絲卡" Text="蛇女伊絲卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="傀儡娃娃卡" Text="傀儡娃娃卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="九尾狐卡" Text="九尾狐卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="獸人腐屍卡" Text="獸人腐屍卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="朽魔卡" Text="朽魔卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="白幽靈卡" Text="白幽靈卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="幽靈劍士卡" Text="幽靈劍士卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="小巴風特卡" Text="小巴風特卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="藍瘋兔卡" Text="藍瘋兔卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="蛙王卡" Text="蛙王卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="龍蠅卡" Text="龍蠅卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="流浪之狼卡" Text="流浪之狼卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="獸人嬰兒卡" Text="獸人嬰兒卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="南瓜先生卡" Text="南瓜先生卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="妖君卡" Text="妖君卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="波利之王卡" Text="波利之王卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="獵蠅卡" Text="獵蠅卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="蚯蚓卡" Text="蚯蚓卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="烏賊卡" Text="烏賊卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="麥斯特卡" Text="麥斯特卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="惡魔波利卡" Text="惡魔波利卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                </div>

                                <div class="collapse box box-default box-solid box-warning" id="collapse_05" aria-labelledby="headingTwo" data-parent="#accordion">
                                    <div class="box-header text-bold">鞋子</div>
                                    <asp:CheckBox runat="server" ID="瑪勒盜蟲卡" Text="瑪勒盜蟲卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="蒼蠅卡" Text="蒼蠅卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="冰波利卡" Text="冰波利卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="黑狐卡" Text="黑狐卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="鬼女卡" Text="鬼女卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="狂暴野貓卡" Text="狂暴野貓卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="鐘怪卡" Text="鐘怪卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="甜餅人卡" Text="甜餅人卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="轉轉蛋卡" Text="轉轉蛋卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="綠貝勒斯卡" Text="綠貝勒斯卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="弑神者卡" Text="弑神者卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="木乃伊犬卡" Text="木乃伊犬卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="虎王卡" Text="虎王卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="月夜貓卡" Text="月夜貓卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="黑暗之王卡" Text="黑暗之王卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="時間管理人卡" Text="時間管理人卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                </div>

                                <div class="collapse box box-default box-solid box-info" id="collapse_06" aria-labelledby="headingTwo" data-parent="#accordion">
                                    <div class="box-header text-bold">飾品</div>
                                    <asp:CheckBox runat="server" ID="毒魔菇卡" Text="毒魔菇卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="人魚卡" Text="人魚卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="摩卡卡" Text="摩卡卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="鬼火卡" Text="鬼火卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="獸人弓箭手卡" Text="獸人弓箭手卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="虛弱的傀儡卡" Text="虛弱的傀儡卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="沙漠幼狼卡" Text="沙漠幼狼卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="邪惡箱卡" Text="邪惡箱卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="龍蛋卡" Text="龍蛋卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="白鼠卡" Text="白鼠卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="魔菇卡" Text="魔菇卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="溜溜猴卡" Text="溜溜猴卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="將軍魔碑卡" Text="將軍魔碑卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="惡靈卡" Text="惡靈卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="蝙蝠弓箭手卡" Text="蝙蝠弓箭手卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="裘卡卡" Text="裘卡卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="薑餅人卡" Text="薑餅人卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="克瑞米卡" Text="克瑞米卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="劍魚卡" Text="劍魚卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="風魔巫師卡" Text="風魔巫師卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="犬妖卡" Text="犬妖卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="狸貓卡" Text="狸貓卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="氣泡蟲卡" Text="氣泡蟲卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="聖誕波利卡" Text="聖誕波利卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="黃蛇卡" Text="黃蛇卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="刺蝟蟲卡" Text="刺蝟蟲卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="卡浩卡" Text="卡浩卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="蠍子卡" Text="蠍子卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="狐仙卡" Text="狐仙卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="庫克雷卡" Text="庫克雷卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="森靈卡" Text="森靈卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="傑洛米卡" Text="傑洛米卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="螳螂卡" Text="螳螂卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="灰森靈卡" Text="灰森靈卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="俄塞里斯卡" Text="俄塞里斯卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                </div>

                                <div class="collapse box box-default box-solid box-success" id="collapse_07" aria-labelledby="headingTwo" data-parent="#accordion">
                                    <div class="box-header text-bold">頭部</div>
                                    <asp:CheckBox runat="server" ID="樹精卡" Text="樹精卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="瑪律杜克卡" Text="瑪律杜克卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="初心者愛意卡" Text="初心者愛意卡" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="國王波利的恩惠" Text="國王波利的恩惠" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="基爾瑟卡" Text="基爾瑟卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="長老樹精卡" Text="長老樹精卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="夢魘卡" Text="夢魘卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="藍鼠卡" Text="藍鼠卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="飛行魔書卡" Text="飛行魔書卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="黑魔女卡" Text="黑魔女卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="邪惡禮盒卡" Text="邪惡禮盒卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="卡拉特小丑卡" Text="卡拉特小丑卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="皇家限定卡" Text="皇家限定卡" ForeColor="LimeGreen" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="邪骸海盜卡" Text="邪骸海盜卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="小惡魔卡" Text="小惡魔卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="惡魔侍者卡" Text="惡魔侍者卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="封印的白素貞卡" Text="封印的白素貞卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="封印的貝思波卡" Text="封印的貝思波卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="鐘塔守護者卡" Text="鐘塔守護者卡" ForeColor="CornflowerBlue" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="迷幻之王卡" Text="迷幻之王卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="蜂后卡" Text="蜂后卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="獸人英雄卡" Text="獸人英雄卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="聖天使波利卡" Text="聖天使波利卡" ForeColor="MediumPurple" AutoPostBack="true" CssClass="checkbox-inline" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="box box-warning">
                        <div class="box-header">
                            <h3 class="box-title text-bold">王材</h3>
                            <button type="button" class="btn btn-sm" onclick="goaddnewdata()"><i class="fa fa-pencil-square-o"></i>新增資料</button>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="col-sm-12">
                                <div class="box box-solid box-warning" aria-labelledby="heading">
                                    <asp:CheckBox runat="server" ID="變身葉子" Text="變身葉子" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="四葉幸運草" Text="四葉幸運草" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="觸角" Text="觸角" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="透明之布" Text="透明之布" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="光粒" Text="光粒" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="零件" Text="零件" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="星星的角" Text="星星的角" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="獸人指甲" Text="獸人指甲" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="珍珠" Text="珍珠" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="柔軟的羽毛" Text="柔軟的羽毛" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="血色的輪" Text="血色的輪" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="鈴鐺" Text="鈴鐺" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="獸人英雄之證" Text="獸人英雄之證" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="詛咒紅寶石" Text="詛咒紅寶石" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="龍鱗" Text="龍鱗" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="水晶鏡子" Text="水晶鏡子" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="黑雲母" Text="黑雲母" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="緞帶" Text="緞帶" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="玫瑰石英" Text="玫瑰石英" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="時間扭曲鍵" Text="時間扭曲鍵" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="鐘塔之鑰" Text="鐘塔之鑰" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                    <asp:CheckBox runat="server" ID="卡侖之牙" Text="卡侖之牙" ForeColor="Gray" AutoPostBack="true" CssClass="checkbox-inline" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="div_addnewdata" runat="server">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">New Data</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="form-group" id="basic-example">
                            <label>物品名稱</label>
                            <asp:TextBox runat="server" CssClass="form-control typeahead" ID="tb_item_name"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>物品價格</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="tb_item_price"></asp:TextBox>
                        </div>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <asp:Button runat="server" ID="bt_newData" OnClick="bt_newData_Click" CssClass="btn btn-primary" Text="新增資料" />
                    </div>
                </div>
            </div>
            <div style="width: 100%;" class="list-group">
                <div class="list-group-item list-group-item-info">
                    若當天無更新價格，則是抓取有資料的價格的平均值
                </div>
                <canvas id="canvas" runat="server"></canvas>
            </div>
        </form>
    </div>
    <button id="randomizeData" style="visibility: hidden">Randomize Data</button>
    <button id="addDataset" style="visibility: hidden">Add Dataset</button>
    <button id="removeDataset" style="visibility: hidden">Remove Dataset</button>
    <button id="addData" style="visibility: hidden">Add Data</button>
    <button id="removeData" style="visibility: hidden">Remove Data</button>
    <!-- jQuery 3 -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Morris.js charts -->
    <script src="../bower_components/raphael/raphael.min.js"></script>
    <script src="../bower_components/morris.js/morris.min.js"></script>
    <!-- FastClick -->
    <script src="../bower_components/fastclick/lib/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="../dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="../dist/js/demo.js"></script>
    <!-- iCheck 1.0.1 -->
    <script src="../../plugins/iCheck/icheck.min.js"></script>
    <!-- typeahead -->
    <script type="text/javascript" src="../typeahead.js/typeahead.bundle.min.js"></script>

    <script>
        function goaddnewdata() {
            document.location.href = "/?user=administrator";
        }
    </script>
    <script>
        jQuery(function () {
            var typeaheaddata = [];

            $.ajax({
                type: 'POST',                     //GET or POST
                url: "GetTypeaheadData.aspx",  //請求的頁面
                data: { id: "" },
                cache: false,   //是否使用快取
                dataType: 'text',
                success: function (data) {   //處理回傳成功事件，當請求成功後此事件會被呼叫
                    var datalist = data;
                    var datalist_split = datalist.split(",");

                    for (var index = 0; index < datalist_split.length; ++index) {
                        typeaheaddata.push(datalist_split[index]);
                    }
                },
                error: function (result) {   //處理回傳錯誤事件，當請求失敗後此事件會被呼叫

                },
                complete: function (result) {

                }
            });

            var substringMatcher = function (strs) {
                return function findMatches(q, cb) {
                    var matches, substrRegex;
                    matches = [];//定义字符串数组
                    substrRegex = new RegExp(q, 'i');
                    //用正则表达式来确定哪些字符串包含子串的'q'
                    $.each(strs, function (i, str) {
                        //遍历字符串池中的任何字符串
                        if (substrRegex.test(str)) {
                            matches.push({ value: str });
                        }
                        //包含子串的'q',将它添加到'match'
                    });
                    cb(matches);
                };
            };

            $('#basic-example .typeahead').typeahead({
                highlight: true,
                minLength: 1
            },
                {
                    name: 'typeaheaddata',
                    displayKey: 'value',
                    source: substringMatcher(typeaheaddata)
                });

        });
    </script>
    <script>

        var config = {
            type: 'line',
            data: {
                labels: <%= x_axis %>,
                datasets: [
                   <%= Main_ChartData %>
                ]
            },
            options: {
                responsive: true,
                title: {
                    display: true,
                    text: 'RoExchange  Made By Cookie'
                },
                tooltips: {
                    mode: 'index',
                    intersect: false,
                },
                hover: {
                    mode: 'nearest',
                    intersect: true
                },
                scales: {
                    xAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'Date'
                        }
                    }],
                    yAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'Price'
                        }
                    }]
                }
            }
        };

        window.onload = function () {
            var ctx = document.getElementById("canvas").getContext("2d");
            window.myLine = new Chart(ctx, config);
        };

        document.getElementById('randomizeData').addEventListener('click', function () {
            config.data.datasets.forEach(function (dataset) {
                dataset.data = dataset.data.map(function () {
                    return randomScalingFactor();
                });

            });

            window.myLine.update();
        });

        var colorNames = Object.keys(window.chartColors);

        document.getElementById('addDataset').addEventListener('click', function () {
            var colorName = colorNames[config.data.datasets.length % colorNames.length];
            var newColor = window.chartColors[colorName];
            var newDataset = {
                label: 'Dataset ' + config.data.datasets.length,
                backgroundColor: newColor,
                borderColor: newColor,
                data: [],
                fill: false
            };

            for (var index = 0; index < config.data.labels.length; ++index) {
                newDataset.data.push(randomScalingFactor());
            }

            config.data.datasets.push(newDataset);
            window.myLine.update();
        });

        document.getElementById('addData').addEventListener('click', function () {
            if (config.data.datasets.length > 0) {
                var month = MONTHS[config.data.labels.length % MONTHS.length];
                config.data.labels.push(month);

                config.data.datasets.forEach(function (dataset) {
                    dataset.data.push(randomScalingFactor());
                });

                window.myLine.update();
            }
        });

        document.getElementById('removeDataset').addEventListener('click', function () {
            config.data.datasets.splice(0, 1);
            window.myLine.update();
        });

        document.getElementById('removeData').addEventListener('click', function () {
            config.data.labels.splice(-1, 1); // remove the label first

            config.data.datasets.forEach(function (dataset, datasetIndex) {
                dataset.data.pop();
            });

            window.myLine.update();
        });

        $(("[type='checkbox']")).iCheck({
            checkboxClass: 'icheckbox_flat-green',
            radioClass: 'iradio_square-blue'
        });

        $('input').on('ifChanged', function (event) {
            // 前面ajax抓值 seccese裡面放下面的語法
            // ID全改為中文
            var item_id = $(this).attr("ID");
            if (this.checked) {
                $.ajax({
                    type: 'POST',                     //GET or POST
                    url: "GetOneData.aspx",  //請求的頁面
                    data: { id: item_id },
                    cache: false,   //是否使用快取
                    dataType: 'json',
                    success: function (json) {   //處理回傳成功事件，當請求成功後此事件會被呼叫
                        var datalist = json[0].data;
                        var label = json[0].label;
                        var datalist_split = datalist.split(",");

                        var colorName = colorNames[config.data.datasets.length % colorNames.length];
                        var newColor = window.chartColors[colorName];
                        var newDataset = {
                            label: label,
                            backgroundColor: newColor,
                            borderColor: newColor,
                            data: [],
                            fill: false
                        };

                        for (var index = 0; index < datalist_split.length; ++index) {
                            newDataset.data.push(datalist_split[index]);
                        }

                        config.data.datasets.push(newDataset);
                    },
                    error: function (result) {   //處理回傳錯誤事件，當請求失敗後此事件會被呼叫

                    },
                    complete: function (result) {
                        window.myLine.update();
                    }
                });
            }
            else {
                for (var a = 0; a < config.data.datasets.length; a++) {
                    if (config.data.datasets[a].label == item_id) {
                        config.data.datasets.splice(a, 1);
                    }
                }
                window.myLine.update();
            }

        });

    </script>
</body>

</html>
