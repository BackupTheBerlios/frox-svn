unit CallManagement;

interface
uses main;
function AddACall(Call: TCaller): integer;
function RemoveACall(Call: TCaller): integer;
function StartAConnection(Call: TCaller): integer;

implementation

function AddACall(Call: TCaller): integer;
var len : integer;
begin
 len:= length(ActiveCalls);
 setlength(ActiveCalls, len+1);

 ActiveCalls[len] := Call;

 result := len+1;
end;

function RemoveACall(Call: TCaller): integer;
var i  : integer;
    len: integer;
begin
len:= length(ActiveCalls);

for i:= 0 to len-1 do
 if ActiveCalls[i].ConnID = Call.ConnID then
 begin
   ActiveCalls[i] := ActiveCalls[len-1];
   setlength(ActiveCalls, len-1);
   break;
 end;  

result := len-1;
end;

function StartAConnection(Call: TCaller): integer;
var i  : integer;
    len: integer;
begin
len:= length(ActiveCalls);

for i:= 0 to len-1 do
 if ActiveCalls[i].ConnID = Call.ConnID then
 begin
  ActiveCalls[i].start := Call.Start;
  break;
 end;

result := i;
end;

end.
