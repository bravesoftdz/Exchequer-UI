// Machine generated IDispatch wrapper class(es) created by Microsoft Visual C++

// NOTE: Do not modify the contents of this file.  If this class is regenerated by
//  Microsoft Visual C++, your modifications will be overwritten.


#include "stdafx.h"
#include "fmprinter.h"

/////////////////////////////////////////////////////////////////////////////
// CFmPrinter

IMPLEMENT_DYNCREATE(CFmPrinter, CWnd)

/////////////////////////////////////////////////////////////////////////////
// CFmPrinter properties

/////////////////////////////////////////////////////////////////////////////
// CFmPrinter operations

BOOL CFmPrinter::IsPrinterInstalled()
{
	BOOL result;
	InvokeHelper(0x1, DISPATCH_METHOD, VT_BOOL, (void*)&result, NULL);
	return result;
}

BOOL CFmPrinter::InstallPrinter(const VARIANT& ApplicationPath)
{
	BOOL result;
	static BYTE parms[] =
		VTS_VARIANT;
	InvokeHelper(0x2, DISPATCH_METHOD, VT_BOOL, (void*)&result, parms,
		&ApplicationPath);
	return result;
}

LPDISPATCH CFmPrinter::PrinterDefaults()
{
	LPDISPATCH result;
	InvokeHelper(0x3, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, NULL);
	return result;
}

BOOL CFmPrinter::GetLogPrinterInstallation()
{
	BOOL result;
	InvokeHelper(0x4, DISPATCH_PROPERTYGET, VT_BOOL, (void*)&result, NULL);
	return result;
}

void CFmPrinter::SetLogPrinterInstallation(BOOL bNewValue)
{
	static BYTE parms[] =
		VTS_BOOL;
	InvokeHelper(0x4, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 bNewValue);
}

CString CFmPrinter::GetPrinterName()
{
	CString result;
	InvokeHelper(0x5, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
	return result;
}

void CFmPrinter::SetPrinterName(LPCTSTR lpszNewValue)
{
	static BYTE parms[] =
		VTS_BSTR;
	InvokeHelper(0x5, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 lpszNewValue);
}

long CFmPrinter::GetPrintJobCount()
{
	long result;
	InvokeHelper(0x6, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

LPDISPATCH CFmPrinter::GetNextPrintJob()
{
	LPDISPATCH result;
	InvokeHelper(0x7, DISPATCH_METHOD, VT_DISPATCH, (void*)&result, NULL);
	return result;
}

CString CFmPrinter::GetLastErrorString()
{
	CString result;
	InvokeHelper(0x8, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
	return result;
}

long CFmPrinter::GetLastError()
{
	long result;
	InvokeHelper(0x9, DISPATCH_PROPERTYGET, VT_I4, (void*)&result, NULL);
	return result;
}

CString CFmPrinter::GetPrintFilesPath()
{
	CString result;
	InvokeHelper(0xa, DISPATCH_PROPERTYGET, VT_BSTR, (void*)&result, NULL);
	return result;
}

void CFmPrinter::SetPrintFilesPath(LPCTSTR lpszNewValue)
{
	static BYTE parms[] =
		VTS_BSTR;
	InvokeHelper(0xa, DISPATCH_PROPERTYPUT, VT_EMPTY, NULL, parms,
		 lpszNewValue);
}
