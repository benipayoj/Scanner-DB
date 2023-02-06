<?php session_start(); ?>
<?php include 'header.php'; ?>
<style>
#preview{
   width:500px;
   height:500px;
   margin:0px auto;
}
</style>
<!-- <style> 
    body { text-align: center; } 
</style>  -->

<head>
    <link rel="stylesheet" type="text/css" href="index1style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
</head>
<body class="hold-transition login-page">
<div class="login-box">
  	<div class="login-logo">
  		<p id="date"></p><p id="time" class="bold"></p>
  	</div>
    <div class="login-logo-pic">
     <img src="images/QCU_Logo_2019.png" alt="QCU">
     <h2 style="color:blue"> Q </h2>
     <h2 style="color:yellow; margin-top:-43px; margin-left: -250px;">C</h2>
     <h2 style="color:red; margin-top:-43px; margin-left: -225px;"> U </h2>
    </div>
    
    <div class="login-title">
       
      <h3>QUEZON CITY UNIVERSITY FACULTY ATTENDANCE MONITORING SYSTEM</h3>
    </div>

<video id="preview"></video>
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="https://rawgit.com/schmich/instascan-builds/master/instascan.min.js" rel="nofollow"></script>
<script type="text/javascript">


    function toTextBox(qrID)
    {
      // var myelement = 
      // var test = document.getElementById("employee").value;
      document.getElementById("employee").value = qrID.toString();
      document.getElementById("subbtn").click();
      //window.alert(test.toString()); 
    }

    var scanner = new Instascan.Scanner({ video: document.getElementById('preview'), scanPeriod: 5, mirror: false });
    scanner.addListener('scan',function(content){
        console.log(content.toString());
        toTextBox(content.toString());


        //window.location.href=content;
    });
    Instascan.Camera.getCameras().then(function (cameras){
        if(cameras.length>0){
            scanner.start(cameras[0]);
            $('[name="options"]').on('change',function(){
                if($(this).val()==1){
                    if(cameras[0]!=""){
                        scanner.start(cameras[0]);
                    }else{
                        alert('No Front camera found!');
                    }
                }
            });
        }else{
            console.error('No cameras found.');
            alert('No cameras found.');
        }
    }).catch(function(e){
        console.error(e);
        alert(e);
    });

</script>

<body>
     
<div class="text">
        <p>"Good life starts here."</p>
    </div>

  	<div class="login-box-body">
    	<h4 class="login-box-msg">Enter QR Code</h4>

    	<form id="attendance">
          <div class="form-group">
            <select class="form-control" name="status">
              <option value="in">Time In</option>
              <option value="out">Time Out</option>
            </select>
          </div>
      		<div class="form-group has-feedback">
        		<input type="password" class="form-control input-lg" id="employee" name="employee" required>
      		</div>
      		<div class="row">
    			<div class="col-xs-4"> 
          			<button type="submit" id="subbtn" class="btn btn-primary btn-block btn-flat" name="signin"><i class="fa fa-sign-in"></i> Submit</button>
              </div>
      		</div>
          
    	</form>
  	</div>
		<div class="alert alert-success alert-dismissible mt20 text-center" style="display:none;">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      <span class="result"><i class="icon fa fa-check"></i> <span class="message"></span></span>
      <button type="button" id="buttonx" class="btn btn-primary"> Take a selfie </button>
    </div>
		<div class="alert alert-danger alert-dismissible mt20 text-center" style="display:none;">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      <span class="result"><i class="icon fa fa-warning"></i> <span class="message"></span></span>
    </div>
  		
</div>
<script src="instascan.min.js"></script>
	<script type="text/javascript">
		let scanner=new Instacan.scanner({video:document.getElementById('preview')});
		Instacan.Camera.getCameras().then(function(cameras)){
			if(cameras.length>0)
			{
				scanner.start(cameras[0]);
			}
			else
			{
				alert("no camera Found");
			}
		}.catch(function(e)
		{
			console.error(e);
		});
		scanner.addListener('scan',function(c){
			document.getElementById("text") value=c;
		});
	</script>
  
 </body>

	
<?php include 'scripts.php' ?>
<script type="text/javascript">
$(function() {
  var interval = setInterval(function() {
    var momentNow = moment();
    $('#date').html(momentNow.format('MMMM DD, YYYY'));  
    $('#time').html(' | ' + momentNow.format('hh:mm:ss A'));
  }, 100);

  $('#attendance').submit(function(e){
    e.preventDefault();
    var attendance = $(this).serialize();
    $.ajax({
      type: 'POST',
      url: 'attendance.php',
      data: attendance,
      dataType: 'json',
      success: function(response){
        if(response.error){
          $('.alert').hide();
          $('.alert-danger').show();
          $('.message').html(response.message);
        }
        else{
          $('.alert').hide();
          $('.alert-success').show();
          $('.message').html(response.message);
          $('#employee').val('');
          
        }
      }
    });
  });
    
});
</script>


<script>
$(function(){
  $('.edit').click(function(e){
    e.preventDefault();
    $('#edit').modal('show');
    var id = $(this).data('id');
    getRow(id);
  });

  $('.delete').click(function(e){
    e.preventDefault();
    $('#delete').modal('show');
    var id = $(this).data('id');
    getRow(id);
  });
});

function getRow(id){
  $.ajax({
    type: 'POST',
    url: 'attendance_row.php',
    data: {id:id},
    dataType: 'json',
    success: function(response){
      $('#datepicker_edit').val(response.date);
      $('#attendance_date').html(response.date);
      $('#edit_time_in').val(response.time_in);
      $('#edit_time_out').val(response.time_out);
      $('#attid').val(response.attid);
      $('#employee_name').html(response.firstname+' '+response.lastname);
      $('#del_attid').val(response.attid);
      $('#del_employee_name').html(response.firstname+' '+response.lastname);
    }
  });
}
</script>
<script>
  const srcElement = document.querySelector("video"),
  btns = document.querySelectorAll("#buttonx");

  btns.forEach(btn => { // looping through each btn
    // adding click event to each btn
    btn.addEventListener("click", () => {
      // creating canvas of element using html2canvas
      html2canvas(srcElement).then(canvas => {
        // adding canvas/screenshot to the body
        if(btn.id === "take-src-only") {
          return document.body.appendChild(canvas);
        }

        // downloading canvas/screenshot
        const a = document.createElement("a");
        a.href = canvas.toDataURL();
        a.download = "screenshot.jpg";
        a.click();
      });
    });
  });
</script>

</body>

</html>