//draw_text_outlined(x, y, outline color, string color, string)  

function draw_text_outline(_x, _y, _outlinecolor, _strcolor, _str) {
	var xx,yy;  
	xx = argument[0];  
	yy = argument[1];  
  
	//Outline  
	draw_set_color(argument[2]);  
	draw_text(xx+1, yy+1, argument[4]);  
	draw_text(xx-1, yy-1, argument[4]);  
	draw_text(xx,   yy+1, argument[4]);  
	draw_text(xx+1,   yy, argument[4]);  
	draw_text(xx,   yy-1, argument[4]);  
	draw_text(xx-1,   yy, argument[4]);  
	draw_text(xx-1, yy+1, argument[4]);  
	draw_text(xx+1, yy-1, argument[4]);  
  
	//Text  
	draw_set_color(argument[3]);  
	draw_text(xx, yy, argument[4]); 
	draw_set_color(c_white);
}
