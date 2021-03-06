/////////////////////////////////////////////////////
// Unit containing common string handling routines //
/////////////////////////////////////////////////////
unit StrUtil;

interface

uses
  Classes;

type
  String1 = string[1];
  string2 = string[2];
  string3 = string[3];
  string4 = string[4];
  string5 = string[5];
  string6 = string[6];
  string7 = string[7];
  string8 = string[8];
  string9 = string[9];
  string10 = string[10];
  string11 = string[11];
  string12 = string[12];
  string16 = string[16];
  string20 = String[20];
  string25 = String[25];
  string30 = String[30];
  string32 = string[32];
  string40 = string[40];
  string45 = string[45];
  string50 = string[50];
  string55 = string[55];
  string60 = string[60];
  string80 = string[80];
  string100 = string[100];

  TOpenCharArray = array of char;
  TCharArray255 = array [0..255] of char;
  TCharSet = set of char;
  TSide = (psLeft, psRight);

const
  CRLF = #13#10;
  TAB = #9;

  function BooleanAs01(Value : boolean) : char;
  function PadString(PadSide : TSide; sString : string; cChar : char; iTargetLength : integer): string;
  function TrimString(TrimSide : TSide; sString : string; cChar : char): string;
  function RemoveAllChars(sString : string; cChar : char): string;
  function StrToPence(sValue : string): LongInt;
  function PenceToStr(iPence : LongInt; bBlankzeros : boolean = FALSE): String;
  function ToDateTime(const Date : string8; const Time : string) : TDateTime; overload;
  function ToDateTime(const Date : string8) : TDateTime; overload;
  function DateTimeAsLongDate(Date : TDateTime) : string8;
  Function BoolToStr(bBool : boolean) : string5;
  function RemoveAllBeforeChar(cChar : Char; sString : string): string;
  function ExtractLeadingInteger(Value : string) : string;
  function ExtractTrailingInteger(Value : string) : string;
  function ExtractLeadingString(Value : string) : string;
  function HowManyCharInString(cChar : Char; sString : string; bConsecutive : boolean) : integer;
  function JustFileName(FileName : string) : string;
  function CreatePath(DirNames : array of string) : string;
//  function StrToFloatDef(sValue : string; rDefault : real) : real;
  function GetAllAfterChar(cChar : Char; sString : string): string;
  procedure ReplaceStr(var sString : string; sToReplace, sReplaceWith : string);
  Function GetCopyrightMessage : string;
  function Scramble(sInput : string; bNew : boolean = FALSE): string;
  function UnScramble(sInput : string; bNew : boolean = FALSE): string;
//  function Scramble(sInput : string): string;
//  function UnScramble(sInput : string): string;
  function DateToStr8(ADate : TDateTime) : string8;
  function TimeToStr6(TheTime : TDateTime) : string6;
  function Str6ToTime(sTime : String6) : TDateTime;
  function Str8ToDate(sDate : String8) : TDateTime;
  function BlankIfZero(sValue : string) : string;
  Function ValidateEmailAddress (Address : String) : Boolean;
  Function Str8ToScreenDate(sDate : string8): string;
  Function Str6ToScreenTime(sTime : string6): string;
  function GetYNFromBool(bBoolean : boolean) : Char;
  function FindCloseMatch(s : string; TheStrings : TStrings) : integer;
  Function MoneyToStr(rMoney : double; iDecs : byte = 2) : String;
  function StringToCodes(sString : string) : string;
  function GetThFromInt(iFraction : integer): string;
  function StringListToString(slStringList : TStringList) : String;
  function RemoveAllCharsExcept(sString, sExcept : string) : string;
  function DateToScreenDate(dDate : TDateTime) : string;
  function TimeToScreenTime(tTime : TDateTime) : string;

implementation
uses
  SysUtils;

function BooleanAs01(Value : boolean) : char;
// Returns a char of '0' or '1' dependant on boolean variable.
//
// Value : boolean to convert to '0' / '1'
begin
  if Value then
    Result := '1'
  else
    Result := '0';
end;

function PadString(PadSide : TSide; sString : string; cChar : char; iTargetLength : integer): string;
// Pads a string to a target length with a specified character. Can be padded to the left or right
//
// PadSide : which side to add the extra characters to.
// sString : the string to pad.
// cChar : the character to pad with.
// iTargetLength : the length you wish to the string to padded to.
var
  sPadString : string;
  iPos : integer;
begin
  sPadString := '';
  For iPos := 1 to (iTargetLength - length(sString)) do sPadString := sPadString + cChar;
  case PadSide of
    psLeft : Result := sPadString + sString;
    psRight : Result := sString + sPadString;
  end;{case}
end;

function TrimString(TrimSide : TSide; sString : string; cChar : char): string;
// trims all characters of a specified type from one side of a given string
//
// TrimSide : which side to remove the characters from.
// sString : the string to trim.
// cChar : the character to trim off.
var
  iPos : integer;
begin
  if length(sString) > 0 then begin
    case TrimSide of
      psLeft : begin
        iPos := 1;
        while (iPos <= length(sString)) and (sString[iPos] = cChar) do inc(iPos);
        if iPos > length(sString) then sString := ''
        else sString := copy(sString,iPos,255);
      end;

      psRight : begin
        iPos := length(sString);
        while (iPos > 0) and (sString[iPos] = cChar) do dec(iPos);
        if iPos = 0 then sString := ''
        else sString := copy(sString,1,iPos);
      end;
    end;{case}
    Result := sString;
  end;{if}
end;

function RemoveAllChars(sString : string; cChar : char): string;
// Removes all of a specified character from a given string
//, no matter where the character occurs in the string.
//
// sString : string to remove characters from
// cChar : the character to remove from the given string.
var
  iPos : integer;
begin
  repeat
    iPos := Pos(cChar,sString);
    if iPos > 0 then delete(sString,iPos,1);
  until iPos = 0;
  result := sString;
end;

function StrToPence(sValue : string): LongInt;
// Converts a string in the format '9999999.99' into a value of how many pence it represents
//
// sValue : string to convert
var
  iMultiplier, iDPPos : Longint;
  sPounds : string[10];
  sPence : string[2];
begin
  if Copy(sValue,1,1) = '-' then iMultiplier := -1
  else iMultiplier := 1;

  iDPPos := Pos('.',sValue);
  if iDPPos = 0 then
    begin
      sPounds := sValue;
      if sPounds = '' then sPounds := '0';
      sPence := '00';
    end
  else begin
    sPounds := Copy(sValue,1,iDPPos - 1);
    if sPounds = '' then sPounds := '0';
    sPence := Copy(sValue,iDPPos + 1,(Length(sValue) - iDPPos));
    if sPence = '' then sPence := '00';
    if length(sPence) = 1 then sPence := sPence + '0';
  end;{if}
  StrToPence := (StrToInt(sPounds) * 100) + (StrToInt(sPence)) * iMultiplier;
end;

function PenceToStr(iPence : LongInt; bBlankzeros : boolean = FALSE): String;
// Converts an amount of pence, into a string in the format '9999999.99'.
//
// iPence : the value to convert
// bBlankZeros : when this is set : '0.00' is ouput as ''
var
  sPence : string[12];
  bNegative : boolean;
begin
  bNegative := FALSE;
  if iPence < 0 then begin
    bNegative := TRUE;
    iPence := iPence  * -1;
  end;{if}
  sPence := IntToStr(iPence);

  if length(sPence) > 2 then
    begin
      sPence := copy(sPence,1,(length(sPence) - 2)) + '.' + copy(sPence,(length(sPence) - 1),2);
    end
  else begin
    if length(sPence) = 1 then sPence := '0.0' + sPence
    else sPence := '0.' + sPence;
  end;{if}
  if bNegative then sPence := '-' + sPence;
  if bBlankzeros and (sPence = '0.00') then sPence := '';
  PenceToStr := sPence;
end;

function ToDateTime(const Date : string8; const Time : string) : TDateTime; overload;
// Pre  : Date = date in format yyyymmdd
//        Time = time in format hhmmss
// Post : Returns TDateTime equivalent. If Date blank, uses 0
begin
  try
    Result := EncodeDate(StrToInt(copy(Date,1,4)), StrToInt(copy(Date,5,2)),
      StrToInt(copy(Date,7,2)));
  except
    Result := 0;
  end;

  try
    Result := Result + EncodeTime(StrToInt(copy(Time,1,2)), StrToInt(copy(Time,3,2)),
      StrToInt(copy(Time,5,2)), 0);
  except
  end;
end;

//-----------------------------------------------------------------------

function ToDateTime(const Date : string8) : TDateTime; overload;
// Calls the above function
begin
  Result := ToDateTime(Date, '000000');
end;

//-----------------------------------------------------------------------

function DateTimeAsLongDate(Date : TDateTime) : string8;
// Post  : Returns date formatted yyyymmdd
var
  Year, Month, Day : word;
begin
  DecodeDate(Date, Year, Month, Day);
  Result := Format('%.4d%.2d%.2d', [Year, Month, Day]);
end;

//-----------------------------------------------------------------------

Function BoolToStr(bBool : boolean) : string5;
// Converts a boolean value into the string 'True' or 'False'
//
// bBool : the boolean value to convert.
begin
  if bBool then Result := 'True'
  else Result := 'False';
end;

function RemoveAllBeforeChar(cChar : Char; sString : string): string;
// Removes the front portion of a string before (and including)
// the first instance of a specific character in a string.
//
// cChar : the character to remove (as well as all preceeding characters)
// sString : the string to remove the characters from.
var
  iPos : integer;
begin
  iPos := Pos(cChar,sString);
  Result := Copy(sString,iPos + 1,256);
end;

function ExtractLeadingInteger(Value : string) : string;
// Post : Returns a string with just leading numeric characters
var
  i : integer;
begin
  Result := '';
  i := 1;
  while (i <= length(Value)) and (Value[i] in ['0'..'9']) do
  begin
    Result := Result + Value[i];
    inc(i);
  end;
end;

function ExtractTrailingInteger(Value : string) : string;
// Post : Returns a string with just the originals trailing numeric characters
var
  i : integer;
begin
  Result := '';
  i := length(Value);
  while (i > 0) and (Value[i] in ['0'..'9']) do
  begin
    insert(Value[i], Result, 1);
    dec(i);
  end;
end;


function ExtractLeadingString(Value : string) : string;
// Post : Returns a string with just leading non-numeric characters
var
  i : integer;
begin
  Result := '';
  i := 1;
  while (i <= length(Value)) and not (Value[i] in ['0'..'9']) do
  begin
    Result := Result + Value[i];
    inc(i);
  end;
end;

function HowManyCharInString(cChar : Char; sString : string; bConsecutive : boolean) : integer;
// Counts how many of a particular character are in
//
// cChar        : the char that you wish to count
// sString      : the string you wish to count the chars in
// bConsecutive : whether you want to count the number of consecutive characters
//              , or just the number of characters.
var
  iFirstPos : integer;
  bGap : boolean;
  iPos : integer;
begin
  Result := 0;
  bGap := FALSE;
  iFirstPos := Pos(cChar,sString);
  if iFirstPos <> 0 then begin
    for iPos := iFirstPos to length(sString) do begin
      if sString[iPos] = cChar then
        begin
          if (not bConsecutive) or (bConsecutive and (not bGap)) then inc(Result);
        end
      else bGap := TRUE;
    end;{for}
  end;{if}
end;

function JustFileName(FileName : string) : string;
// Post : Returns just a filename without an extension e.g.
//        "c:\windows\system.ini" would become "system"
begin
  FileName := ExtractFileName(FileName);
  Result := copy(FileName, 1, length(FileName) - length(ExtractFileExt(FileName)));
end;

function CreatePath(DirNames : array of string) : string;
// Pre  : DirNames = list of directories in correct order
// Post : Directories are concatenated together with backslashes
var
  i : integer;
begin
  if Length(DirNames) = 0 then
    Result := ''
  else
  begin
    Result := IncludeTrailingBackslash(DirNames[0]);
    if Length(DirNames) > 1 then
      for i := 1 to High(DirNames) do
        Result := Result + IncludeTrailingBackslash(DirNames[i]);
  end;
end;

//function StrToFloatDef(sValue : string; rDefault : real) : real;
// Turns a string into a floating point number, with a default value, if the conversion fails.
//
// sValue   : value to convert into a float
// rDefault : vlue to default to if an error occurs when converting the string}
{begin
  sValue := RemoveAllChars(sValue, ',');
  try
    Result := StrToFloat(sValue);
  except
    Result := rDefault;
  end;{try}
//end;

function GetAllAfterChar(cChar : Char; sString : string): string;
// Returns the right-hand portion of a string, after a specified character
//
// cChar   : character to get remaining string after.
// sString : string to return right-hand portion of
var
  iPos : integer;
begin
  iPos := Pos(cChar, sString);
  Result := Copy(sString,iPos + 1,256);
end;

procedure ReplaceStr(var sString : string; sToReplace, sReplaceWith : string);
// Replaces all occurances of a string, with another string.
//
// sString      : string to modify
// sToReplace   : replace occurances of this string...
// sReplaceWith : ...with this string
var
  iPos : integer;
begin
  Repeat
    iPos := Pos(sToReplace,sString);
    if iPos <> 0 then begin
      Delete(sString, iPos, length(sToReplace));
      Insert(sReplaceWith, sString, iPos);
    end;{if}
  Until iPos = 0;
end;

Function GetCopyrightMessage : string;
// Returns the Exchequer copyright message, for use in about boxes etc.
begin
  Result := 'Copyright � Exchequer Software Ltd 1986-2004';
end;

function Scramble(sInput : string; bNew : boolean = FALSE): string;
var
  iScrambleKey, iPos : Integer;
  sScrambled : string;
begin
  sInput := UpperCase(sInput);
  if bNew then iScrambleKey := (Length(sInput) mod 10) + 1
  else iScrambleKey := Length(sInput) mod 10;
  sScrambled := '';
  For iPos := 1 to Length(sInput) do begin
    sScrambled := sScrambled + chr(Ord(sInput[iPos]) + iScrambleKey);
  end;{FOR}
  Scramble := sScrambled;
end;

function UnScramble(sInput : string; bNew : boolean = FALSE): string;
var
  iScrambleKey, iPos : Integer;
  sUnScrambled : string;
begin
  if bNew then iScrambleKey := (Length(sInput) mod 10) + 1
  else begin
    sInput := UpperCase(sInput);
    iScrambleKey := Length(sInput) mod 10;
  end;{if}

  sUnScrambled := '';
  For iPos := 1 to Length(sInput) do begin
    sUnScrambled := sUnScrambled + chr(Ord(sInput[iPos]) - iScrambleKey);
  end;{FOR}
  UnScramble := sUnScrambled;
end;

function DateToStr8(ADate : TDateTime) : string8;
begin
  Result := DateTimeAsLongDate(ADate);
end;

function TimeToStr6(TheTime : TDateTime) : string6;
var
  Hour, Min, Sec, MSec : Word;
begin
  DecodeTime(TheTime, Hour, Min, Sec, MSec);
  Result := PadString(psLeft,IntToStr(Hour),'0',2) + PadString(psLeft,IntToStr(Min),'0',2)
  + PadString(psLeft,IntToStr(Sec),'0',2);
end;

function Str6ToTime(sTime : String6) : TDateTime;
var
  Hour, Min, Sec : Word;
begin
  Hour := StrToIntDef(Copy(sTime,1,2),0);
  Min := StrToIntDef(Copy(sTime,3,2),0);
  Sec := StrToIntDef(Copy(sTime,5,2),0);
  Result := EncodeTime(Hour, Min, Sec, 0);
end;

function Str8ToDate(sDate : String8) : TDateTime;
var
  Year, Month, Day : word;
begin
  if (StrToIntDef(sDate, 0) = 0) then sDate := DateToStr8(Date);
  Year := StrToIntDef(Copy(sDate,1,4),0);
  Month := StrToIntDef(Copy(sDate,5,2),0);
  Day := StrToIntDef(Copy(sDate,7,2),0);
  Result := EncodeDate(Year, Month, Day);
end;

function BlankIfZero(sValue : string) : string;
begin
//  if StrToFloatDef(sValue,0) = 0 then Result := ''
//  else Result := sValue;
  if StrToFloat(sValue) = 0 then Result := ''
//  else Result := sValue;
end;

Function ValidateEmailAddress(Address: string): boolean;
var
CharPos, CharIndex, AtCount: integer;
begin
  Result:= true;
  AtCount:= 0;

  for CharIndex:= 1 to Length(Address) do
  begin
    if Address[CharIndex] = '@' then inc(AtCount);
    if AtCount > 1 then Result:= false;
  end;

  CharPos:= Pos('@', Address);
  if (CharPos <= 1) or (CharPos >= Length(Address) - 2) then Result:= false;

  CharPos:= Pos('.', Address);
  if (CharPos <= 3) or (CharPos >= Length(Address)) then Result:= false;
end;

Function Str8ToScreenDate(sDate : string8): string;
begin
  Result := Copy(sDate,7,2) + '/' + Copy(sDate,5,2) + '/' + Copy(sDate,1,4);
end;

Function Str6ToScreenTime(sTime : string6): string;
begin
  Result := Copy(sTime,1,2) + ':' + Copy(sTime,3,2) + ':' + Copy(sTime,5,2);
end;

function GetYNFromBool(bBoolean : boolean) : Char;
begin
  if bBoolean then Result := 'Y'
  else Result := 'N';
end;

function FindCloseMatch(s : string; TheStrings : TStrings) : integer;
var
  slItems : TStringList;
  iPos : integer;
  bFound : boolean;
begin{FindCloseMatch}

  // find exact match
  Result := TheStrings.IndexOf(s);
  if Result = -1 then begin

    // use find method
    slItems := TStringList.create;
    slItems.Assign(TheStrings);
    slItems.find(s,Result);
    slItems.Free;

    // manually find
    if Result <= 0 then begin
      bFound := FALSE;
      iPos := 0;
      while (iPos < TheStrings.Count) and (not bFound) do begin
        if uppercase(Copy(TheStrings[iPos],1,length(s))) = uppercase(s)
        then begin
          Result := iPos;
          bFound := TRUE;
        end;{if}
        inc(iPos);
      end;{while}
    end;{if}

  end;{if}
end;{FindCloseMatch}

Function MoneyToStr(rMoney : double; iDecs : byte = 2) : String;

{  Function FormReal(Rnum : double; Dig, Dec : Integer) : string;
  Var
    TmpStr  :  string;
  Begin{FormReal}
{    TmpStr:='';
    Str(Rnum:Dig:Dec,TmpStr);
    Result := TmpStr;
  end;{FormReal}

begin
{  Result := FormReal(rMoney,0,iDecs);
  if Result = '-0.00' then Result := '0.00';}
  Result := FloatToStrF(rMoney, ffFixed, 15, iDecs);
end;

function StringToCodes(sString : string) : string;
var
  iPos : integer;
begin
  Result := '';
  For iPos := 1 to Length(sString) do begin
    Result := Result + '#' + IntToStr(Ord(sString[iPos]));
  end;{for}
end;

function GetThFromInt(iFraction : integer): string;
var
  cLastDigit : char;
begin
  if iFraction = 0 then
    begin
      GetThFromInt := ''
    end
  else begin
    if (iFraction = 11) or (iFraction = 12) or (iFraction = 13) then
      begin
        GetThFromInt := 'th';
      end
    else begin
      cLastDigit := copy(IntToStr(iFraction),length(IntToStr(iFraction)),1)[1];
      case cLastDigit of
        '1' : begin
          GetThFromInt := 'st';
        end;

        '2' : begin
          GetThFromInt := 'nd';
        end;

        '3' : begin
          GetThFromInt := 'rd';
        end;

        '4', '5', '6', '7', '8', '9', '0' : begin
          GetThFromInt := 'th';
        end;
      end;{CASE}
    end;{IF}
  end;{IF}
end;

function StringListToString(slStringList : TStringList) : String;
var
  iPos : integer;
begin
  Result := '';
  For iPos := 0 to slStringList.count-1 do
  begin
    if iPos = slStringList.count-1 then Result := Result + slStringList[iPos]
    else Result := Result + slStringList[iPos] + ', ';
  end;{for}
end;

function RemoveAllCharsExcept(sString, sExcept : string) : string;
var
  iPos : integer;
begin
  Result := '';
  For iPos := 1 to length(sString) do
  begin
    if Pos(sString[iPos], sExcept) > 0 then Result := Result + sString[iPos];
  end;{for}
end;

function DateToScreenDate(dDate : TDateTime) : string;
begin
  Result := Str8ToScreenDate(DateToStr8(dDate));
end;

function TimeToScreenTime(tTime : TDateTime) : string;
begin
  Result := Str6ToScreenTime(TimeToStr6(tTime));
end;


end.
