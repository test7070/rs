<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
			t_isInit = false;
            t_part = '';
            t_store = '';
            t_typea = '';
            $(document).ready(function() {
                q_getId();
                q_gf('', 'z_bcc5_rs');
            });
            function q_gfPost() {
                q_gt('part', '', 0, 0, 0);
                q_gt('store', '', 0, 0, 0);
                q_gt('bcctype', '', 0, 0, 0);
            }

            function q_gtPost(t_name) {
                switch (t_name) {
                	case 'bcctype':
                        t_typea = '';
                        var as = _q_appendData("bcctype", "", true);
                        t_typea += '#non@全部';
                        for ( i = 0; i < as.length; i++) {
                            t_typea += (t_typea.length > 0 ? ',' : '') + as[i].noa + '@' + as[i].namea;
                        }
                        break;
                    case 'part':
                        t_part = '';
                        var as = _q_appendData("part", "", true);
                        for ( i = 0; i < as.length; i++) {
                            t_part += (t_part.length > 0 ? ',' : '') + as[i].noa + '@' + as[i].part;
                        }
                        break;
                    case 'store':
                        t_store = '';
                        var as = _q_appendData("store", "", true);
                        t_store += '#non@全部';
                        for ( i = 0; i < as.length; i++) {
                            t_store += (t_store.length > 0 ? ',' : '') + as[i].noa + '@' + as[i].store;
                        }
                        break;
                }
                if (!t_isInit && t_part.length > 0 && t_store.length > 0 && t_typea.length > 0) {
                	t_isInit = true;
                    $('#q_report').q_report({
                        fileName : 'z_bcc5_rs',
                        options : [{/*1*/
                            type : '2',
                            name : 'bcc',
                            dbf : 'bcc',
                            index : 'noa,product',
                            src : 'bcc_b.aspx'
                        },{/*2*/
							type : '6',
							name : 'enddate'
						},{/*3*/
							type : '5',
							name : 'xstore',
							value : t_store.split(',')
						},{/*4*/
							type : '8',
							name : 'xpart',
							value : t_part.split(',')
						},{/*4*/
							type : '5',
							name : 'xtypea',
							value : t_typea.split(',')
						}]
                    });
                    q_popAssign();
                    q_langShow();

                    $('#txtEnddate').mask('999/99/99');
                    $('#txtEnddate').datepicker();
	                $('#txtEnddate').val(q_date());
                }
            }

            function q_boxClose(s2) {
            }

		</script>
	</head>
	<body ondragstart="return false" draggable="false"
	ondragenter="event.dataTransfer.dropEffect='none'; event.stopPropagation(); event.preventDefault();"
	ondragover="event.dataTransfer.dropEffect='none';event.stopPropagation(); event.preventDefault();"
	ondrop="event.dataTransfer.dropEffect='none';event.stopPropagation(); event.preventDefault();">
		<div id="q_menu"> </div>
		<div style="position: absolute;top: 10px;left:50px;z-index: 1;width:2000px;">
			<div id="container">
				<div id="q_report"> </div>
			</div>
			<div class="prt" style="margin-left: -40px;">
				<!--#include file="../inc/print_ctrl.inc"-->
			</div>
		</div>
	</body>
</html>