unit charts;

Interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;
Function bar_chart(values:array of Integer; Canvas:TImage; y:Integer; Color:TColor; back:TColor):Boolean;
Function line_chart(values:array of Integer; Canvas:TImage; y:Integer; Color:TColor; back:TColor):Boolean;

Implementation

Function bar_chart(values:array of Integer; Canvas:TImage; y:Integer; Color:TColor; back:TColor):Boolean;
var
x:Integer;
i:Integer;
larg:Integer;
begin
     larg := 0;
     x:=30;
     Canvas.Canvas.Brush.Color := back;
     Canvas.canvas.Brush.Style := bsSolid;
     Canvas.Canvas.Pen.Width := 1;
     Canvas.Canvas.Clear;
     Canvas.Canvas.Pen.Color := Color;
     Canvas.Canvas.Brush.Color := Color;
     for i:=0 to Length(values)-1
     do begin
              Canvas.canvas.rectangle(x,y,x+10,y-values[i]);
              Canvas.canvas.TextOut(x+2,y+5,IntToStr(i+1));
           x:=x+20;
         if larg < values[i] then larg := values[i];
         end;
     Canvas.Canvas.TextOut(2,y-larg-7,IntToStr(larg));
     Canvas.Canvas.line(14,y-larg,28,y-larg);
     bar_chart := true;
end;

Function line_chart(values:array of Integer; Canvas:TImage; y:Integer; Color:TColor; back:TColor):Boolean;
var
x:Integer;
i:Integer;
larg:Integer;
begin
     larg := 0;
     x:=30;
     Canvas.Canvas.Brush.Color := back;
     Canvas.canvas.Brush.Style := bsSolid;
     Canvas.Canvas.Pen.Width := 1;
     Canvas.Canvas.Clear;
     Canvas.Canvas.Pen.Color := Color;
     Canvas.Canvas.Brush.Color := Color;
     for i:=0 to Length(values)-2
     do begin
             Canvas.Canvas.line(x, y-values[i], x+20, y-values[i+1]);
             Canvas.canvas.TextOut(x+2,y+5,IntToStr(i+1));
             x:=x+20;
             if larg < values[i] then larg := values[i];
         end;
     Canvas.Canvas.TextOut(2,y-larg-7,IntToStr(larg));
     Canvas.Canvas.line(14,y-larg,28,y-larg);
     line_chart := true;

end;

End.
