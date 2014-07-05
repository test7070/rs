<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
    <head>
        <title> </title>
        <script src="../script/jquery.min.js" type="text/javascript"></script>
        <script src='../script/qj2.js' type="text/javascript"></script>
        <script src='qset.js' type="text/javascript"></script>
        <script src='../script/qj_mess.js' type="text/javascript"></script>
        <script src="../script/qbox.js" type="text/javascript"></script>
        <script src='../script/mask.js' type="text/javascript"></script>
        <link href="../qbox.css" rel="stylesheet" type="text/css" />
        <link href="css/jquery/themes/redmond/jquery.ui.all.css" rel="stylesheet" type="text/css" />
        <script src="css/jquery/ui/jquery.ui.core.js"></script>
        <script src="css/jquery/ui/jquery.ui.widget.js"></script>
        <script src="css/jquery/ui/jquery.ui.datepicker_tw.js"></script>
        <script type="text/javascript">         
            q_desc = 1;
            q_tables = 't';
            var q_name = "cust";
            var q_readonly = ['txtWorker', 'txtWorker2'];
            var q_readonlys = [];
            var q_readonlyt = [];

            var bbmNum = [['txtCredit', 10, 5, 1]];
            var bbsNum = [];
            var bbtNum = [];
            var bbmMask = [];
            var bbsMask = [];
            var bbtMask = [];
            q_sqlCount = 6;
            brwCount = 6;
            brwCount2 = 14;
            brwList = [];
            brwNowPage = 0;
            brwKey = 'Odate';
            aPop = new Array();
            $(document).ready(function() {
                bbmKey = ['noa'];
                bbsKey = ['noa', 'noq'];
                bbtKey = ['noa', 'noq'];
                q_brwCount();
                q_gt(q_name, q_content, q_sqlCount, 1, 0, '', r_accy);
            });

            function main() {
                if (dataErr) {
                    dataErr = false;
                    return;
                }
                mainForm(1);
            }

            function sum() {
            }

            function mainPost() {
                q_getFormat();
                q_mask(bbmMask);
                q_cmbParse("combPaytype", q_getPara('sys.paytype'));
                q_cmbParse("cmbTrantype", q_getPara('sys.trantype'));
            }

            function q_boxClose(s2) {
                switch (b_pop) {
                    case q_name + '_s':
                        q_boxClose2(s2);
                        break;
                }
                b_pop = '';
            }

            function q_gtPost(t_name) {
                switch (t_name) {
                    case q_name:
                        if (q_cur == 4)
                            q_Seek_gtPost();
                        break;
                }
            }

            function btnOk() {

            }
            function _btnSeek() {
                if (q_cur > 0 && q_cur < 4)
                    return;
                q_box('cust_rs_s.aspx', q_name + '_s', "550px", "400px", q_getMsg("popSeek"));
            }
            function bbsAssign() {
                for (var i = 0; i < q_bbsCount; i++) {
                    $('#lblNo_'+i).text(i+1);
                    if (!$('#btnMinus_' + i).hasClass('isAssign')) {
                    }
                }
                _bbsAssign();
            }
            function bbtAssign() {
                for (var i = 0; i < q_bbtCount; i++) {
                    $('#lblNo__' + i).text(i + 1);
                    if (!$('#btnMinut__' + i).hasClass('isAssign')) {
                    }
                }
                _bbtAssign();
            }

            function btnIns() {
                _btnIns();
                $('#txtNoa').focus();
            }

            function btnModi() {
                if (emp($('#txtNoa').val()))
                    return;
                _btnModi();
                $('#txtComp').focus();
            }
            function btnPrint() {
                q_box("z_cust_rsp.aspx?" + r_userno + ";" + r_name + ";" + q_time + ";noa=" + $('#txtNoa').val() + ";" + r_accy, 'z_ordcp', "95%", "95%", q_getMsg('popPrint'));
            }

            function wrServer(key_value) {
                var i;
                $('#txt' + bbmKey[0].substr(0, 1).toUpperCase() + bbmKey[0].substr(1)).val(key_value);
                _btnOk(key_value, bbmKey[0], bbsKey[1], '', 2);
            }

            function bbsSave(as) {
                if (!as['productno1'] && !as['productno2'] && !as['productno3']) {
                    as[bbsKey[1]] = '';
                    return;
                }
                q_nowf();
                return true;
            }

            function refresh(recno) {
                _refresh(recno);
            }

            function readonly(t_para, empty) {
                _readonly(t_para, empty);
            }

            function btnMinus(id) {
                _btnMinus(id);
                sum();
            }

            function btnPlus(org_htm, dest_tag, afield) {
                _btnPlus(org_htm, dest_tag, afield);
                if (q_tables == 's')
                    bbsAssign();
            }
            function btnPlut(org_htm, dest_tag, afield) {
                _btnPlus(org_htm, dest_tag, afield);
            }

            function q_appendData(t_Table) {
                return _q_appendData(t_Table);
            }

            function btnSeek() {
                _btnSeek();
            }

            function btnTop() {
                _btnTop();
            }

            function btnPrev() {
                _btnPrev();
            }

            function btnPrevPage() {
                _btnPrevPage();
            }

            function btnNext() {
                _btnNext();
            }

            function btnNextPage() {
                _btnNextPage();
            }

            function btnBott() {
                _btnBott();
            }

            function q_brwAssign(s1) {
                _q_brwAssign(s1);
            }

            function btnDele() {
                _btnDele();
            }

            function btnCancel() {
                _btnCancel();
            }
            function checkId(str) {
                if ((/^[a-z,A-Z][0-9]{9}$/g).test(str)) {//身分證字號
                    var key = 'ABCDEFGHJKLMNPQRSTUVWXYZIO';
                    var s = (key.indexOf(str.substring(0, 1)) + 10) + str.substring(1, 10);
                    var n = parseInt(s.substring(0, 1)) * 1 + parseInt(s.substring(1, 2)) * 9 + parseInt(s.substring(2, 3)) * 8 + parseInt(s.substring(3, 4)) * 7 + parseInt(s.substring(4, 5)) * 6 + parseInt(s.substring(5, 6)) * 5 + parseInt(s.substring(6, 7)) * 4 + parseInt(s.substring(7, 8)) * 3 + parseInt(s.substring(8, 9)) * 2 + parseInt(s.substring(9, 10)) * 1 + parseInt(s.substring(10, 11)) * 1;
                    if ((n % 10) == 0)
                        return 1;
                } else if ((/^[0-9]{8}$/g).test(str)) {//統一編號
                    var key = '12121241';
                    var n = 0;
                    var m = 0;
                    for (var i = 0; i < 8; i++) {
                        n = parseInt(str.substring(i, i + 1)) * parseInt(key.substring(i, i + 1));
                        m += Math.floor(n / 10) + n % 10;
                    }
                    if ((m % 10) == 0 || ((str.substring(6, 7) == '7' ? m + 1 : m) % 10) == 0)
                        return 2;
                } else if ((/^[0-9]{4}\/[0-9]{2}\/[0-9]{2}$/g).test(str)) {//西元年
                    var regex = new RegExp("^(?:(?:([0-9]{4}(-|\/)(?:(?:0?[1,3-9]|1[0-2])(-|\/)(?:29|30)|((?:0?[13578]|1[02])(-|\/)31)))|([0-9]{4}(-|\/)(?:0?[1-9]|1[0-2])(-|\/)(?:0?[1-9]|1\\d|2[0-8]))|(((?:(\\d\\d(?:0[48]|[2468][048]|[13579][26]))|(?:0[48]00|[2468][048]00|[13579][26]00))(-|\/)0?2(-|\/)29))))$");
                    if (regex.test(str))
                        return 3;
                } else if ((/^[0-9]{3}\/[0-9]{2}\/[0-9]{2}$/g).test(str)) {//民國年
                    str = (parseInt(str.substring(0, 3)) + 1911) + str.substring(3);
                    var regex = new RegExp("^(?:(?:([0-9]{4}(-|\/)(?:(?:0?[1,3-9]|1[0-2])(-|\/)(?:29|30)|((?:0?[13578]|1[02])(-|\/)31)))|([0-9]{4}(-|\/)(?:0?[1-9]|1[0-2])(-|\/)(?:0?[1-9]|1\\d|2[0-8]))|(((?:(\\d\\d(?:0[48]|[2468][048]|[13579][26]))|(?:0[48]00|[2468][048]00|[13579][26]00))(-|\/)0?2(-|\/)29))))$");
                    if (regex.test(str))
                        return 4
                }
                return 0;
                //錯誤
            }
        </script>
        <style type="text/css">
            #dmain {
                overflow: hidden;
            }
            .dview {
                float: left;
                width: 250px; 
                border-width: 0px; 
            }
            .tview {
                border: 5px solid gray;
                font-size: medium;
                background-color: black;
            }
            .tview tr {
                height: 30px;
            }
            .tview td {
                padding: 2px;
                text-align: center;
                border-width: 0px;
                background-color: #FFFF66;
                color: blue;
            }
            .dbbm {
                float: left;
                width: 700px;
                /*margin: -1px;        
                border: 1px black solid;*/
                border-radius: 5px;
            }
            .tbbm {
                padding: 0px;
                border: 1px white double;
                border-spacing: 0;
                border-collapse: collapse;
                font-size: medium;
                color: blue;
                background: #cad3ff;
                width: 100%;
            }
            .tbbm tr {
                height: 35px;
            }
            .tbbm tr td {
                width: 9%;
            }
            .tbbm .tdZ {
                width: 2%;
            }
            .tbbm tr td span {
                float: right;
                display: block;
                width: 5px;
                height: 10px;
            }
            .tbbm tr td .lbl {
                float: right;
                color: blue;
                font-size: medium;
            }
            .tbbm tr td .lbl.btn {
                color: #4297D7;
                font-weight: bolder;
            }
            .tbbm tr td .lbl.btn:hover {
                color: #FF8F19;
            }
            .txt.c1 {
                width: 100%;
                float: left;
            }
            .txt.num {
                text-align: right;
            }
            .tbbm td {
                margin: 0 -1px;
                padding: 0;
            }
            .tbbm td input[type="text"] {
                border-width: 1px;
                padding: 0px;
                margin: -1px;
                float: left;
            }
            .tbbm select {
                border-width: 1px;
                padding: 0px;
                margin: -1px;
            }
            .dbbs {
                width: 1600px;
            }
            .tbbs a {
                font-size: medium;
            }
            .tbbs tr.error input[type="text"] {
                color: red;
            }
            .num {
                text-align: right;
            }
            input[type="text"], input[type="button"] {
                font-size: medium;
            }
            .txt.lef {
                float: left;
            }
            .import {
                background: #FFAA33;
            }
            #dbbt {
                width: 800px;
            }
            #tbbt {
                margin: 0;
                padding: 2px;
                border: 2px pink double;
                border-spacing: 1;
                border-collapse: collapse;
                font-size: medium;
                color: blue;
                background: pink;
                width: 100%;
            }
            #tbbt tr {
                height: 35px;
            }
            #tbbt tr td {
                text-align: center;
                border: 2px pink double;
            }
        </style>
    </head>
    <body ondragstart="return false" draggable="false"
    ondragenter="event.dataTransfer.dropEffect='none'; event.stopPropagation(); event.preventDefault();"
    ondragover="event.dataTransfer.dropEffect='none';event.stopPropagation(); event.preventDefault();"
    ondrop="event.dataTransfer.dropEffect='none';event.stopPropagation(); event.preventDefault();">
        <!--#include file="../inc/toolbar.inc"-->
        <div id='dmain' style="overflow:hidden;width: 1260px;">
            <div class="dview" >
                <table class="tview" id="tview">
                    <tr>
                        <td align="center" style="width:5%"><a id='vewChk'> </a></td>
                        <td align="center" style="width:25%"><a id='vewNoa'> </a></td>
                        <td align="center" style="width:25%"><a id='vewNick'> </a></td>
                    </tr>
                    <tr>
                        <td><input id="chkBrow.*" type="checkbox" style=''/></td>
                        <td align="center" id='noa'>~noa</td>
                        <td align="center" id='nick'>~nick</td>
                    </tr>
                </table>
            </div>
            <div class='dbbm' >
                <table class="tbbm" id="tbbm" style="width: 872px;">
                    <tr style="height:1px;">
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td> </td>
                        <td class="tdZ"> </td>
                    </tr>
                    
                    
                </table>
            </div>
        </div>
        <div class='dbbs' >
            <table id="tbbs" class='tbbs' border="1" cellpadding='2' cellspacing='1' >
                <tr style='color:White; background:#003366;' >
                    <td  align="center" style="width:30px;">
                        <input class="btn"  id="btnPlus" type="button" value='+' style="font-weight: bold;"  />
                    </td>
                    <td align="center" style="width:20px;"> </td>
                    <td align="center" style="width:180px;"><a id='lblProductno'> </a></td>
                    <td align="center" style="width:200px;"><a id='lblProduct_st'> </a></td>
                    <td align="center" style="width:95px;" class="isStyle"><a id='lblStyles'> </a></td>
                    <td align="center" style="width:60px;"><a id='lblUnit'> </a></td>
                    <td align="center" style="width:100px;"><a id='lblMount_st'> </a></td>
                    <td align="center" style="width:100px;"><a id='lblOmount_st'> </a></td>
                    <td align="center" style="width:100px;"><a id='lblPrices'> </a></td>
                    <td align="center" style="width:100px;"><a id='lblTotals'> </a></td>
                    <td align="center" style="width:80px;"><a id='lblTrandates'> </a></td>
                    <td align="center" style="width:100px;"><a id='lblGemounts'> </a></td>
                    <td align="center" style="width:150px;"><a id='lblMemos'> </a></td>
                    <td align="center" style="width:45px;"><a id='lblRc2record'> </a></td>
                    <td align="center" style="width:45px;"><a id='lblCancels'> </a></td>
                    <td align="center" style="width:45px;"><a id='lblEndas'> </a></td>
                </tr>
                <tr style='background:#cad3ff;'>
                    <td><input class="btn" id="btnMinus.*" type="button" value='－' style=" font-weight: bold;" /></td>
                    <td><a id="lblNo.*" style="font-weight: bold;text-align: center;display: block;"> </a></td>
                    <td align="center">
                        <input class="txt c1" id="txtProductno1.*" type="text" />
                        <input class="txt c1" id="txtProductno2.*" type="text" />
                        <input class="txt c1" id="txtProductno3.*" type="text" />
                        <input class="txt c1" id="txtProductno.*" type="hidden" />
                        <input id="txtNo2.*" type="text" class="txt" style="width:60px;"/>
                        <input class="btn" id="btnProduct1.*" type="button" value='.' style=" font-weight: bold;" />
                        <input class="btn" id="btnProduct2.*" type="button" value='.' style=" font-weight: bold;" />
                        <input class="btn" id="btnProduct3.*" type="button" value='.' style=" font-weight: bold;" />
                    </td>
                    <td>
                        <input id="txtProduct.*" type="text" class="txt c1"/>
                        <input id="txtSpec.*" type="text" class="txt c1 isSpec"/>
                    </td>
                    <td class="isStyle"><input id="txtStyle.*" type="text" class="txt c1 isStyle"/></td>
                    <td><input id="txtUnit.*" type="text" class="txt c1"/></td>
                    <td><input id="txtMount.*" type="text" class="txt num c1" /></td>
                    <td>
                        <input id="txtOmount.*" type="text" class="txt num c1" />
                        <input id="txtStdmount.*" type="text" class="txt c1 num"/>
                    </td>
                    <td><input id="txtPrice.*" type="text" class="txt num c1" /></td>
                    <td><input id="txtTotal.*" type="text" class="txt num c1" /></td>
                    <td><input id="txtTrandate.*" type="text" class="txt c1"/></td>
                    <td>
                        <input class="txt num c1" id="txtC1.*" type="text" />
                        <input class="txt num c1" id="txtNotv.*" type="text" />
                    </td>
                    <td>
                        <input id="txtMemo.*" type="text" class="txt c1"/>
                        <input class="txt" id="txtOrdbno.*" type="text" style="width:70%;" />
                        <input class="txt" id="txtNo3.*" type="text" style="width:20%;" />
                        <input id="recno.*" type="hidden" />
                    </td>
                    <td align="center">
                        <input class="btn" id="btnRc2record.*" type="button" value='.' style=" font-weight: bold;" />
                    </td>
                    <td align="center"><input class="btn" id="chkCancel.*" type="checkbox"/></td>
                    <td align="center"><input class="btn" id="chkEnda.*" type="checkbox"/></td>
                </tr>
            </table>
        </div>
        <input id="q_sys" type="hidden" />
        <div id="dbbt" style="display:none;">
            <table id="tbbt">
                <tbody>
                    <tr class="head" style="color:white; background:#003366;">
                        <td style="width:90px;">
                        <input id="btnPlut" type="button" style="font-size: medium; font-weight: bold;" value="＋"/>
                        </td>
                        <td style="width:20px;"> </td>
                        <td style="width:100px; text-align: center;">no2</td>
                        <td style="width:100px; text-align: center;">ordbaccy</td>
                        <td style="width:200px; text-align: center;">ordbno</td>
                        <td style="width:100px; text-align: center;">no3</td>
                        <td style="width:200px; text-align: center;">productno</td>
                        <td style="width:100px; text-align: center;">unit</td>
                        <td style="width:100px; text-align: center;">mount</td>
                        <td style="width:100px; text-align: center;">weight</td>
                        <td style="width:100px; text-align: center;">cancel</td>
                    </tr>
                    <tr>
                        <td>
                            <input id="btnMinut..*"  type="button" style="font-size: medium; font-weight: bold;" value="－"/>
                            <input id="txtNoq..*" type="text" style="display:none;"/>
                        </td>
                        <td><a id="lblNo..*" style="font-weight: bold;text-align: center;display: block;"> </a></td>
                        <td><input id="txtNo2..*" type="text" style="width:95%;"/></td>
                        <td><input id="txtOrdbaccy..*" type="text" style="width:95%;"/></td>
                        <td><input id="txtOrdbno..*" type="text" style="width:95%;"/></td>
                        <td><input id="txtNo3..*" type="text" style="width:95%;"/></td>
                        <td><input id="txtProductno..*" type="text" style="width:95%;"/></td>
                        <td><input id="txtUnit..*" type="text" style="width:95%;"/></td>
                        <td><input id="txtMount..*"  type="text" style="width:95%; text-align: right;"/></td>
                        <td><input id="txtWeight..*"  type="text" style="width:95%; text-align: right;"/></td>
                        <td align="center"><input class="btn" id="chkCancel..*" type="checkbox"/></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>