�
 TFORM1 0�  TPF0TForm1Form1Left� TopWidth�HeightRCaptionWinHTTP demo
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OnResize
FormResizePixelsPerInch`
TextHeight 	TGroupBox	GroupBox1Left Top Width�Height9AlignalTopCaption WinHTTP Browser :-) TabOrder  TLabelLabel1LeftTop(Width/HeightCaption
Output to:  TLabelLabel2LeftTopWidthHeightCaptionURL:  	TComboBoxURLComboLeft(TopWidth	Height
ItemHeightItems.Stringshttp://www.appcontrols.com TabOrder   TRadioButtonOut1Left4Top&Width[HeightCaptionMemo (below)Checked	TabOrderTabStop	  TRadioButtonOut2Left� Top&WidthqHeightCaptionFile (c:\httptest.dat)TabOrder  TPanelPanel1Left5TopWidthZHeight(AlignalRight
BevelOuterbvNoneTabOrder TButtonGOBtnLeftTop Width+HeightCaptionGODefault	TabOrder OnClick
GOBtnClick  TButtonSTOPBtnLeft-Top Width+HeightCaptionSTOPTabOrderOnClickSTOPBtnClick    	TGroupBox	GroupBox2Left TopcWidth�Height� AlignalClientCaption -= OUTPUT=-TabOrder TLabelLabel5LeftToprWidth�HeightAlignalBottomCaptionHeaders:  TMemoMemo1LeftTopWidth�HeightcAlignalClientLines.Strings.Welcome to demo program for WinHTTP component. QHere you can test its simple features, download web-pages,  images, data-files,  Poutput of CGI  programs to *this* memo or to temporary file ("c:\httptest.dat"). KJust enter the URL in the edit box above and click "GO" button to download 5the data from the Web or "Stop" to abort downloading. IUse POSTData edit box to enter some data which should be sent to the CGI :script. Leave it blank if you don't want to POST any data. KStatus of the HTTP requests and downloading progress will displayed in the status bar below. JTo test the WinHTTP with more advanced features just open the source code Gof this project and play with various WinHTTP properties in the Object QInspector. (e.g: Proxy settings,  Cache Options and Internet Options, additional HTTP headers etc) ReadOnly	
ScrollBars
ssVerticalTabOrder   TMemoMemo2LeftTopWidth�Height:AlignalBottom
ScrollBars
ssVerticalTabOrder   	TGroupBox	GroupBox3Left Top9Width�Height*AlignalTopCaptionM POST query (intended to transmit some data to CGI program with POST method) TabOrder TLabelLabel3LeftTopWidth7HeightCaption	POSTData:  TLabelLabel4Left� TopWidthHeightCaption;(leave this field blank if you don't want to POST any data)  TEditPOSTEditLeft@TopWidth� HeightTabOrder    
TStatusBar
StatusBar1Left TopWidth�HeightPanelsWidth, StylepsOwnerDrawWidth2  SimplePanelSizeGrip TProgressBarProgressBar1Left/TopWidthaHeightMin MaxdTabOrder    TWinHTTPWinHTTP1AcceptTypes*/*Agent[-=WinHTTP demo=-]InternetOptionsioIgnoreCertificateInvalidioKeepConnection ShowGoOnlineMessage	OnHeaderInfoWinHTTP1HeaderInfoOnDoneWinHTTP1Done
OnProgressWinHTTP1Progress	OnAbortedWinHTTP1Aborted
OnConnLostWinHTTP1ConnLostOnHTTPErrorWinHTTP1HTTPErrorOnHostUnreachableWinHTTP1HostUnreachableOnPasswordRequestWinHTTP1PasswordRequestLeftTopb   