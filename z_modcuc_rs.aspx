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
			
			$(document).ready(function() {
				_q_boxClose();
				q_getId();
				q_gf('', 'z_modcuc_rs');
			});  
            function q_gfPost() {
                $('#q_report').q_report({
                    fileName : 'z_modcuc_rs',
                    options : [{/* [1]*/
                        type : '0',
                        name : 'accy',
                        value : q_getId()[4]
                    }, {/* [2]*/
                        type : '0',
                        name : 'xname',
                        value : r_name 
                    }, {/*1-1 [3][4]*/
                        type : '1',
                        name : 'date'
                    }]
                });
                q_popAssign();
				q_getFormat();
				q_langShow();
				
				$('#btnOk').click(function(e) {
					var t_date1 = $.trim($('#txtDate1').val());
                    var t_date2 = $.trim($('#txtDate2').val());	
                    if (t_date1.length == 0) {
                        alert('請輸入起始日期');                    
                    }else if (t_date2.length == 0) {
                        alert('請輸入終止日期');                    
                    }
				});
			
				$('#txtDate1').mask(r_picd);
                $('#txtDate1').datepicker();
                $('#txtDate2').mask(r_picd);
                $('#txtDate2').datepicker();     
                
				$('#txtDate1').val(q_date());
				$('#txtDate2').val(q_cdn(q_date(),6));           
									
			}

			function q_boxClose(s2) {
			}

			function q_gtPost(s2) {
			}
		</script>
	</head>
	<body ondragstart="return false" draggable="false"
	ondragenter="event.dataTransfer.dropEffect='none'; event.stopPropagation(); event.preventDefault();"
	ondragover="event.dataTransfer.dropEffect='none';event.stopPropagation(); event.preventDefault();"
	ondrop="event.dataTransfer.dropEffect='none';event.stopPropagation(); event.preventDefault();"
	>
		<div id="q_menu"></div>
		<div style="position: absolute;top: 10px;left:50px;z-index: 1;width:2000px;">
			<div id="container">
				<div id="q_report"></div>
			</div>
			<div class="prt" style="margin-left: -40px;">
                <!--#include file="../inc/print_ctrl.inc"-->
            </div>
		</div>
	</body>
</html>

