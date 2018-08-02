Unit oAnonymisationDiaryDataWrite;

Interface

Uses ADODB, SysUtils, oBaseDataWrite, oDataPacket;

Type
  TAnonymisationDiaryDataWrite = Class(TBaseDataWrite)
  Private
    FADOQuery : TADOQuery;

    adEntityTypeParam, adEntityCodeParam, adAnonymisationDateParam : TParameter;
  Public
    Constructor Create;
    Destructor Destroy; Override;

    // Called from the SQL Write Threads to provide basic info required for SQL Execution
    Procedure Prepare (Const ADOConnection : TADOConnection; Const CompanyCode : ShortString); Override;

    // Implemented in descendant classes to (a) populate the ADO Query with the data from the DataPacket and
    // (b) return the ADOQuery in use by the descendant
    Procedure SetQueryValues (Var ADOQuery : TADOQuery; Const DataPacket : TDataPacket; Var SkipRecord : Boolean); Override;
  End; // TAnonymisationDiaryDataWrite

Implementation

Uses oAnonymisationDiaryBtrieveFile;

//=========================================================================

Constructor TAnonymisationDiaryDataWrite.Create;
Begin // Create
  Inherited Create;
  FADOQuery := TADOQuery.Create(NIL);
End; // Create

//------------------------------

Destructor TAnonymisationDiaryDataWrite.Destroy;
Begin // Destroy
  FADOQuery.Connection := Nil;
  FADOQuery.Free;
  Inherited Destroy;
End; // Destroy

//-------------------------------------------------------------------------

// Called from the SQL Write Threads to provide basic info required for SQL Execution
Procedure TAnonymisationDiaryDataWrite.Prepare (Const ADOConnection : TADOConnection; Const CompanyCode : ShortString);
Var
  sqlQuery : ANSIString;
Begin // Prepare
  Inherited Prepare (ADOConnection, CompanyCode);

  // Link the ADO Connection into the Query so it can access the data
  FADOQuery.Connection := ADOConnection;

  // Setup the SQL Query and prepare it
  sqlQuery := 'INSERT INTO [COMPANY].ANONYMISATIONDIARY (' +
                                                         'adEntityType, ' +
                                                         'adEntityCode, ' +
                                                         'adAnonymisationDate' +
                                                       ') ' +
                                                'VALUES (' +
                                                         ':adEntityType, ' +
                                                         ':adEntityCode, ' +
                                                         ':adAnonymisationDate' +
                                                         ')';
  FADOQuery.SQL.Text := StringReplace(sqlQuery, '[COMPANY]', '[' + Trim(CompanyCode) + ']', [rfReplaceAll]);
  FADOQuery.Prepared := True;

  // Setup references to the parameters so we can directly access them for each row instead of having
  // to search for them each time
  With FADOQuery.Parameters Do
  Begin
    adEntityTypeParam := FindParam('adEntityType');
    adEntityCodeParam := FindParam('adEntityCode');
    adAnonymisationDateParam := FindParam('adAnonymisationDate');
  End; // With FADOQuery.Parameters
End; // Prepare

//-------------------------------------------------------------------------

// Sets the values of the private parameters prior to inserting the data
Procedure TAnonymisationDiaryDataWrite.SetQueryValues (Var ADOQuery : TADOQuery; Const DataPacket : TDataPacket; Var SkipRecord : Boolean);
Var
  DataRec : ^AnonymisationDiaryRecType;
Begin // SetParameterValues
  // Return the ADOQuery instance for this data
  ADOQuery := FADOQuery;

  // Redirect the local record to point to the data buffer in the Data Packet
  DataRec := DataPacket.dpData;

  // Populate the TParameter objects with the data - which populates the Query values
  adEntityTypeParam.Value := Ord(DataRec^.adEntityType);
  adEntityCodeParam.Value := DataRec^.adEntityCode;
  adAnonymisationDateParam.Value := DataRec^.adAnonymisationDate;
End; // SetParameterValues

//=========================================================================

End.

