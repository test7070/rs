<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
    <head>
        <title></title>
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
			q_tables = 's';
			var q_name = "cust";
			var q_readonly = ['txtWorker', 'txtWorker2'];
			var q_readonlys = [];
			var q_readonlyt = [];
			var bbmNum = [];
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
			brwKey = 'noa';
			aPop = new Array();
			$(document).ready(function() {
				bbmKey = ['noa'];
				bbsKey = ['noa', 'noq'];
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
				
				$('#btnConn').click(function(e){
				    $('.dbbs').toggle().offset({top:$(this).offset().top+$(this).height()+5,left: 15});
				});
				$("#combPaytype").change(function(e) {
                    if (q_cur == 1 || q_cur == 2)
                        $('#txtPaytype').val($('#combPaytype').find(":selected").text());
                });
                $("#txtPaytype").focus(function(e) {
                    var n = $(this).val().match(/[0-9]+/g);
                    var input = document.getElementById("txtPaytype");
                    if ( typeof (input.selectionStart) != 'undefined' && n != null) {
                        input.selectionStart = $(this).val().indexOf(n);
                        input.selectionEnd = $(this).val().indexOf(n) + (n + "").length;
                    }
                }).click(function(e) {
                    var n = $(this).val().match(/[0-9]+/g);
                    var input = document.getElementById("txtPaytype");
                    if ( typeof (input.selectionStart) != 'undefined' && n != null) {
                        input.selectionStart = $(this).val().indexOf(n);
                        input.selectionEnd = $(this).val().indexOf(n) + (n + "").length;
                    }
                });
                $('#txtUacc1').change(function(e){
                    var patt = /^(\d{4})([^\.,.]*)$/g;
                    $(this).val($(this).val().replace(patt,"$1.$2"));
                });
                $('#txtUacc2').change(function(e){
                    var patt = /^(\d{4})([^\.,.]*)$/g;
                    $(this).val($(this).val().replace(patt,"$1.$2"));
                });
                $('#txtUacc3').change(function(e){
                    var patt = /^(\d{4})([^\.,.]*)$/g;
                    $(this).val($(this).val().replace(patt,"$1.$2"));
                });
                $('#txtUacc4').change(function(e){
                    var patt = /^(\d{4})([^\.,.]*)$/g;
                    $(this).val($(this).val().replace(patt,"$1.$2"));
                });
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
				var t_noa = $('#txtNoa').val();
				if (t_noa.length == 0 || t_noa == "AUTO")
					q_gtnoa(q_name, replaceAll(q_date(), '/', ''));
				else
					wrServer(t_noa);
			}
			function _btnSeek() {
				if (q_cur > 0 && q_cur < 4)
					return;
				q_box('cust_rs_s.aspx', q_name + '_s', "550px", "400px", q_getMsg("popSeek"));
			}
			function bbsAssign() {
				for (var i = 0; i < q_bbsCount; i++) {
					$('#lblNo_' + i).text(i + 1);
					if (!$('#btnMinus_' + i).hasClass('isAssign')) {
					}
				}
				_bbsAssign();
			}
			function btnIns() {
				_btnIns();
				$('#txtNoa').focus();
			}
			function btnModi() {
				if ($('#txtNoa').val().length==0)
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
				if (!as['namea']) {
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
						return 4;
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
                width: 950px;
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
                        <td>
                        <input id="chkBrow.*" type="checkbox" style=''/>
                        </td>
                        <td align="center" id='noa'>~noa</td>
                        <td align="center" id='nick'>~nick</td>
                    </tr>
                </table>
            </div>
            <div class='dbbm' >
                <table class="tbbm" id="tbbm" style="width: 872px;">
                    <tr style="height:1px;">
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="tdZ"></td>
                    </tr>
                    <tr>
                        <td><span> </span><a id='lblNoa' class="lbl"> </a></td>
                        <td><input id="txtNoa" type="text" class="txt c1" /></td>
                        <td><span> </span><a id='lblComp' class="lbl"> </a></td>
                        <td colspan="4"><input id="txtComp" type="text" class="txt c1" /></td>
                    </tr>
                    <tr>
                        <td><span> </span><a id='lblNick' class="lbl"> </a></td>
                        <td><input id="txtNick" type="text" class="txt c1" /></td>
                        <td><span> </span><a id='lblSerial' class="lbl"> </a></td>
                        <td><input id="txtSerial" type="text" class="txt c1" /></td>
                        <td></td>
                        <td></td>
                        <td><input id="btnConn" type="button" class="txt c1" value="Conn"/></td>
                    </tr>
                    <tr>
                        <td><span> </span><a id='lblBoss' class="lbl"> </a></td>
                        <td><input id="txtBoss" type="text" class="txt c1" /></td>
                        <td><span> </span><a id='lblCredit' class="lbl"> </a></td>
                        <td><input id="txtCredit" type="text" class="txt c1 num" /></td>
                    </tr>
                    <tr>
                        <td><span> </span><a id='lblTel' class="lbl"> </a></td>
                        <td colspan="2"><input id="txtTel" type="text" class="txt c1" /></td>
                        <td><span> </span><a id='lblFax' class="lbl"> </a></td>
                        <td colspan="2"><input id="txtFax" type="text" class="txt c1" /></td>
                    </tr>
                    <tr>
                        <td><span> </span><a id='lblAddr_invo' class="lbl"> </a></td>
                        <td><input id="txtZip_invo" type="text" class="txt c1" /></td>
                        <td colspan="3"><input id="txtAddr_invo" type="text" class="txt c1" /></td>
                        <td><span> </span><a id='lblUacc1' class="lbl"> </a></td>
                        <td><input id="txtUacc1" type="text" class="txt c1" /></td>
                    </tr>
                    <tr>
                        <td><span> </span><a id='lblAddr_conn' class="lbl"> </a></td>
                        <td><input id="txtZip_conn" type="text" class="txt c1" /></td>
                        <td colspan="3"><input id="txtAddr_conn" type="text" class="txt c1" /></td>
                        <td><span> </span><a id='lblUacc2' class="lbl"> </a></td>
                        <td><input id="txtUacc2" type="text" class="txt c1" /></td>
                    </tr>
                    <tr>
                        <td><span> </span><a id='lblAddr_fact' class="lbl"> </a></td>
                        <td><input id="txtZip_fact" type="text" class="txt c1" /></td>
                        <td colspan="3"><input id="txtAddr_fact" type="text" class="txt c1" /></td>
                        <td><span> </span><a id='lblUacc3' class="lbl"> </a></td>
                        <td><input id="txtUacc3" type="text" class="txt c1" /></td>
                    </tr>
                    <tr>
                        <td><span> </span><a id='lblEmail' class="lbl"> </a></td>
                        <td colspan="4"><input id="txtEmail" type="text" class="txt c1" /></td>
                        <td><span> </span><a id='lblUacc4' class="lbl"> </a></td>
                        <td><input id="txtUacc4" type="text" class="txt c1" /></td>
                    </tr>
                    <tr>
                        <td><span> </span><a id='lblPaytype' class="lbl"> </a></td>
                        <td colspan="2">
                            <input id="txtPaytype" type="text" class="txt" style="width:90%;"/>
                            <select id="combPaytype" class="txt" style="width:10%;"> </select>
                        </td>
                        <td><span> </span><a id='lblTrantype' class="lbl"> </a></td>
                        <td><select id="cmbTrantype" class="txt c1"> </select></td>
                    </tr>
                    <tr>
                        <td><span> </span><a id='lblMemo' class="lbl"> </a></td>
                        <td colspan="5"><input id="txtMemo" type="text" class="txt c1" /></td>
                    </tr>
                    <tr>
                        <td><span> </span><a id='lblWorker' class="lbl"> </a></td>
                        <td><input id="txtWorker" type="text" class="txt c1" /></td>
                        <td><span> </span><a id='lblWorker2' class="lbl"> </a></td>
                        <td><input id="txtWorker2" type="text" class="txt c1" /></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class='dbbs' style="position: absolute;display:none;background-color: white;">
            <table id="tbbs" class='tbbs'>
                <tr style='color:white; background:#003366;' >
                    <td  align="center" style="width:20px;">
                    <input class="btn"  id="btnPlus" type="button" value='+' style="font-weight: bold;"  />
                    </td>
                    <td align="center" style="width:20px;"> </td>
                    <td align="center" style="width:100px;"><a id='lblNamea_s'>姓名</a></td>
                    <td align="center" style="width:60px;"><a id='lblJob_s'>職稱</a></td>
                    <td align="center" style="width:60px;"><a id='lblPart_s'>部門</a></td>
                    <td align="center" style="width:100px;"><a id='lblTel_s'>電話</a></td>
                    <td align="center" style="width:100px;"><a id='lblExt_s'>分機</a></td>
                    <td align="center" style="width:40px;"><a id='lblFax_s'>傳真</a></td>
                    <td align="center" style="width:100px;"><a id='lblMobile_s'>行動電話</a></td>
                    <td align="center" style="width:80px;"><a id='lblEmail_s'>EMAIL</a></td>
                    <td align="center" style="width:60px;"><a id='lblZip_s'>郵遞區號</a></td>
                    <td align="center" style="width:120px;"><a id='lblAddr_s'>地址</a></td>
                    <td align="center" style="width:100px;"><a id='lblMemo_s'>備註</a></td>
                </tr>
                <tr style='background:#cad3ff;'>
                    <td>
                        <input class="btn" id="btnMinus.*" type="button" value='－' style=" font-weight: bold;" />
                        <input type="text" id="txtNoq.*" style="display:none;"/>
                    </td>
                    <td><a id="lblNo.*" style="font-weight: bold;text-align: center;display: block;"> </a></td>
                    <td>
                    <input type="text" id="txtNamea.*" style="width:95%;"/>
                    </td>
                    <td>
                    <input type="text" id="txtJob.*" style="width:95%;"/>
                    </td>
                    <td>
                    <input type="text" id="txtPart.*" style="width:95%;"/>
                    </td>
                    <td>
                    <input type="text" id="txtTel.*" style="width:95%;"/>
                    </td>
                    <td>
                    <input type="text" id="txtExt.*" style="width:95%;"/>
                    </td>
                    <td>
                    <input type="text" id="txtFax.*" style="width:95%;"/>
                    </td>
                    <td>
                    <input type="text" id="txtMobile.*" style="width:95%;"/>
                    </td>
                    <td>
                    <input type="text" id="txtEmail.*" style="width:95%;"/>
                    </td>
                    <td>
                    <input type="text" id="txtZip.*" style="width:95%;"/>
                    </td>
                    <td>
                    <input type="text" id="txtAddr.*" style="width:95%;"/>
                    </td>
                    <td>
                    <input type="text" id="txtMemo.*" style="width:95%;"/>
                    </td>
                </tr>
            </table>
        </div>
        <input id="q_sys" type="hidden" />
    </body>
</html>