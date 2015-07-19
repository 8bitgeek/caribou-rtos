//Global variables
var offsetX = 0.0;
var offsetY = 0.0;

var adcData = [
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
];

var accX = [
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
];

var accY = [
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
];

var accZ = [
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
];

$(function() {
	//Make sure this is added before initializing AnythingSlider
	$('#slider').bind('initialized slide_complete', function() {
		$('link[href*=favicon]').detach().appendTo('head');
	});
	
	//AnythingSlider initialization
	$('#slider').anythingSlider({
		//resizeContents : false,
		buildNavigation : false,
		buildStartStop : false,
		startPanel : 1,
		onInitialized : sliderOnInitialized
	});
	
	//Apply corners
	if($.browser.msie) {
		$('.header').corner('top 30px');
		$('.footer').corner('bottom 30px');
	}
	
	//Enable 'Send Mail' button
	$('#sendMailButton').removeAttr('disabled');
	
	//Refresh page contents
	refreshDate();
	refreshPage(null);
	
	//Start timer
	setTimeout('timerEvent()', 500);
});

function sliderOnInitialized(event, slider) {
	$('body').css('display', 'block');
};

function createXmlHttpRequestObject() {
	if(window.XMLHttpRequest) {
		return new XMLHttpRequest();
	}
	else if(window.ActiveXObject) {
		//Available MSXML object IDs
		var progId = ['Msxml2.XMLHTTP.6.0', 'Msxml2.XMLHTTP.3.0', 'Msxml2.XMLHTTP', 'Microsoft.XMLHTTP'];
		//Iterate through MSXML object IDs
		for(var i in progId)
		{
			try
			{
				//Instantiate the highest version of MSXML
				return new ActiveXObject(progId[i]);
			}
			catch(e)
			{
			}
		}
	}
	
	return null;	
}

function timerEvent() {
	//Create XMLHttpRequest object
	var xhr = createXmlHttpRequestObject();
	//Failed to created the object?
	if(xhr == null) {
		window.alert('XMLHttpRequest object is not supported!');
		return;
	}
	
	//Set callback function
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4) {
			if(xhr.status == 200) {
				refreshPage(xhr);
				setTimeout('timerEvent()', 500);
			}
		}
	};
	
	//Send request
	xhr.open('GET', 'data.xml', true);
	xhr.send(null);
}

function refreshPage(xhr) {
	var i = 0;
	var ax = 0;
	var ay = 0;
	var az = 0;
	var adcValue = 0;
	var joystickState = 0;
	var alpha = -20.0 * Math.PI / 180.0;
	var beta = 20.0 * Math.PI / 180.0;
	var gamma = -5.0 * Math.PI / 180.0;
	
	if(xhr != null) {
		ax = parseInt(xhr.responseXML.getElementsByTagName('ax')[0].childNodes[0].nodeValue);
		ay = parseInt(xhr.responseXML.getElementsByTagName('ay')[0].childNodes[0].nodeValue);
		az = parseInt(xhr.responseXML.getElementsByTagName('az')[0].childNodes[0].nodeValue);
		adcValue = parseInt(xhr.responseXML.getElementsByTagName('adc')[0].childNodes[0].nodeValue);
		joystickState = parseInt(xhr.responseXML.getElementsByTagName('joystick')[0].childNodes[0].nodeValue);
		
		//Resolve the first angle
		alpha += Math.atan2(ay, Math.sqrt(ax * ax + az * az));
		//Resolve the second angle
		gamma += Math.atan2(ax, Math.sqrt(ay * ay + az * az));
		//Resolve the third angle
		beta += -adcValue * 2 * Math.PI / 4096;
	}
	
	if(joystickState == 2)
		offsetY = Math.max(offsetY - 0.2, -0.6);
	else if(joystickState == 3)
		offsetX = Math.max(offsetX - 0.2, -1.6);
	else if(joystickState == 4)
		offsetX = Math.min(offsetX + 0.2, 1.6);
	else if(joystickState == 5)
		offsetY = Math.min(offsetY + 0.2, 0.6);
	
	//Make room for the new values
	for(i = 0; i < (adcData.length - 1); i++)
		adcData[i] = adcData[i + 1];
	for(i = 0; i < (accX.length - 1); i++)
		accX[i] = accX[i + 1];
	for(i = 0; i < (accY.length - 1); i++)
		accY[i] = accY[i + 1];
	for(i = 0; i < (accZ.length - 1); i++)
		accZ[i] = accZ[i + 1];
	
	//Store the new values
	adcData[adcData.length - 1] = adcValue;
	accX[accX.length - 1] = ax;
	accY[accY.length - 1] = ay;
	accZ[accZ.length - 1] = az;
	
	try {
		//Refresh chart
		drawChart();
		//Refresh 3D object
		drawCube(alpha, beta, gamma, offsetX, offsetY, 0.0);
	}
	catch(e) {
	}
}

function drawChart() {
	var ctx = document.getElementById('canvas1').getContext('2d');
	
	//Store the current transformation matrix
	ctx.save();
	//Use the identity matrix while clearing the canvas
	ctx.setTransform(1, 0, 0, 1, 0, 0);
	ctx.clearRect(0, 0, canvas1.width, canvas1.height);
	//Restore the transform
	ctx.restore();
	
	//Draw outline
	ctx.save();
	ctx.fillStyle = '#FFFFFF';
	ctx.shadowColor='#888';
	ctx.shadowBlur = 5;
	ctx.shadowOffsetX = 2;
	ctx.shadowOffsetY = 2;
	ctx.fillRect(10, 10, canvas1.width - 20, canvas1.height - 20);
	ctx.restore();
	
	//Draw grid
	ctx.save();
	ctx.strokeStyle = '#DDD';
	ctx.lineWidth = 1;
	ctx.beginPath();
	
	for(var i = 1; i < 6; i++) {
		ctx.moveTo(10, 10 + i * (canvas1.height - 20) / 6);
		ctx.lineTo(canvas1.width - 10, 10 + i * (canvas1.height - 20) / 6);
	}
	
	for(var i = 1; i < 12; i++) {
		ctx.moveTo(10 + i * (canvas1.width - 20) / 12, 10);
		ctx.lineTo(10 + i * (canvas1.width - 20) / 12, canvas1.height - 10);
	}
	
	ctx.stroke();
	ctx.restore();
	
	//Draw curves
	ctx.save();
	ctx.lineWidth = 3;
	ctx.shadowColor = '#888';
	ctx.shadowBlur = 5;
	ctx.shadowOffsetX = 2;
	ctx.shadowOffsetY = 2;
	
	//ADC data
	ctx.strokeStyle = '#FCB400';
	ctx.beginPath();
	
	for(var i = 0; i < adcData.length; i++) {
		var x = 10 + i * (canvas1.width - 20) / (adcData.length - 1);
		var y = (canvas1.height - 10) - adcData[i] * (canvas1.height - 20) / 4096;
		y = Math.max(y, 12);
		y = Math.min(y, canvas1.height - 12);
		
		if(!i)
			ctx.moveTo(x, y);
		else
			ctx.lineTo(x, y);
	}
	
	ctx.stroke();
	
	//X-axis acceleration
	ctx.strokeStyle = '#D62408';
	ctx.beginPath();
	
	for(var i = 0; i < accX.length; i++) {
		var x = 10 + i * (canvas1.width - 20) / (accX.length - 1);
		var y = (canvas1.height / 2) - accX[i] * (canvas1.height - 20) / 128;
		y = Math.max(y, 12);
		y = Math.min(y, canvas1.height - 12);

		if(!i)
			ctx.moveTo(x, y);
		else
			ctx.lineTo(x, y);
	}
	
	ctx.stroke();
	
	//Y-axis acceleration
	ctx.strokeStyle = '#21AA29';
	ctx.beginPath();
	
	for(var i = 0; i < accY.length; i++) {
		var x = 10 + i * (canvas1.width - 20) / (accY.length - 1);
		var y = (canvas1.height / 2) - accY[i] * (canvas1.height - 20) / 128;
		y = Math.max(y, 12);
		y = Math.min(y, canvas1.height - 12);

		if(!i)
			ctx.moveTo(x, y);
		else
			ctx.lineTo(x, y);
	}
	
	ctx.stroke();
	
	//Z-axis acceleration
	ctx.strokeStyle = '#2159D6';
	ctx.beginPath();
	
	for(var i = 0; i < accZ.length; i++) {
		var x = 10 + i * (canvas1.width - 20) / (accZ.length - 1);
		var y = (canvas1.height / 2) - accZ[i] * (canvas1.height - 20) / 128;
		y = Math.max(y, 12);
		y = Math.min(y, canvas1.height - 12);

		if(!i)
			ctx.moveTo(x, y);
		else
			ctx.lineTo(x, y);
	}
	
	ctx.stroke();
	ctx.restore();
}

function Point(x, y, z) {
	this.x = x;
	this.y = y;
	this.z = z;
}

Point.prototype.scale = function(a) {
	return new Point(this.x * a, this.y * a, this.z * a);
}

Point.prototype.translate = function(dx, dy, dz) {
	return new Point(this.x + dx, this.y + dy, this.z + dz);
}

Point.prototype.rotate = function(a, b, c) {
	var x1 = this.x;
	var y1 = this.y;
	var z1 = this.z;
	
	var x2 = x1;
	var y2 = y1 * Math.cos(a) + z1 * Math.sin(a);
	var z2 = -y1 * Math.sin(a) + z1 * Math.cos(a);
	
	x1 = x2 * Math.cos(b) + z2 * Math.sin(b);
	y1 = y2;
	z1 = -x2 * Math.sin(b) + z2 * Math.cos(b);
	
	x2 = x1 * Math.cos(c) + y1 * Math.sin(c);
	y2 = -x1 * Math.sin(c) + y1 * Math.cos(c);
	z2 = z1;
	
	return new Point(x2, y2, z2);
}

Point.add = function(a, b) {
	return new Point(a.x + b.x, a.y + b.y, a.z + b.z);
}

Point.sub = function(a, b) {
	return new Point(a.x - b.x, a.y - b.y, a.z - b.z);
}

Point.dot = function(a, b) {
	return a.x * b.x + a.y * b.y + a.z * b.z;
}

Point.cross = function(a, b) {
	return new Point(
		a.y * b.z - a.z * b.y,
		a.z * b.x - a.x * b.z,
		a.x * b.y - a.y * b.x);
}

var cameraZ = 10.0;

var v1a = new Point( 0.7,  1.0,  1.0);
var v1b = new Point( 1.0,  0.7,  1.0);
var v1c = new Point( 1.0,  1.0,  0.7);
var v2a = new Point(-0.7,  1.0,  1.0);
var v2b = new Point(-1.0,  0.7,  1.0);
var v2c = new Point(-1.0,  1.0,  0.7);
var v3a = new Point(-0.7, -1.0,  1.0);
var v3b = new Point(-1.0, -0.7,  1.0);
var v3c = new Point(-1.0, -1.0,  0.7);
var v4a = new Point( 0.7, -1.0,  1.0);
var v4b = new Point( 1.0, -0.7,  1.0);
var v4c = new Point( 1.0, -1.0,  0.7);
var v5a = new Point(-0.7,  1.0,  -1.0);
var v5b = new Point(-1.0,  0.7,  -1.0);
var v5c = new Point(-1.0,  1.0,  -0.7);
var v6a = new Point( 0.7,  1.0,  -1.0);
var v6b = new Point( 1.0,  0.7,  -1.0);
var v6c = new Point( 1.0,  1.0,  -0.7);
var v7a = new Point( 0.7, -1.0,  -1.0);
var v7b = new Point( 1.0, -0.7,  -1.0);
var v7c = new Point( 1.0, -1.0,  -0.7);
var v8a = new Point(-0.7, -1.0,  -1.0);
var v8b = new Point(-1.0, -0.7,  -1.0);
var v8c = new Point(-1.0, -1.0,  -0.7);

var cubeVertex = new Array (
	new Array(v1a, v2a, v2b, v3b, v3a, v4a, v4b, v1b),
	new Array(v5a, v6a, v6b, v7b, v7a, v8a, v8b, v5b),
	new Array(v6c, v1c, v1b, v4b, v4c, v7c, v7b, v6b),
	new Array(v2c, v5c, v5b, v8b, v8c, v3c, v3b, v2b),
	new Array(v6a, v5a, v5c, v2c, v2a, v1a, v1c, v6c),
	new Array(v4a, v3a, v3c, v8c, v8a, v7a, v7c, v4c),
	new Array(v1a, v1b, v1c),
	new Array(v2c, v2b, v2a),
	new Array(v3a, v3b, v3c),
	new Array(v4c, v4b, v4a),
	new Array(v5a, v5b, v5c),
	new Array(v6c, v6b, v6a),
	new Array(v7a, v7b, v7c),
	new Array(v8c, v8b, v8a)
);

function drawCube(alpha, beta, gamma, dx, dy, dz) {
	var ctx = document.getElementById('canvas2').getContext('2d');
	
	// Store the current transformation matrix
	ctx.save();
	//Use the identity matrix while clearing the canvas
	ctx.setTransform(1, 0, 0, 1, 0, 0);
	ctx.clearRect(0, 0, canvas2.width, canvas2.height);
	//Restore the transform
	ctx.restore();
	
	ctx.save();
	ctx.fillStyle = '#FFFFFF';
	ctx.shadowColor='#888';
	ctx.shadowBlur = 5;
	ctx.shadowOffsetX = 2;
	ctx.shadowOffsetY = 2;
	ctx.fillRect(10, 10, canvas2.width - 20, canvas2.height - 20);
	ctx.restore();
	
	ctx.save();
	ctx.translate(canvas2.width / 2, canvas2.height / 2);
	
	for(var i = 0; i < cubeVertex.length; i++) {
		var v0 = cubeVertex[i][0].rotate(0.0, beta, 0.0).rotate(alpha, 0.0, gamma).translate(dx, dy, dz);
		var v1 = cubeVertex[i][1].rotate(0.0, beta, 0.0).rotate(alpha, 0.0, gamma).translate(dx, dy, dz);
		var v2 = cubeVertex[i][2].rotate(0.0, beta, 0.0).rotate(alpha, 0.0, gamma).translate(dx, dy, dz);
		
		var ai = Point.sub(v1, v0);
		var aj = Point.sub(v2, v0);
		var ak = Point.cross(ai, aj);
		var sk = v0.translate(0, 0, -cameraZ);
		
		if(Point.dot(ak, sk) < 0.0) {
			ctx.beginPath();
			ctx.moveTo(v0.x / (cameraZ - v0.z) * 700, -v0.y / (cameraZ - v0.z) * 700);
			ctx.lineTo(v1.x / (cameraZ - v1.z) * 700, -v1.y / (cameraZ - v1.z) * 700);
			ctx.lineTo(v2.x / (cameraZ - v2.z) * 700, -v2.y / (cameraZ - v2.z) * 700);
			
			for(var j = 3; j < cubeVertex[i].length; j++) {
				var v = cubeVertex[i][j].rotate(0.0, beta, 0.0).rotate(alpha, 0.0, gamma).translate(dx, dy, dz);
				ctx.lineTo(v.x / (cameraZ - v.z) * 700, -v.y / (cameraZ - v.z) * 700);
			}
			
			if(i < 2)
				ctx.fillStyle='#2159D6';
			else if(i < 4)
				ctx.fillStyle='#FCB400';
			else if(i < 6)
				ctx.fillStyle='#D62408';
			else
				ctx.fillStyle='#21AA29';
			
			ctx.fill();
		}
	}
	
	ctx.restore();
}


function sendMail() {
	$('#mailStatus').html('Status: Sending mail...');
	$('#sendMailButton').attr('disabled', '');
	
	//Create XMLHttpRequest object
	var xhr = createXmlHttpRequestObject();
	//Failed to created the object?
	if(xhr == null) {
		window.alert('XMLHttpRequest object is not supported!');
		return;
	}
	
	//Set callback function
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4) {
			if(xhr.status == 200) {
				try {
					var status = xhr.responseXML.getElementsByTagName('status')[0].childNodes[0].nodeValue;
					$('#mailStatus').html('Status: ' + status);
					$('#sendMailButton').removeAttr('disabled');
				}
				catch(e) {
					$('#mailStatus').html('Status: ' + e);
					$('#sendMailButton').removeAttr('disabled');
				}
			}
			else {
				$('#mailStatus').html('Status: Error ' + xhr.status);
				$('#sendMailButton').removeAttr('disabled');
			}
		}
	};
	
	//Send request
	try {
		xhr.open('POST', 'send_mail.xml', true);
		xhr.send($('#mailForm').serialize());
	}
	catch(e) {
		$('#mailStatus').html('Status: ' + e);
		$('#sendMailButton').removeAttr('disabled');
	}
}

function formatNum(num, size) {
	var s = num.toString();
	while(s.length < size)
		s = '0' + s;
	return s;
}

function refreshDate() {
	var days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
	var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
	
	var d = new Date();
	var zone = d.getTimezoneOffset();
	
	//Format date
	var date = days[d.getDay()] + ', ';
	date += d.getDate() + ' ' + months[d.getMonth()] + ' ' + d.getFullYear() + ' ';
	//Format time
	date += formatNum(d.getHours(), 2) + ':' + formatNum(d.getMinutes(), 2) + ':' + formatNum(d.getSeconds(), 2) + ' ';
	//Format time zone
	date += (zone <= 0) ? '+' : '-';
	date += formatNum(Math.abs(zone) / 60, 2) + formatNum(Math.abs(zone) % 60, 2);
	
	document.getElementsByName('date')[0].value = date;
}
