//Logging.pas - Part of the Lazarus_Codeblocks Project.
//Created by Racer0815 March 2023.
//https://github.com/Racer0815/Lazarus_Codeblocks

unit Logging;

interface

uses Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Windows;

Function LogOpen():Boolean;
Function LogClose():Boolean;
Function LogAddEvent(Event:String):Boolean;
Function LogAddValue(Comment:String;Value:String):Boolean;
Function LogAddValue(Comment:String;Value:Boolean):Boolean;
Function LogAddValue(Comment:String;Value:Integer):Boolean;
Function LogAddValue(Comment:String;Value:Double):Boolean;
Function LogAddComment(Comment:String):Boolean;

implementation

Function Timestamp():String;
var
time:String;
begin
time := FormatDateTime('yyyy-mm-dd, hh:nn:ss:zzz', now);
Timestamp := '[' + time + '] --> ';
end;

Function LogOpen():Boolean;
var
  Log:TextFile;
begin
AssignFile(Log,GetCurrentDir() + '\log.txt');
Rewrite(Log);
Writeln(Log,'#LOG OPEN');
writeln(Log,Timestamp() + 'Logging started');
CloseFile(Log);
LogOpen:=true;
end;

Function LogClose():Boolean;
var
  Log:TextFile;
begin
AssignFile(Log,GetCurrentDir() + '\log.txt');
Append(Log);
Writeln(Log,Timestamp + 'Logging stopped');
Writeln(Log,'#LOG CLOSE');
CloseFile(Log);
LogClose := true;
end;

Function LogAddEvent(Event:String):Boolean;
var
  Log:TextFile;
begin
AssignFile(Log,GetCurrentDir() + '\log.txt');
Append(Log);
Writeln(Log, Timestamp + Event);
CloseFile(Log);
LogAddEvent:=True;
end;

Function LogAddValue(Comment:String;Value:String):Boolean;
var
  Log:TextFile;
begin
AssignFile(Log,GetCurrentDir() + '\log.txt');
Append(Log);
Writeln(Log, Timestamp + Comment +' : ' + Value);
CloseFile(Log);
LogAddValue:=True;
end;

Function LogAddComment(Comment:String):Boolean;
var
  Log:TextFile;
begin
AssignFile(Log,GetCurrentDir() + '\log.txt');
Append(Log);
Writeln(Log,Comment);
CloseFile(Log);
LogAddComment:=True;
end;

Function LogAddValue(Comment:String;Value:Boolean):Boolean;
var
  Log:TextFile;
begin
AssignFile(Log,GetCurrentDir() + '\log.txt');
Append(Log);
if Value = True
then Writeln(Log, Timestamp + Comment + ' : 1b')
else Writeln(Log, Timestamp + Comment + ' : 0b');
CloseFile(Log);
LogAddValue:=True;
end;

Function LogAddValue(Comment:String;Value:Integer):Boolean;
var
  Log:TextFile;
begin
AssignFile(Log,GetCurrentDir() + '\log.txt');
Append(Log);
Writeln(Log, Timestamp + Comment +' : ' + intToStr(Value));
CloseFile(Log);
LogAddValue:=True;
end;

Function LogAddValue(Comment:String;Value:Double):Boolean;
var
  Log:TextFile;
begin
AssignFile(Log,GetCurrentDir() + '\log.txt');
Append(Log);
Writeln(Log, Timestamp + Comment +' : ' + floatToStr(Value)+'d');
CloseFile(Log);
LogAddValue:=True;
end;
End.
