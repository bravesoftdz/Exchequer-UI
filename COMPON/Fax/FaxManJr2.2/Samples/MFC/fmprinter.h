#if !defined(AFX_FMPRINTER_H__09DD5D6F_ED3C_4E3E_8F6B_802549A40EC5__INCLUDED_)
#define AFX_FMPRINTER_H__09DD5D6F_ED3C_4E3E_8F6B_802549A40EC5__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// Machine generated IDispatch wrapper class(es) created by Microsoft Visual C++

// NOTE: Do not modify the contents of this file.  If this class is regenerated by
//  Microsoft Visual C++, your modifications will be overwritten.

/////////////////////////////////////////////////////////////////////////////
// CFmPrinter wrapper class

class CFmPrinter : public CWnd
{
protected:
	DECLARE_DYNCREATE(CFmPrinter)
public:
	CLSID const& GetClsid()
	{
		static CLSID const clsid
			= { 0xce1191a2, 0x543e, 0x4e06, { 0xa9, 0xd1, 0xad, 0xcb, 0xfc, 0xd5, 0xd3, 0x68 } };
		return clsid;
	}
	virtual BOOL Create(LPCTSTR lpszClassName,
		LPCTSTR lpszWindowName, DWORD dwStyle,
		const RECT& rect,
		CWnd* pParentWnd, UINT nID,
		CCreateContext* pContext = NULL)
	{ return CreateControl(GetClsid(), lpszWindowName, dwStyle, rect, pParentWnd, nID); }

    BOOL Create(LPCTSTR lpszWindowName, DWORD dwStyle,
		const RECT& rect, CWnd* pParentWnd, UINT nID,
		CFile* pPersist = NULL, BOOL bStorage = FALSE,
		BSTR bstrLicKey = NULL)
	{ return CreateControl(GetClsid(), lpszWindowName, dwStyle, rect, pParentWnd, nID,
		pPersist, bStorage, bstrLicKey); }

// Attributes
public:

// Operations
public:
	BOOL IsPrinterInstalled();
	BOOL InstallPrinter(const VARIANT& ApplicationPath);
	LPDISPATCH PrinterDefaults();
	BOOL GetLogPrinterInstallation();
	void SetLogPrinterInstallation(BOOL bNewValue);
	CString GetPrinterName();
	void SetPrinterName(LPCTSTR lpszNewValue);
	long GetPrintJobCount();
	LPDISPATCH GetNextPrintJob();
	CString GetLastErrorString();
	long GetLastError();
	CString GetPrintFilesPath();
	void SetPrintFilesPath(LPCTSTR lpszNewValue);
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_FMPRINTER_H__09DD5D6F_ED3C_4E3E_8F6B_802549A40EC5__INCLUDED_)
