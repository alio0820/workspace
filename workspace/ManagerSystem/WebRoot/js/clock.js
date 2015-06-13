function clockTest() {
	var canvas = document.getElementById('canvas');
	if (!(canvas && canvas.getContext)) {
		return;
	}
	var ct = canvas.getContext('2d');
	var w = canvas.width = 200;
	var h = canvas.height = 200;
	var r1 = 55;
	var r2 = 40;
	var c3 = ct.createLinearGradient(0, 0, 0, h);
	c3.addColorStop(0, '#FFF');
	c3.addColorStop(0.2, '#dad9e0');
	c3.addColorStop(0.4, '#adb0b6');
	c3.addColorStop(0.6, '#8f8f99');
	c3.addColorStop(0.8, '#86878b');
	c3.addColorStop(1, '#88898e');
	var c4 = ct.createRadialGradient(w / 2, h / 2, w, w, w, w);
	c4.addColorStop(0, 'rgba(0,0,0,1)');
	c4.addColorStop(0.2, 'rgba(0,0,0,0.8)');
	c4.addColorStop(0.3, 'rgba(0,0,0,0)');
	c4.addColorStop(0, 'rgba(0,0,0,0)');
	function clock() {
		var d = new Date();
		var dH = d.getHours();
		var dM = d.getMinutes();
		var dS = d.getSeconds();
		// return;
		ct.clearRect(0, 0, w, h);
		ct.save();
		ct.beginPath();
		ct.strokeStyle = 'rgba(0,0,0,0.1)';
		ct.fillStyle = c3;
		ct.arc(w / 2, h / 2, 100, 0, Math.PI * 2, true);
		ct.closePath();
		ct.fill();
		ct.stroke();
		ct.restore();
		ct.save();
		ct.beginPath();
		ct.strokeStyle = 'rgba(0,0,0,0.1)';
		ct.fillStyle = '#E2E9F1';
		ct.arc(w / 2, h / 2, 90, 0, Math.PI * 2, true);
		ct.closePath();
		ct.fill();
		ct.stroke();
		ct.restore();
		for ( var i = 0; i < 60; i++) {
			ct.save();
			ct.lineCap = 'square';
			ct.beginPath();
			if (i % 5 === 0) {
				ct.lineWidth = 5;
				ct.strokeStyle = '#333';
			} else {
				ct.lineWidth = 2;
				ct.strokeStyle = '#333';
			}
			ct.translate(w / 2, h / 2);
			ct.rotate(i * 6 * Math.PI / 180);
			ct.moveTo(0, -80);
			if (i % 5 === 0) {
				ct.lineTo(0, -65);
			} else {
				ct.lineTo(0, -70);
			}
			ct.closePath();
			ct.stroke();
			ct.restore();
		}
		ct.save();
		ct.translate(w / 2, h / 2);
		ct.fillColor = '#369';
		ct.textAlign = 'center';
		ct.textBaseline = 'middle';
		ct.font = '25px times new roman';
		ct.fillText(12, 0, -r1);
		ct.fillText(3, r1, -0);
		ct.fillText(6, 0, r1);
		ct.fillText(9, -r1, -0);
		ct.fillStyle = '#666';
		ct.font = '12px verdara';
		ct.fillText('KINGZHAI', 0, 30);
		ct.restore();
		ct.save();
		ct.beginPath();
		ct.translate(w / 2, h / 2);
		ct.rotate((dH + dM / 60) * 30 * Math.PI / 180);
		ct.lineWidth = 10;
		ct.strokeStyle = '#222';
		ct.moveTo(0, 15);
		ct.lineTo(0, -r2);
		ct.closePath();
		ct.stroke();
		ct.restore();
		ct.save();
		ct.beginPath();
		ct.translate(w / 2, h / 2);
		ct.rotate((dM + dS / 60) * 6 * Math.PI / 180);
		ct.lineWidth = 6;
		ct.strokeStyle = '#333';
		ct.moveTo(0, 20);
		ct.lineTo(0, -r2 - 10);
		ct.closePath();
		ct.stroke();
		ct.restore();
		ct.save();
		ct.beginPath();
		ct.translate(w / 2, h / 2);
		ct.rotate(dS * 6 * Math.PI / 180);
		ct.lineWidth = 2;
		ct.strokeStyle = '#C00';
		ct.moveTo(0, 25);
		ct.lineTo(0, -r2 - 20);
		ct.closePath();
		ct.stroke();
		ct.restore();
		ct.save();
		ct.beginPath();
		ct.translate(w / 2, h / 2);
		ct.arc(0, 0, 6, 0, Math.PI * 2, true);
		ct.fillStyle = '#C00';
		ct.closePath();
		ct.fill();
		ct.restore();
		setTimeout(clock, 1000);
	}
	clock();
}
$(document).ready(function(){
	clockTest();
});