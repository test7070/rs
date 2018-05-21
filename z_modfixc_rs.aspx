<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
			
			$(document).ready(function() {
				_q_boxClose();
				q_getId();
				q_gf('', 'z_modfixc_rs');
			});  
			
			aPop = new Array(
				['txtXnoa1', '', 'model', 'noa', 'txtXnoa1', 'model_b.aspx'],
				['txtXnoa2', '', 'model', 'noa', 'txtXnoa2', 'model_b.aspx']
			);
			
            function q_gfPost() {
                $('#q_report').q_report({
                    fileName : 'z_modfixc_rs',
                    options : [
                    {  //[1][2]
                        type : '1',
                        name : 'xnoa'
                    },{//[3][4]
                    	type : '1',
                    	name : 'xdate'
                    	
                    },{//[5]
                    	type : '6',
                    	name : 'xframe'
                    	
                    }]
                });
                q_popAssign();
				q_getFormat();
				q_langShow();   
                
                var t_noa=q_getHref()[1]==undefined?'':q_getHref()[1];
                $('#txtXnoa1').val(t_noa);    
				$('#txtXnoa2').val(t_noa);
                        
				if(r_len==4){                	
                	$.datepicker.r_len=4;
					//$.datepicker.setDefaults($.datepicker.regional["ENG"]);
                }
				$('#txtXdate1').datepicker();
				$('#txtXdate2').datepicker();
                 
                $('#txtXdate1').mask(r_picd);
	            $('#txtXdate2').mask(r_picd);    
	            
	            $('#txtXdate1').val(q_date().substr(0, r_lenm)+'/01');
	            $('#txtXdate2').val(q_cdn(q_cdn(q_date().substr(0, r_lenm)+'/01',35).substr(0,r_lenm)+'/01',-1));                   
                				
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
