�
 TPROGTFORM 0r  TPF0
TProgTForm	ProgTFormLeft� Top� Cursor
crAppStartBorderIconsbiSystemMenu
biMinimize BorderStylebsSingleCaptionObjectThread ControllerClientHeight� ClientWidthColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 	FormStyle
fsMDIChild
KeyPreview	OldCreateOrder	Position	poDefaultScaledShowHint	Visible	OnClose	FormCloseOnCloseQueryFormCloseQueryOnCreate
FormCreate	OnKeyDownFormKeyDown
OnKeyPressFormKeyPressOnShowFormShowPixelsPerInch`
TextHeight TSBSBackGroupSBSBackGroup2LeftTop� Width!Height=TextId   TSBSBackGroupSBSBackGroup1Left&Top�Width� Height� TextId   Label8Label82Left,TopFWidth{Height	AlignmenttaCenterAutoSizeCaptionJob Queue for ThreadsFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTextId   Label8Label83Left
Top� WidthHeight	AlignmenttaCenterAutoSizeCaption!Speed Priority of Selected ThreadFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTextId   Label8Label85Left.TopWidthyHeight	AlignmenttaCenterAutoSizeCaptionThreadsFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTextId   	TSBSPanel	SBSPanel1LeftTop[Width!Height?
BevelInnerbvRaised
BevelOuter	bvLoweredTabOrder
AllowReSize
IsGroupBoxTextId  Label8Label81LeftTopWidth� Height	AlignmenttaCenterAutoSizeCaption% Complete of Selected ThreadFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTextId   	TSBSPanel	SBSPanel2LeftTop!WidthHeight
BevelInner	bvLowered
BevelOuterbvNoneTabOrder AllowReSize
IsGroupBoxTextId  TGaugeGauge1LeftTopWidthHeight	BackColor	clBtnFaceBorderStylebsNoneColorclBlack	ForeColorclAquaParentColorProgress     TButton	CanCP1BtnTagLeft�TopWidthPHeightHintsAbort current thread|Choosing this option will abort the currently running thread, as shown within the Threads box.Cancel	Caption&AbortModalResultTabOrder OnClickCanCP1BtnClick  TListBoxListBox1Left+TopUWidth|Height|Hint�List of waiting jobs|This box shows all the jobs currently waiting for an available thread to process them. Specific jobs like reports belong to specific threads, reports are always processed by thread 2.
ItemHeightTabOrder  	TSBSPanel	SBSPanel3LeftTopWidth!HeightV
BevelInnerbvRaised
BevelOuter	bvLoweredTabOrderAllowReSize
IsGroupBoxTextId  Label8Label1Left	TopWidthHeight	AlignmenttaCenterAutoSizeFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTextId   Label8Label2LeftTopWidthHeight	AlignmenttaCenterAutoSizeFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTextId   Label8Label3LeftTop(WidthHeight	AlignmenttaCenterAutoSizeFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFontTextId   Label8Label4LeftTop<WidthHeight	AlignmenttaCenterAutoSizeFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height�	Font.NameArial
Font.StylefsBold 
ParentFontTextId    TButtonMU1BtnTagLeft�TopUWidthPHeightHint�Move queue entry up|This button allows you to change the priority of a waiting job so that it will start before the job above it. Before using it, you must highlight the entry you wish to move up.Caption	Move  &UpTabOrderOnClickMU1BtnClick  TButtonMD1BtnTagLeft�TopnWidthPHeightHint�Move queue entry down|This button allows you to change the priority of a waiting job so that it will start after the job below it. Before using it, you must highlight the entry you wish to move down.Caption
Move D&ownTabOrderOnClickMU1BtnClick  TButtonDelBtnTagLeft�Top� WidthPHeightHintMDelete waiting job|This option removes the currently highlighted queue entry.Caption&DeleteTabOrderOnClickDelBtnClick  	TBorRadioThc1TagLeft-TopWidthyHeightHintlDisplay thread 1|By clicking on the radio button you can display the details of the job running in thread 1.AlignalRightChecked	Enabled
GroupIndexTabOrderTabStop	TextId OnClick	Thc1Click  	TBorRadioThc2TagLeft-Top%WidthyHeightHintlDisplay thread 2|By clicking on the radio button you can display the details of the job running in thread 2.AlignalRightEnabled
GroupIndexTabOrderVisibleTextId OnClick	Thc1Click  	TBorRadioThc3TagLeft-Top.WidthyHeightHintlDisplay thread 3|By clicking on the radio button you can display the details of the job running in thread 3.AlignalRightEnabled
GroupIndexTabOrderTextId OnClick	Thc1Click  	TTrackBar	TrackBar1LeftTop� WidthHeight!HintpChange the speed of the current job|The more processing time a thread gets, the less time the main program gets.LineSizeMaxOrientationtrHorizontal	FrequencyPosition SelEnd SelStart TabOrder		TickMarks	tmTopLeft	TickStyletsAutoOnChangeTrackBar1Change  TButtonTermBtnTagLeft�TopWidthPHeightHint�Terminate current thread|Choosing this option will terminate the currently running thread. Use only when the thread apprears to have crashed, and abort has no effect.Cancel	Caption
&TerminateEnabledModalResultTabOrderOnClickTermBtnClick   