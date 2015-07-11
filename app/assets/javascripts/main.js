function doLayout() {
   var my_canvas = document.getElementById("beer_canvas");
   canvas_context = my_canvas.getContext("2d");

   canvas_context.globalAlpha = 0.5;
   var pic = new Image();
   pic.src = "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSvxTAQwwap78ppdFcShl-ma9mP9KhVemAQ51B0j6ITiv1TUl3fGQ";
   pic.addEventListener("load", function(){
                                 canvas_context.drawImage(pic,0,0, my_canvas.width, my_canvas.height)
                                }, false);
 }
 
//window.addEventListener("load", doLayout, false);

