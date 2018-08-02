{***************************************************************************}
{ TAdvPreviewMeu component                                                  }
{ for Delphi & C++Builder                                                   }
{ version 1.1                                                               }
{                                                                           }
{ written by TMS Software                                                   }
{            copyright � 2006 - 2007                                        }
{            Email : info@tmssoftware.com                                   }
{            Web : http://www.tmssoftware.com                               }
{                                                                           }
{ The source code is given as is. The author is not responsible             }
{ for any possible damage done due to the use of this code.                 }
{ The component can be freely used in any application. The complete         }
{ source code remains property of the author and may not be distributed,    }
{ published, given or sold in any form as such. No parts of the source      }
{ code can be included in any other component or application without        }
{ written authorization of the author.                                      }
{***************************************************************************}

unit AdvPreviewMenu;

{$I TMSDEFS.INC}

interface

uses
  Classes, Windows, Forms, Dialogs, Controls, Graphics, Messages, ExtCtrls,
  SysUtils, Math, AdvGDIP, GDIPicture, AdvHintInfo, ImgList, Menus, AdvStyleIF,
  AdvGlowButton, ActnList;

const
  MAJ_VER = 1; // Major version nr.
  MIN_VER = 1; // Minor version nr.
  REL_VER = 2; // Release nr.
  BLD_VER = 0; // Build nr.

  MENUARROW_WIDTH = 24;
  MINITEM_HEIGHT = 12;
  SHADOW_WIDTH = 4;
  SCROLL_HEIGHT = 10;

  // version history
  // v1.1.0.0 : Added support for Actions and Visible property in items
  // v1.1.0.1 : Fixed issue with setting Actions & menu item captions
  // v1.1.0.2 : Fixed issue with subitems scroller
  // v1.1.1.0 : Added separator support in SubMenuItem
  // v1.1.2.0 : Fixed issue with updates from Actions
  
type
  TAdvPreviewMenu = class;
  TButtonCollectionItem = class;
  TAdvPreviewSubMenuItem = class;
  TAdvPreviewMenuItem = class;
  
  TDrawPosition = (dwpLeft, dwpTop, dwpRight, dwpBottom);

  TButtonItemActionLink = class(TActionLink)
  protected
    FClient: TButtonCollectionItem;
    procedure AssignClient(AClient: TObject); override;
    function IsCaptionLinked: Boolean; override;
    function IsCheckedLinked: Boolean; override;
    function IsEnabledLinked: Boolean; override;
    function IsHelpContextLinked: Boolean; override;
    function IsHintLinked: Boolean; override;
{$IFDEF DELPHI6_LVL}
    function IsGroupIndexLinked: Boolean; override;
{$ENDIF}
    function IsImageIndexLinked: Boolean; override;
    function IsShortCutLinked: Boolean; override;
    function IsVisibleLinked: Boolean; override;
    function IsOnExecuteLinked: Boolean; override;
    procedure SetCaption(const Value: string); override;
    procedure SetEnabled(Value: Boolean); override;
    procedure SetImageIndex(Value: Integer); override;
    procedure SetVisible(Value: Boolean); override;
    procedure SetOnExecute(Value: TNotifyEvent); override;
  end;
  TButtonItemActionLinkClass = class of TButtonItemActionLink;

  TButtonItemClickEvent = procedure (Sender: TObject; Button: TButtonCollectionItem) of object;

  TButtonCollectionItem = class(TCollectionItem)
  private
    FCaption: string;
    FVisible: Boolean;
    FTag: integer;
    FImageIndex: Integer;
    FEnabled: boolean;
    FIPicture: TGDIPPicture;
    FIDisabledPicture: TGDIPPicture;
    FOfficeHint: TAdvHintInfo;
    FFont: TFont;
    FWidth: Integer;
    FOnClick: TButtonItemClickEvent;
    FActionLink: TButtonItemActionLink;
    procedure PictureChanged(Sender: TObject);
    procedure OnFontChanged(Sender: TObject);
    procedure SetCaption(const Value: string);
    procedure SetVisible(const Value: Boolean);
    procedure SetImageIndex(const Value: Integer);
    procedure SetEnabled(const Value: boolean);
    procedure SetDisabledPicture(const Value: TGDIPPicture);
    procedure SetPicture(const Value: TGDIPPicture);
    procedure SetOfficeHint(const Value: TAdvHintInfo);
    procedure SetFont(const Value: TFont);
    function GetAction: TBasicAction;
    procedure SetAction(const Value: TBasicAction);
    procedure DoActionChange(Sender: TObject);
  protected
    function GetDisplayName: string; override;
    procedure SetIndex(Value: Integer); override;
    procedure Refresh;
    function GetActionLinkClass: TButtonItemActionLinkClass; dynamic;
    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); dynamic;
    property ActionLink: TButtonItemActionLink read FActionLink write FActionLink;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property Action: TBasicAction read GetAction write SetAction;
    property Caption: string read FCaption write SetCaption;
    property Enabled: boolean read FEnabled write SetEnabled default true;
    property ImageIndex: Integer read FImageIndex write SetImageIndex default -1;
    property DisabledPicture: TGDIPPicture read FIDisabledPicture write SetDisabledPicture;
    property Picture: TGDIPPicture read FIPicture write SetPicture;
    property OfficeHint: TAdvHintInfo read FOfficeHint write SetOfficeHint;
    property Tag: integer read FTag write FTag default 0;
    property Font: TFont read FFont write SetFont;
    property Width: Integer read FWidth write FWidth;
    property Visible: Boolean read FVisible write SetVisible default true;

    property OnClick: TButtonItemClickEvent read FOnClick write FOnClick;
  end;

  TButtonCollection = class(TCollection)
  private
    FOwner: TPersistent;
    FPreviewMenu: TAdvPreviewMenu;
    function GetItem(Index: Integer): TButtonCollectionItem;
    procedure SetItem(Index: Integer; const Value: TButtonCollectionItem);
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(AOwner: TPersistent);
    property Items[Index: Integer]: TButtonCollectionItem read GetItem write SetItem; default;
    function Add: TButtonCollectionItem;
    procedure Delete(Index: Integer);
    function Insert(Index: Integer): TButtonCollectionItem;
  end;

  TSubItemActionLink = class(TActionLink)
  protected
    FClient: TAdvPreviewSubMenuItem;
    procedure AssignClient(AClient: TObject); override;
    function IsCaptionLinked: Boolean; override;
    function IsCheckedLinked: Boolean; override;
    function IsEnabledLinked: Boolean; override;
    function IsHelpContextLinked: Boolean; override;
    function IsHintLinked: Boolean; override;
{$IFDEF DELPHI6_LVL}
    function IsGroupIndexLinked: Boolean; override;
{$ENDIF}
    function IsImageIndexLinked: Boolean; override;
    function IsShortCutLinked: Boolean; override;
    function IsVisibleLinked: Boolean; override;
    function IsOnExecuteLinked: Boolean; override;
    procedure SetCaption(const Value: string); override;
    procedure SetEnabled(Value: Boolean); override;
    procedure SetImageIndex(Value: Integer); override;
    procedure SetVisible(Value: Boolean); override;
    procedure SetOnExecute(Value: TNotifyEvent); override;
  end;
  TSubItemActionLinkClass = class of TSubItemActionLink;


  //TSubItemClickEvent = procedure (Sender: TObject; SubMenuItem: TAdvPreviewSubMenuItem) of object;

  TAdvPreviewSubMenuItem = class(TCollectionItem)
  private
    FTitle: string;
    FImageIndex: Integer;
    FEnabled: boolean;
    FIPicture: TGDIPPicture;
    FIDisabledPicture: TGDIPPicture;
    FOfficeHint: TAdvHintInfo;
    FNotes: TStringList;
    FSubMenu: TPopupMenu;
    FShortCutHint: string;
    FShortCutHintShowing: Boolean;
    FOnClick: TNotifyEvent;
    FVisible: Boolean;
    FActionLink: TSubItemActionLink;
    FTag: integer;
    FWideTitle: widestring;
    FWideNotes: widestring;
    FSeparator: Boolean;
    procedure PictureChanged(Sender: TObject);
    procedure SetTitle(const Value: string);
    procedure SetImageIndex(const Value: Integer);
    procedure SetEnabled(const Value: boolean);
    procedure SetDisabledPicture(const Value: TGDIPPicture);
    procedure SetPicture(const Value: TGDIPPicture);
    procedure SetOfficeHint(const Value: TAdvHintInfo);
    procedure SetNotes(const Value: TStringList);
    procedure SetSubMenu(const Value: TPopupMenu);
    function GetAction: TBasicAction;
    procedure SetAction(Value: TBasicAction);
    procedure DoActionChange(Sender: TObject);
    function IsTitleStored: Boolean;
    function IsEnabledStored: Boolean;
    function IsImageIndexStored: Boolean;
    function IsOnClickStored: Boolean;
    function IsVisibleStored: Boolean;
    procedure SetWideTitle(const Value: widestring);
    procedure SetWideNotes(const Value: widestring);
    procedure SetSeparator(const Value: Boolean);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure Loaded;
    function GetActionLinkClass: TSubItemActionLinkClass; dynamic;
    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); dynamic;
    property ActionLink: TSubItemActionLink read FActionLink write FActionLink;
    function GetDisplayName: string; override;
    procedure SetIndex(Value: Integer); override;

    property ShortCutHintShowing: Boolean read FShortCutHintShowing write FShortCutHintShowing;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure InitiateAction; virtual;
    procedure Click;
  published
    property Action: TBasicAction read GetAction write SetAction;
    property Title: string read FTitle write SetTitle stored IsTitleStored;
    property WideTitle: widestring read FWideTitle write SetWideTitle;
    property Notes: TStringList read FNotes write SetNotes;
    property WideNotes: widestring read FWideNotes write SetWideNotes;
    property Enabled: boolean read FEnabled write SetEnabled  stored IsEnabledStored default true;
    property ImageIndex: Integer read FImageIndex write SetImageIndex  stored IsImageIndexStored default -1;
    property DisabledPicture: TGDIPPicture read FIDisabledPicture write SetDisabledPicture;
    property Picture: TGDIPPicture read FIPicture write SetPicture;
    property OfficeHint: TAdvHintInfo read FOfficeHint write SetOfficeHint;
    property Separator: Boolean read FSeparator write SetSeparator default False;
    property SubMenu: TPopupMenu read FSubMenu write SetSubMenu;
    property ShortCutHint: string read FShortCutHint write FShortCutHint;
    property Tag: integer read FTag write FTag default 0;
    property Visible: Boolean read FVisible write FVisible stored IsVisibleStored;

    property OnClick: TNotifyEvent{TSubItemClickEvent} read FOnClick write FOnClick stored IsOnClickStored;
  end;

  TAdvPreviewSubMenuItems = class(TCollection)
  private
    FOwner: TPersistent;
    FPreviewMenu: TAdvPreviewMenu;
    function GetItem(Index: Integer): TAdvPreviewSubMenuItem;
    procedure SetItem(Index: Integer; const Value: TAdvPreviewSubMenuItem);
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(AOwner: TPersistent);
    property Items[Index: Integer]: TAdvPreviewSubMenuItem read GetItem write SetItem; default;
    function Add: TAdvPreviewSubMenuItem;
    procedure Delete(Index: Integer);
    function Insert(Index: Integer): TAdvPreviewSubMenuItem;
    procedure InitiateActions;
  end;


{ TItemActionLink }

  TItemActionLink = class(TActionLink)
  protected
    FClient: TAdvPreviewMenuItem;
    procedure AssignClient(AClient: TObject); override;
    //function IsAutoCheckLinked: Boolean; virtual;
    function IsCaptionLinked: Boolean; override;
    function IsCheckedLinked: Boolean; override;
    function IsEnabledLinked: Boolean; override;
    function IsHelpContextLinked: Boolean; override;
    function IsHintLinked: Boolean; override;
{$IFDEF DELPHI6_LVL}
    function IsGroupIndexLinked: Boolean; override;
{$ENDIF}    
    function IsImageIndexLinked: Boolean; override;
    function IsShortCutLinked: Boolean; override;
    function IsVisibleLinked: Boolean; override;
    function IsOnExecuteLinked: Boolean; override;
    //procedure SetAutoCheck(Value: Boolean); override;
    procedure SetCaption(const Value: string); override;
    //procedure SetChecked(Value: Boolean); override;
    procedure SetEnabled(Value: Boolean); override;
    //procedure SetHelpContext(Value: THelpContext); override;
    //procedure SetHint(const Value: string); override;
    procedure SetImageIndex(Value: Integer); override;
    //procedure SetShortCut(Value: TShortCut); override;
    procedure SetVisible(Value: Boolean); override;
    procedure SetOnExecute(Value: TNotifyEvent); override;
  end;
  TItemActionLinkClass = class of TItemActionLink;


  //TItemClickEvent = procedure (Sender: TObject; Item: TAdvPreviewMenuItem) of object;

  TAdvPreviewMenuItem = class(TCollectionItem)
  private
    FCaption: string;
    FTag: integer;
    FImageIndex: Integer;
    FEnabled: boolean;
    FIPicture: TGDIPPicture;
    FIDisabledPicture: TGDIPPicture;
    FOfficeHint: TAdvHintInfo;
    FSubItems: TAdvPreviewSubMenuItems;
    FSubMenuCaption: string;
    FSeparator: Boolean;
    FSubMenuItemSpacing: Integer;
    FSubMenuItemIndex: Integer;
    FCanSelect: Boolean;
    FShortCutSubItemsHint: string;
    FShortCutHint: string;
    FShortCutHintShowing: Boolean;
    FShortCutSubItemHintShowing: Boolean;
    FOnClick: TNotifyEvent;
    FVisible: Boolean;
    FActionLink: TItemActionLink;
    FWideCaption: widestring;
    FWideSubMenuCaption: widestring;
    procedure PictureChanged(Sender: TObject);
    procedure SetCaption(const Value: string);
    procedure SetImageIndex(const Value: Integer);
    procedure SetEnabled(const Value: boolean);
    procedure SetDisabledPicture(const Value: TGDIPPicture);
    procedure SetPicture(const Value: TGDIPPicture);
    procedure SetOfficeHint(const Value: TAdvHintInfo);
    procedure SetSubItems(const Value: TAdvPreviewSubMenuItems);
    procedure SetSubMenuCaption(const Value: string);
    procedure SetSeparator(const Value: Boolean);
    procedure SetSubMenuItemSpacing(const Value: Integer);
    procedure SetSubMenuItemIndex(const Value: Integer);
    function GetAction: TBasicAction;
    procedure SetAction(Value: TBasicAction);
    procedure DoActionChange(Sender: TObject);
    function IsCaptionStored: Boolean;
    function IsEnabledStored: Boolean;
    function IsImageIndexStored: Boolean;
    function IsOnClickStored: Boolean;
    function IsVisibleStored: Boolean;
    procedure SetWideCaption(const Value: widestring);
    procedure SetWideSubMenuCaption(const Value: widestring);
  protected
    procedure AssignTo(Dest: TPersistent); override;
    procedure Loaded;
    function GetActionLinkClass: TItemActionLinkClass; dynamic;
    procedure ActionChange(Sender: TObject; CheckDefaults: Boolean); dynamic;
    property ActionLink: TItemActionLink read FActionLink write FActionLink;
    function GetDisplayName: string; override;
    procedure SetIndex(Value: Integer); override;

    property ShortCutHintShowing: Boolean read FShortCutHintShowing write FShortCutHintShowing;
    property ShortCutSubItemHintShowing: Boolean read FShortCutSubItemHintShowing write FShortCutSubItemHintShowing;
    property SubMenuItemIndex: Integer read FSubMenuItemIndex write SetSubMenuItemIndex;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure InitiateAction; virtual;
    procedure Click;
  published
    property Action: TBasicAction read GetAction write SetAction;
    property CanSelect: Boolean read FCanSelect write FCanSelect;
    property Caption: string read FCaption write SetCaption stored IsCaptionStored;
    property WideCaption: widestring read FWideCaption write SetWideCaption;
    property Enabled: boolean read FEnabled write SetEnabled stored IsEnabledStored default true;
    property ImageIndex: Integer read FImageIndex write SetImageIndex stored IsImageIndexStored default -1;
    property DisabledPicture: TGDIPPicture read FIDisabledPicture write SetDisabledPicture;
    property Picture: TGDIPPicture read FIPicture write SetPicture;
    property OfficeHint: TAdvHintInfo read FOfficeHint write SetOfficeHint;
    property SubItems: TAdvPreviewSubMenuItems read FSubItems write SetSubItems;
    property SubMenuCaption: string read FSubMenuCaption write SetSubMenuCaption;
    property WideSubMenuCaption: widestring read FWideSubMenuCaption write SetWideSubMenuCaption;
    property Separator: Boolean read FSeparator write SetSeparator;
    property SubMenuItemSpacing: Integer read FSubMenuItemSpacing write SetSubMenuItemSpacing;
    property ShortCutHint: string read FShortCutHint write FShortCutHint;
    property ShortCutSubItemsHint: string read FShortCutSubItemsHint write FShortCutSubItemsHint;
    property Tag: integer read FTag write FTag default 0;
    property Visible: Boolean read FVisible write FVisible stored IsVisibleStored;

    property OnClick: TNotifyEvent{TItemClickEvent} read FOnClick write FOnClick stored IsOnClickStored;
  end;

  TAdvPreviewMenuItems = class(TCollection)
  private
    FOwner: TPersistent;
    function GetItem(Index: Integer): TAdvPreviewMenuItem;
    procedure SetItem(Index: Integer; const Value: TAdvPreviewMenuItem);
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(AOwner: TPersistent);
    property Items[Index: Integer]: TAdvPreviewMenuItem read GetItem write SetItem; default;
    function Add: TAdvPreviewMenuItem;
    procedure Delete(Index: Integer);
    function Insert(Index: Integer): TAdvPreviewMenuItem;
    procedure InitiateActions;
  end;

  TAdvCustomPreviewMenuPanel = class(TCustomControl)
  private
    FOwner: TComponent;
    FOnShouldHide: TNotifyEvent;
    FShowBorder: Boolean;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  protected
    procedure Paint; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

    property OnShouldHide: TNotifyEvent read FOnShouldHide write FOnShouldHide;
    property ShowBorder: Boolean read FShowBorder write FShowBorder;

    procedure InitializeAndUpdate; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
  end;

  TButtonClickEvent = procedure (Sender: TObject; ButtonIndex: Integer) of object;
  TMenuItemClickEvent = procedure (Sender: TObject; ItemIndex: Integer) of object;
  TSubMenuItemClickEvent = procedure (Sender: TObject; ItemIndex, SubMenuItemIndex: Integer) of object;
  TMenuDrawItemEvent = procedure(Sender: TObject; Canvas: TCanvas; ItemIndex: integer; R: TRect) of object;
  TSubMenuDrawItemEvent = procedure(Sender: TObject; Canvas: TCanvas; ItemIndex, SubMenuItemIndex: integer; R: TRect) of object;
  TDrawButtonFrameTopEvent = procedure (Sender: TObject; Canvas: TCanvas; R: TRect) of object;

  TMenuItemScroller = class(TObject)
  private
    FMin: integer;
    FMax: integer;
    FPosition: integer;
    procedure SetMax(const Value: integer);
    procedure SetMin(const Value: integer);
    procedure SetPosition(const Value: integer);
    function GetVisible: Boolean;
  public
    constructor Create;
    function CanGoForward: Boolean;
    function CanGoBack: Boolean;
    property Min: integer read FMin write SetMin;
    property Max: integer read FMax write SetMax;
    property Position: integer read FPosition write SetPosition;
    property Visible: Boolean read GetVisible;
  end;

  TAdvPreviewMenuPanel = class(TAdvCustomPreviewMenuPanel)
  private
    FOwner: TComponent;
    FAdvPreviewMenu: TAdvPreviewMenu;
    FLeftFrameRect: TRect;
    FRightFrameRect: TRect;
    FItemIndex: Integer;
    FItemHot: Integer;
    FItemDown: Integer;
    FItemHeight: Integer;
    FImageSpace: Integer;
    FLineSpace: Integer;
    FButtonList: TList;
    FSubMenuItem: Integer;
    FSubMenuItemHeight: Integer;
    FSubMenuItemHot: Integer;
    FSubMenuItemDown: Integer;
    FSubMenuCaptionHeight: Integer;
    FSubMenuPopup: TPopupMenu;
    FInternalHideSubMenuPopup: Boolean;
    FHintItemIndex: Integer;
    FHintSubMenuItemIndex: Integer;
    FOfficeHint: TAdvHintInfo;
    FIgnoreMouseMove: Boolean;
    FShortCutItemHintShowing: Boolean;
    FShortCutSubMenuItemHintShowing: Boolean;
    FShortCutChars: string;
    FButtonPartHot: Boolean;
    FDropDownPartHot: Boolean;
    FInternalClick: Boolean;
    FMouseTimer: TTimer;
    FMouseSetHot: Boolean;
    FMouseItemHot: Integer;
    FSubMenuScroller: TMenuItemScroller;
    FSubMenuVisibleItemCount: Integer;
    FTopSubMenuItem: Integer;
    FSubMenuScollUpHot: Boolean;
    FSubMenuScollUpDown: Boolean;
    FSubMenuScollDownHot: Boolean;
    FSubMenuScollDownDown: Boolean;
    FSubMenuScrolling: Boolean;
    FSelectedItem: Integer;    // For Editor use
    FSelectedSubItem: Integer; // For Editor use
    FHintItem: Integer;        // For Editor use
    FHintSubItem: Integer;     // For Editor use
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure OnButtonClick(Sender: TObject);
    procedure OnMouseTimer(Sender: TObject);
    procedure SetItemHot(const Value: Integer);
    procedure SetSubMenuItemHot(const Value: integer);
    procedure SetSubMenuItem(const Value: Integer);
    procedure SetOfficeHint(const Value: TAdvHintInfo);
  protected
    FEditorCreated: Boolean;
    procedure Paint; override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

    procedure DrawItems;
    procedure DrawItem(Index: Integer; RefreshItem: Boolean = false);
    procedure DrawSubMenuItems(ACanvas: TCanvas = nil);
    procedure DrawSubMenuItem(AIndex: Integer; RefreshItem: Boolean = false; ACanvas: TCanvas = nil);
    procedure DrawRightFrame(WithItems: Boolean = True);
    procedure DrawUpScrollBtn;
    procedure DrawDownScrollBtn;

    function ItemAtPos(X, Y: Integer): Integer;
    procedure SelectItem(Index: Integer);

    function GetSubMenuItems: TAdvPreviewSubMenuItems;
    function SubMenuItemAtPos(X, Y: Integer): Integer; overload;
    function SubMenuItemAtPos(X, Y: Integer; var SubItem: TAdvPreviewSubMenuItem): Integer; overload;
    procedure SelectSubMenuItem(Index: Integer);

    procedure HideMenuWindow;
    procedure InternalClickSubItem(SubIndex: Integer);
    procedure CheckKeyPress(Key: Word);
    procedure CheckMouseMove(X, Y: Integer);
    procedure ShowSubMenuPopup(AIndex: Integer);
    procedure HideSubMenuPopup;

    procedure ItemHotNext;
    procedure ItemHotPrevious;
    procedure SubMenuItemHotNext;
    procedure SubMenuItemHotPrevious;

    procedure ShowAllItemsShortCutHint;
    procedure HideAllItemsShortCutHint;
    procedure ShowItemShortCutHint(Index: Integer);
    procedure HideItemShortCutHint(Index: Integer);
    procedure DrawItemShortCutHint(Index: Integer);
    procedure DrawItemSubItemShortCutHint(Index: Integer);
    procedure ShowItemSubItemShortCutHint(Index: Integer);
    procedure HideItemSubItemShortCutHint(Index: Integer);

    procedure ShowAllSubMenuItemsShortCutHint;
    procedure HideAllSubMenuItemsShortCutHint;
    procedure DrawSubMenuItemShortCutHint(Index: Integer);
    procedure ShowSubMenuItemShortCutHint(Index: Integer);
    procedure HideSubMenuItemShortCutHint(Index: Integer);

    procedure InvalidateTopFrame;
    procedure InvalidateLeftFrame;
    procedure InvalidateRightFrame;
    function GetTopFrameRect: TRect;
    function GetItemFramesRect: TRect;
    function GetLeftFrameRect: TRect;
    function GetRightFrameRect: TRect;
    function GetItemRect(Index: Integer): TRect;   // RealIndex
    function GetItemDropDownRect(Index: Integer): TRect;
    function GetItemHeight: Integer;
    procedure GetMaxItemSize(var AHeight, AWidth: Integer);
    function RealIndexToVisItemIndex(Index: Integer): Integer;
    function VisIndexToRealItemIndex(Index: Integer): Integer;
    function VisibleItemsCount: Integer;
    function GetUpScrollBtnRect: TRect;
    function GetDownScrollBtnRect: TRect; 

    function GetSubMenuCaptionRect: TRect;
    function GetSubMenuItemRect(Index: Integer): TRect;
    function GetSubMenuItemHeight: Integer;
    procedure GetSubMenuMaxItemSize(Index: Integer; var AHeight, AWidth: Integer; SubMenuItems: TAdvPreviewSubMenuItems = nil); overload;
    procedure GetSubMenuMaxItemSize(var AHeight, AWidth: Integer); overload;
    procedure CalculateSubMenuItemSize;
    function RealIndexToVisSubItemIndex(Index: Integer): Integer;
    function VisIndexToRealSubItemIndex(Index: Integer): Integer;
    function VisibleSubItemCount(ItemIndex: Integer): Integer;

    procedure InitializeScroller;
    procedure UpdateScroller;
    procedure ChangeTopSubMenuItemTo(Value: Integer);
    function ScrollSubMenu(Value: Integer): Integer;
    procedure InvalidateSubMenuScroller;
    procedure SubMenuScrollUpClick;
    procedure SubMenuScrollDownClick;
    procedure SubMenuScrollInView(Index: Integer);

    procedure SetSelectedItem(Index: Integer);
    property SelectedItem: Integer read FSelectedItem;
    procedure SetSelectedSubItem(Index: Integer);
    property SelectedSubItem: Integer read FSelectedSubItem;
    
    property ItemHot: integer read FItemHot write SetItemHot;
    property SubMenuItem: Integer read FSubMenuItem write SetSubMenuItem;
    property SubMenuItemHot: integer read FSubMenuItemHot write SetSubMenuItemHot;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure InitializeAndUpdate; override;
  published
    property AdvPreviewMenu: TAdvPreviewMenu read FAdvPreviewMenu write FAdvPreviewMenu;
    property OfficeHint: TAdvHintInfo read FOfficeHint write SetOfficeHint;
  end;

  TPreviewMenuWindow = class(TCustomForm)
  private
    FHideOnDeActivate: Boolean;
    FOwner: TComponent;
    FShowBorder: Boolean;
    FHideTimer: TTimer;
    FBorderColor: TColor;
    FPreviewMenuPanel: TAdvCustomPreviewMenuPanel;
    procedure WMActivate(var Message: TWMActivate); message WM_ACTIVATE;
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
    procedure CMDialogChar(var Message: TCMDialogChar); message CM_DIALOGCHAR;
    procedure HideTimerOnTime(Sender: TObject);
  protected
    procedure Loaded; override;
    procedure Paint; override;
    function GetParentWnd: HWnd;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;

    procedure UpdateSize;

    property HideOnDeActivate: Boolean read FHideOnDeActivate write FHideOnDeActivate;
    property ShowBorder: Boolean read FShowBorder write FShowBorder;
    property BorderColor: TColor read FBorderColor write FBorderColor;
    property PreviewMenuPanel: TAdvCustomPreviewMenuPanel read FPreviewMenuPanel write FPreviewMenuPanel;
  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
    destructor Destroy; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
  published
{$IFDEF TMSDOTNET}
    property AutoScroll;
    property BorderIcons;
    property BorderWidth;
    property Ctl3D;
    property FormStyle;
    property OnHide;
{$ENDIF}
  end;

  TVistaBackground = class(TPersistent)
  private
    FSteps: Integer;
    FColor: TColor;
    FColorTo: TColor;
    FOnChange: TNotifyEvent;
    FColorMirror: TColor;
    FColorMirrorTo: TColor;
    FBorderColor: TColor;
    FGradientMirror: TGDIPGradient;
    FGradient: TGDIPGradient;
    FCaptionBackground: TColor;
    procedure SetColor(const Value: TColor);
    procedure SetColorTo(const Value: TColor);
    procedure SetSteps(const Value: Integer);
    procedure Changed;
    procedure SetBorderColor(const Value: TColor);
    procedure SetColorMirror(const Value: TColor);
    procedure SetColorMirrorTo(const Value: TColor);
    procedure SetGradient(const Value: TGDIPGradient);
    procedure SetGradientMirror(const Value: TGDIPGradient);
  protected
  public
    constructor Create;
    procedure Assign(Source: TPersistent); override;
  published
    property BorderColor: TColor read FBorderColor write SetBorderColor;
    property CaptionBackground: TColor read FCaptionBackground write FCaptionBackground;
    property Color: TColor read FColor write SetColor;
    property ColorTo: TColor read FColorTo write SetColorTo;
    property ColorMirror: TColor read FColorMirror write SetColorMirror;
    property ColorMirrorTo: TColor read FColorMirrorTo write SetColorMirrorTo;
    property Gradient: TGDIPGradient read FGradient write SetGradient;
    property GradientMirror: TGDIPGradient read FGradientMirror write SetGradientMirror;
    property Steps: Integer read FSteps write SetSteps default 64;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  TSelectionAppearance = class(TGlowButtonAppearance)
  private
    FTextColor: TColor;
    FTextColorDisabled: TColor;
    FTextColorDown: TColor;
    FTextColorHot: TColor;
    FTextColorChecked: TColor;
    FRounded: Boolean;
    FFont: TFont;
    FSubItemFont: TFont;
    FSubItemTitleFont: TFont;
    FSystemFont: boolean;
    procedure SetTextColor(const Value: TColor);
    procedure SetTextColorChecked(const Value: TColor);
    procedure SetTextColorDisabled(const Value: TColor);
    procedure SetTextColorDown(const Value: TColor);
    procedure SetTextColorHot(const Value: TColor);
    procedure SetRounded(const Value: Boolean);
    procedure SetFont(const Value: TFont);
    procedure SetSubItemFont(const Value: TFont);
    procedure SetSubItemTitleFont(const Value: TFont);
    procedure SetSystemFont(const Value: boolean);
  protected
  public
    constructor Create;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property Font: TFont read FFont write SetFont;
    property SubItemTitleFont: TFont read FSubItemTitleFont write SetSubItemTitleFont;
    property SubItemFont: TFont read FSubItemFont write SetSubItemFont;
    property SystemFont: boolean read FSystemFont write SetSystemFont default true;
    property TextColor: TColor read FTextColor write SetTextColor;
    property TextColorHot: TColor read FTextColorHot write SetTextColorHot;
    property TextColorDown: TColor read FTextColorDown write SetTextColorDown;
    property TextColorChecked: TColor read FTextColorChecked write SetTextColorChecked;
    property TextColorDisabled: TColor read FTextColorDisabled write SetTextColorDisabled;
    property Rounded: Boolean read FRounded write SetRounded;
  end;
  
  TAdvCustomPreviewMenuStyler = class(TComponent)
  private
    FButtonAppearance: TGlowbuttonAppearance;
    FMenuItemAppearance: TSelectionAppearance;
    FFrameAppearance: TVistaBackGround;
    FRightFrameColor: TColor;
    FLeftFrameColor: TColor;
    FRightFrameBorderColor: TColor;
    procedure SetButtonAppearance(const Value: TGlowbuttonAppearance);
    procedure SetFrameAppearance(const Value: TVistaBackGround);
    procedure SetMenuItemAppearance(const Value: TSelectionAppearance);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    //property AutoThemeAdapt: boolean read FAutoThemeAdapt write FAutoThemeAdapt default False;
    //property TMSStyle: TTMSStyle read FTMSStyle write FTMSStyle;
    procedure Change(PropID: integer = 0);

    property FrameAppearance: TVistaBackGround read FFrameAppearance write SetFrameAppearance;
    property LeftFrameColor: TColor read FLeftFrameColor write FLeftFrameColor;
    property RightFrameColor: TColor read FRightFrameColor write FRightFrameColor;
    property RightFrameBorderColor: TColor read FRightFrameBorderColor write FRightFrameBorderColor;
    property MenuItemAppearance: TSelectionAppearance read FMenuItemAppearance write SetMenuItemAppearance;
    property ButtonAppearance: TGlowbuttonAppearance read FButtonAppearance write SetButtonAppearance;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  end;

  TAdvPreviewMenu = class(TComponent)
  private
    FOwner: TComponent;
    FButtonImages: TImageList;
    FMenuItems: TAdvPreviewMenuItems;
    FStyler: TAdvCustomPreviewMenuStyler;
    FInternalStyler: TAdvCustomPreviewMenuStyler;
    FCurrentStyler: TAdvCustomPreviewMenuStyler;
    FMenuSpacing: Integer;
    FPreviewMenuWindow: TPreviewMenuWindow;
    FAdvPreviewMenuPanel: TAdvPreviewMenuPanel;
    FButtons: TButtonCollection;
    FButtonSpacing: Integer;
    FButtonHeight: Integer;
    FTopFrameHeight: Integer;
    FOffSetX: Integer;
    FMenuImages: TCustomImageList;
    FSubMenuImages: TCustomImageList;
    FShowHint: Boolean;
    FOnButtonClick: TButtonClickEvent;
    FOnMenuItemClick: TMenuItemClickEvent;
    FOnSubMenuItemClick: TSubMenuItemClickEvent;
    FOnMenuDrawItem: TMenuDrawItemEvent;
    FOnSubMenuDrawItem: TSubMenuDrawItemEvent;
    FSubMenuItemSpacing: Integer;
    FSubMenuCaption: string;
    FSubMenuItems: TAdvPreviewSubMenuItems;
    FOnDrawButtonFrameTop: TDrawButtonFrameTopEvent;
    FOnPreviewHide: TNotifyEvent;
    FSubMenuWidth: Integer;
    FMenuWidth: Integer;
    FWideSubMenuCaption: widestring;
    FMenuShowing: Boolean;
    procedure OnPreviewMenuWindowHide(Sender: TObject);
    procedure OnPreviewMenuWindowClose(Sender: TObject; var Action: TCloseAction);
    procedure SetButtonImages(const Value: TImageList);
    procedure SetMenuItems(const Value: TAdvPreviewMenuItems);
    procedure SetStyler(const Value: TAdvCustomPreviewMenuStyler);
    function GetVersion: string;
    procedure SetVersion(const Value: string);
    procedure SetButtons(const Value: TButtonCollection);
    function GetBottomFrameHeight: Integer;
    procedure SetMenuImages(const Value: TCustomImageList);
    procedure SetSubMenuImages(const Value: TCustomImageList);
    procedure SetSubMenuItems(const Value: TAdvPreviewSubMenuItems);
    function GetVisible: Boolean;
  protected
    FEditorCreated: Boolean;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    procedure InvalidateTopFrame;
    procedure InvalidateMenu;
    procedure DrawMenuItem(Index: Integer);
    procedure InitializeMenu;
    procedure GetMenuSize(var W, H: Integer);

    property TopFrameHeight: Integer read FTopFrameHeight;
    property BottomFrameHeight: Integer read GetBottomFrameHeight;
    property OffSetX: Integer read FOffSetX;
    property Visible: Boolean read GetVisible;
    property OnPreviewHide: TNotifyEvent read FOnPreviewHide write FOnPreviewHide;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function GetVersionNr: integer;
    procedure ShowMenu(X, Y: Integer);
    procedure HideMenu;

    procedure ShowShortCutHints;
    procedure HideShortCutHints;
    
    property OnDrawButtonFrameTop: TDrawButtonFrameTopEvent read FOnDrawButtonFrameTop write FOnDrawButtonFrameTop;
  published
    property Buttons: TButtonCollection read FButtons write SetButtons;
    property ButtonSpacing: Integer read FButtonSpacing write FButtonSpacing;
    property ButtonHeight: Integer read FButtonHeight write FButtonHeight;
    property MenuItems: TAdvPreviewMenuItems read FMenuItems write SetMenuItems;
    property MenuSpacing: Integer read FMenuSpacing write FMenuSpacing;
    property MenuImages: TCustomImageList read FMenuImages write SetMenuImages;
    property MenuWidth: Integer read FMenuWidth write FMenuWidth;
    property SubMenuWidth: Integer read FSubMenuWidth write FSubMenuWidth;
    property SubMenuItems: TAdvPreviewSubMenuItems read FSubMenuItems write SetSubMenuItems;
    property SubMenuCaption: string read FSubMenuCaption write FSubMenuCaption;
    property WideSubMenuCaption: widestring read FWideSubMenuCaption write FWideSubMenuCaption;
    property SubMenuItemSpacing: Integer read FSubMenuItemSpacing write FSubMenuItemSpacing;

    property SubMenuImages: TCustomImageList read FSubMenuImages write SetSubMenuImages;
    property ButtonImages: TImageList read FButtonImages write SetButtonImages;
    property Styler: TAdvCustomPreviewMenuStyler read FStyler write SetStyler;
    property ShowHint: Boolean read FShowHint write FShowHint;
    property Version: string read GetVersion write SetVersion;

    property OnButtonClick: TButtonClickEvent read FOnButtonClick write FOnButtonClick;
    property OnMenuItemClick: TMenuItemClickEvent read FOnMenuItemClick write FOnMenuItemClick;
    property OnSubMenuItemClick: TSubMenuItemClickEvent read FOnSubMenuItemClick write FOnSubMenuItemClick;
    property OnMenuDrawItem: TMenuDrawItemEvent read FOnMenuDrawItem write FOnMenuDrawItem;
    property OnSubMenuDrawItem: TSubMenuDrawItemEvent read FOnSubMenuDrawItem write FOnSubMenuDrawItem;
  end;

  TPreviewMenuControl = class(TCustomControl)
  private
    FOwner: TComponent;
    FAdvPreviewMenu: TAdvPreviewMenu;
    FAdvPreviewMenuPanel: TAdvPreviewMenuPanel;
    //procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure OnPreviewPanelResize(Sender: TObject);
  protected
    procedure Paint; override;
    procedure CreatePreviewMenu;
    procedure DestroyPreviewMenu;
    procedure Resize; override;
    {procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    }
    //property ShowBorder: Boolean read FShowBorder write FShowBorder;
    //procedure InitializeAndUpdate; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    procedure AssignMenu(PreviewMenu: TAdvPreviewMenu);

    property AdvPreviewMenu: TAdvPreviewMenu read FAdvPreviewMenu;
    property AdvPreviewMenuPanel: TAdvPreviewMenuPanel read FAdvPreviewMenuPanel;
    property OnResize;
  end;

var
  ForceEnableAction: Boolean = False;

implementation

{$IFDEF DELPHI9_LVL}
uses
  Types;
{$ENDIF}

//------------------------------------------------------------------------------

function BrightnessColor(Col: TColor; Brightness: integer): TColor; overload;
var
  r1,g1,b1: Integer;
begin
  Col := ColorToRGB(Col);
  r1 := GetRValue(Col);
  g1 := GetGValue(Col);
  b1 := GetBValue(Col);

  if r1 = 0 then
    r1 := Max(0,Brightness)
  else
    r1 := Round( Min(100,(100 + Brightness))/100 * r1 );

  if g1 = 0 then
    g1 := Max(0,Brightness)
  else
    g1 := Round( Min(100,(100 + Brightness))/100 * g1 );

  if b1 = 0 then
    b1 := Max(0,Brightness)
  else
    b1 := Round( Min(100,(100 + Brightness))/100 * b1 );

  Result := RGB(r1,g1,b1);
end;

//------------------------------------------------------------------------------

function BrightnessColor(Col: TColor; BR,BG,BB: integer): TColor; overload;
var
  r1,g1,b1: Integer;
begin
  Col := Longint(ColorToRGB(Col));
  r1 := GetRValue(Col);
  g1 := GetGValue(Col);
  b1 := GetBValue(Col);

  if r1 = 0 then
    r1 := Max(0,BR)
  else
    r1 := Round( Min(100,(100 + BR))/100 * r1 );

  if g1 = 0 then
    g1 := Max(0,BG)
  else
    g1 := Round( Min(100,(100 + BG))/100 * g1 );

  if b1 = 0 then
    b1 := Max(0,BB)
  else
    b1 := Round( Min(100,(100 + BB))/100 * b1 );

  Result := RGB(r1,g1,b1);
end;

//------------------------------------------------------------------------------

function ColorToARGB(Color: TColor): ARGB;
var
  c: TColor;
begin
  c := ColorToRGB(Color);
  Result := ARGB( $FF000000 or ((DWORD(c) and $FF) shl 16) or ((DWORD(c) and $FF00) or ((DWORD(c) and $ff0000) shr 16)));
end;

//------------------------------------------------------------------------------

function BlendColor(Col1,Col2:TColor; BlendFactor:Integer): TColor;
var
  r1,g1,b1: Integer;
  r2,g2,b2: Integer;

begin
  if BlendFactor >= 100 then
  begin
    Result := Col1;
    Exit;
  end;
  if BlendFactor <= 0 then
  begin
    Result := Col2;
    Exit;
  end;

  Col1 := Longint(ColorToRGB(Col1));
  r1 := GetRValue(Col1);
  g1 := GetGValue(Col1);
  b1 := GetBValue(Col1);

  Col2 := Longint(ColorToRGB(Col2));
  r2 := GetRValue(Col2);
  g2 := GetGValue(Col2);
  b2 := GetBValue(Col2);

  r1 := Round( BlendFactor/100 * r1 + (1 - BlendFactor/100) * r2);
  g1 := Round( BlendFactor/100 * g1 + (1 - BlendFactor/100) * g2);
  b1 := Round( BlendFactor/100 * b1 + (1 - BlendFactor/100) * b2);

  Result := RGB(r1,g1,b1);
end;

//------------------------------------------------------------------------------

procedure DrawRoundRect(graphics: TGPGraphics; Pen: TGPPen; X,Y,Width,Height,Radius: integer);
var
  path:TGPGraphicsPath;
begin
  path := TGPGraphicsPath.Create;
  path.AddLine(X + radius, Y, X + width - (radius*2), Y);
  path.AddArc(X + width - (radius*2), Y, radius*2, radius*2, 270, 90);
  path.AddLine(X + width, Y + radius, X + width, Y + height - (radius*2));
  path.AddArc(X + width - (radius*2), Y + height - (radius*2), radius*2, radius*2,0,90);
  path.AddLine(X + width - (radius*2), Y + height, X + radius, Y + height);
  path.AddArc(X, Y + height - (radius*2), radius*2, radius*2, 90, 90);
  path.AddLine(X, Y + height - (radius*2), X, Y + radius);
  path.AddArc(X, Y, radius*2, radius*2, 180, 90);
  path.CloseFigure;
  graphics.DrawPath(pen, path);
  path.Free;
end;

//------------------------------------------------------------------------------

procedure DrawRect(graphics: TGPGraphics; Pen: TGPPen; X,Y,Width,Height: integer);
var
  path:TGPGraphicsPath;
begin
  path := TGPGraphicsPath.Create;
  path.AddLine(X, Y, X + width, Y);
  path.AddLine(X + width, Y, X + width, Y + height);
  path.AddLine(X + width, Y + height, X, Y + height);
  path.AddLine(X, Y + height, X, Y);
  path.CloseFigure;
  graphics.DrawPath(pen, path);
  path.Free;
end;

//------------------------------------------------------------------------------

procedure DrawOpenRoundRectMiddle(graphics: TGPGraphics; PC: TColor; X,Y,Width,Height,Radius: integer;Hot:boolean);
var
  path:TGPGraphicsPath;
  gppen:TGPPen;

begin
  path := TGPGraphicsPath.Create;

  gppen := tgppen.Create(ColorToARGB(PC),1);
  path.AddLine(X-1, Y + height, X + width, Y + height);
  graphics.DrawPath(gppen, path);
  path.Free;

  path := TGPGraphicsPath.Create;
  path.AddLine(X-1, Y, X + width, Y);
  graphics.DrawPath(gppen, path);
  gppen.Free;
  path.Free;

  path := TGPGraphicsPath.Create;
  gppen := tgppen.Create(ColorToARGB(BrightnessColor(PC,-5)),1);
  path.AddLine(X + Width, Y, X + width, Y + Height);
  graphics.DrawPath(gppen, path);
  gppen.Free;
  path.Free;

  if hot then
  begin
    path := TGPGraphicsPath.Create;
    gppen := tgppen.Create(ColorToARGB(BrightnessColor(PC,-5)),1);
    path.AddLine(X  , Y, X    , Y + Height);
    graphics.DrawPath(gppen, path);
    gppen.Free;
    path.Free;
  end
  else
  begin
    path := TGPGraphicsPath.Create;
    // 3D color effect
    gppen := tgppen.Create(ColorToARGB(BrightnessColor(clwhite,-10)),1);
    path.AddLine(X, Y + 2, X, Y + Height - 2);
    graphics.DrawPath(gppen, path);
    gppen.Free;
    path.Free;
  end;
end;


//------------------------------------------------------------------------------

procedure DrawOpenRoundRectLeft(graphics: TGPGraphics; PC:TColor; X,Y,Width,Height,Radius: integer);
var
  path:TGPGraphicsPath;
  gppen:TGPPen;
begin
  path := TGPGraphicsPath.Create;
  gppen := tgppen.Create(ColorToARGB(PC),1);
  path.AddLine(X + width , Y + height, X + radius, Y + height);
  path.AddArc(X, Y + height - (radius*2), radius*2, radius*2, 90, 90);
  path.AddLine(X, Y + height - (radius*2), X, Y + radius);
  path.AddArc(X, Y, radius*2, radius*2, 180, 90);
  path.AddLine(X + radius, Y, X + width, Y);
  graphics.DrawPath(gppen, path);
  gppen.Free;
  path.Free;

  path := TGPGraphicsPath.Create;
  gppen := tgppen.Create(ColorToARGB(BrightnessColor(PC,-5)),1);
  path.AddLine(X + Width , Y, X + width , Y + Height);
  graphics.DrawPath(gppen, path);
  gppen.Free;
  path.Free;

end;

//------------------------------------------------------------------------------

procedure DrawOpenRoundRectRight(graphics: TGPGraphics; PC: TColor; X,Y,Width,Height,Radius: integer;Hot: boolean);
var
  path:TGPGraphicsPath;
  gppen:TGPPen;
begin
  path := TGPGraphicsPath.Create;
  gppen := tgppen.Create(ColorToARGB(PC),1);
  path.AddLine(X, Y, X + width - (radius *2), Y);
  path.AddArc(X + width - (radius*2), Y, radius*2, radius*2, 270, 90);
  path.AddLine(X + width, Y + radius, X + width, Y + height - (radius*2));
  path.AddArc(X + width - (radius*2), Y + height - (radius*2), radius*2, radius*2,0,90);
  path.AddLine(X + width - (radius*2), Y + height, X, Y + height);
  graphics.DrawPath(gppen, path);
  gppen.Free;

  path.Free;


  if hot then
  begin
    path := TGPGraphicsPath.Create;
    gppen := tgppen.Create(ColorToARGB(BrightnessColor(PC,-5)),1);
    path.AddLine(X  , Y, X    , Y + Height);
    graphics.DrawPath(gppen, path);
    gppen.Free;
    path.Free;
  end
  else
  begin
    path := TGPGraphicsPath.Create;
    // 3D color effect
    gppen := tgppen.Create(ColorToARGB(BrightnessColor(clwhite,-10)),1);
    path.AddLine(X, Y + 2, X, Y + Height - 2);
    graphics.DrawPath(gppen, path);
    gppen.Free;
    path.Free;
  end;
end;

//------------------------------------------------------------------------------

function DrawVistaText(Canvas: TCanvas; Alignment: TAlignment; r: TRect; Caption:string; AFont: TFont; Enabled: Boolean; RealDraw: Boolean; AntiAlias: TAntiAlias; Direction: TDrawPosition): TRect;
var
  graphics : TGPGraphics;
  w,h: Integer;
  fontFamily: TGPFontFamily;
  font: TGPFont;
  rectf: TGPRectF;
  stringFormat: TGPStringFormat;
  solidBrush: TGPSolidBrush;
  x1,y1,x2,y2: single;
  fs: integer;
  sizerect: TGPRectF;
  szRect: TRect;
  DTFLAG: DWORD;
begin
  if (Caption <> '') then
  begin
    graphics := TGPGraphics.Create(Canvas.Handle);
    fontFamily:= TGPFontFamily.Create(AFont.Name);
    fs := 0;

    font := TGPFont.Create(fontFamily, AFont.Size , fs, UnitPoint);
    graphics.SetSmoothingMode(SmoothingModeAntiAlias);

    w := R.Right - R.Left;
    h := R.Bottom - R.Top;

    x1 := r.Left;
    y1 := r.Top;
    x2 := w;
    y2 := h;

    rectf := MakeRect(x1,y1,x2,y2);

    stringFormat := nil;
    if RealDraw then
    begin
      case (Direction) of
        dwpTop, dwpBottom: stringFormat := TGPStringFormat.Create;
        dwpLeft:
        begin
          stringFormat := TGPStringFormat.Create; //($00000002);
        end;
        dwpRight: stringFormat := TGPStringFormat.Create($00000002);
      end;
    end
    else
      stringFormat := TGPStringFormat.Create;


    if Enabled then
      solidBrush := TGPSolidBrush.Create(ColorToARGB(AFont.Color))
    else
      solidBrush := TGPSolidBrush.Create(ColorToARGB(clGray));

    case Alignment of
      taLeftJustify: stringFormat.SetAlignment(StringAlignmentNear);
      taCenter:
      begin
        // Center-justify each line of text.
        stringFormat.SetAlignment(StringAlignmentCenter);
      end;
      taRightJustify: stringFormat.SetAlignment(StringAlignmentFar);
    end;

    // Center the block of text (top to bottom) in the rectangle.
    stringFormat.SetLineAlignment(StringAlignmentCenter);

    stringFormat.SetHotkeyPrefix(HotkeyPrefixShow);

    //graphics.SetTextRenderingHint(TextRenderingHintClearTypeGridFit);
    //graphics.MeasureString(Caption, Length(Caption), font, rectf, stringFormat, sizerect);
    case AntiAlias of
    aaClearType:graphics.SetTextRenderingHint(TextRenderingHintClearTypeGridFit);
    aaAntiAlias:graphics.SetTextRenderingHint(TextRenderingHintAntiAlias);
    end;

    if AntiAlias = aaNone then
    begin
      szRect.Left := round(rectf.X);
      szRect.Top := round(rectf.Y);

      szRect.Right := szRect.Left + 2;
      szRect.Bottom := DrawText(Canvas.Handle,PChar(Caption),Length(Caption), szrect, DT_CALCRECT or DT_LEFT or DT_WORDBREAK);

      sizeRect.X := szRect.Left;
      sizeRect.Y := szRect.Top;
      sizeRect.Width := szRect.Right - szRect.Left;
      sizeRect.Height := szRect.Bottom - szRect.Top;
    end
    else
      graphics.MeasureString(Caption, Length(Caption), font, rectf, stringFormat, sizerect);


    Result := Rect(round(sizerect.X), Round(sizerect.Y), Round(sizerect.X + sizerect.Width), Round(sizerect.Y + sizerect.Height));
    rectf := MakeRect(x1,y1,x2,y2);

    if RealDraw then
    begin
      //graphics.DrawString(Caption, Length(Caption), font, rectf, stringFormat, solidBrush);
      if AntiAlias = aaNone then
      begin
        szRect.Left := round(rectf.X);
        szRect.Top := round(rectf.Y);
        szRect.Right := szRect.Left + round(rectf.Width);
        szRect.Bottom := szRect.Top + round(rectf.Height);
        Canvas.Brush.Style := bsClear;

        DTFLAG := DT_LEFT;
        case Alignment of
        taRightJustify: DTFLAG := DT_RIGHT;
        taCenter: DTFLAG := DT_CENTER;
        end;
        DrawText(Canvas.Handle,PChar(Caption),Length(Caption), szrect, DTFLAG or DT_VCENTER or DT_SINGLELINE)
      end
      else
        graphics.DrawString(Caption, Length(Caption), font, rectf, stringFormat, solidBrush);
    end;
      
    stringformat.Free;
    solidBrush.Free;
    font.Free;
    fontfamily.Free;
    graphics.Free;
  end;
end;

//------------------------------------------------------------------------------

procedure DrawVistaGradient(Canvas: TCanvas; r: TRect; CFU, CTU, CFB, CTB, PC: TColor;
   GradientU,GradientB: TGDIPGradient; Caption:string; AFont: TFont;
   Images: TImageList; ImageIndex: integer; EnabledImage: Boolean; Layout: TButtonLayout;
   DropDownButton: Boolean; DrawDwLine: Boolean; Enabled: Boolean; Focus: Boolean; DropDownPos: TDropDownPosition;
   Picture: TGDIPPicture; AntiAlias: TAntiAlias; RoundEdges: Boolean; RotateLeftRight: Boolean; Direction: TDrawPosition; Graph: TGPGraphics; ButtonPos: TButtonPosition); overload;
var
  graphics : TGPGraphics;
  path: TGPGraphicsPath;
  pthGrBrush: TGPPathGradientBrush;
  linGrBrush: TGPLinearGradientBrush;
  gppen : tgppen;
  count: Integer;
  w,h,h2,w2: Integer;
  colors : array[0..0] of TGPColor;
  fontFamily: TGPFontFamily;
  font: TGPFont;
  rectf: TGPRectF;
  stringFormat: TGPStringFormat;
  solidBrush: TGPSolidBrush;
  x1,y1,x2,y2: single;
  fs: integer;
  sizerect: TGPRectF;
  ImgX, ImgY, ImgW, ImgH: Integer;
  BtnR, DwR: TRect;
  AP: TPoint;
  szRect: TRect;

  procedure DrawArrow(ArP: TPoint; ArClr: TColor);
  begin
    Canvas.Pen.Color := ArClr;
    Canvas.MoveTo(ArP.X, ArP.Y);
    Canvas.LineTo(ArP.X + 5, ArP.Y);
    Canvas.MoveTo(ArP.X + 1, ArP.Y + 1);
    Canvas.LineTo(ArP.X + 4, ArP.Y + 1);
    Canvas.Pixels[ArP.X + 2, ArP.Y + 2] := ArClr;
  end;

begin
  BtnR := R;
  if DropDownPos = dpRight then
  begin
    DwR := Rect(BtnR.Right - DropDownSectWidth, BtnR.Top, BtnR.Right, BtnR.Bottom);
    if DropDownButton then
      BtnR.Right := DwR.Left;
  end
  else // DropDownPos = doBottom
  begin
    DwR := Rect(BtnR.Left, BtnR.Bottom - DropDownSectWidth, BtnR.Right, BtnR.Bottom);
    if DropDownButton then
      BtnR.Bottom := DwR.Top;
  end;

  w := r.Right - r.Left;
  h := r.Bottom - r.Top;

  h2 := h div 2;
  w2 := w div 2;

  if Assigned(Graph) then
    graphics := Graph
  else
    graphics := TGPGraphics.Create(Canvas.Handle);

  case (Direction) of
    dwpTop:
    begin
      // down ellips brush
      Canvas.Brush.Color := cfb;
      Canvas.FillRect(rect(r.Left , r.top +  h2, r.Right , r.Bottom ));

      // Create a path that consists of a single ellipse.
      path := TGPGraphicsPath.Create;
      //  path.AddRectangle(MakeRect(r.Left, r.Top +  (h div 2), w , h));
      path.AddEllipse(r.Left, r.Top +  h2, w , h);

      pthGrBrush := nil;
      linGrBrush := nil;

      case GradientB of
      ggRadial: pthGrBrush := TGPPathGradientBrush.Create(path);
      ggVertical: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top + h2,w,h2),ColorToARGB(CFB),ColorToARGB(CTB), LinearGradientModeVertical);
      ggDiagonalForward: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top + h2,w,h2),ColorToARGB(CFB),ColorToARGB(CTB), LinearGradientModeForwardDiagonal);
      ggDiagonalBackward: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top + h2,w,h2),ColorToARGB(CFB),ColorToARGB(CTB), LinearGradientModeBackwardDiagonal);
      end;

      if GradientB = ggRadial then
      begin
        pthGrBrush.SetCenterPoint(MakePoint(r.Left + w2, r.Bottom));

        // Set the color at the center point to blue.
        pthGrBrush.SetCenterColor(ColorToARGB(CTB));

        colors[0] := ColorToARGB(CFB);
        count := 1;
        pthGrBrush.SetSurroundColors(@colors, count);
        graphics.FillRectangle(pthGrBrush, r.Left + 1,r.Top + h2, w - 1, h2{+1});
        pthGrBrush.Free;
      end
      else
      begin
        if not RotateLeftRight then
          graphics.FillRectangle(linGrBrush, r.Left + 1,r.Top + h2 + 1, w - 1, h2 - 1)
        else
          graphics.FillRectangle(linGrBrush, r.Left + 1,r.Top + h2 + 1, w - 1, h2 + 1);
        linGrBrush.Free;
      end;

      path.Free;

      Canvas.Brush.Color := cfu;
      //Canvas.FillRect(rect(r.Left + 1, r.Top + 2, r.Right - 1, r.top +  h2));
      Canvas.FillRect(rect(r.Left , r.Top , r.Right , r.top +  h2));

      // Create a path that consists of a single ellipse.
      path := TGPGraphicsPath.Create;
      path.AddEllipse(r.Left, r.Top - h2 , w , h);

      case GradientU of
      ggRadial: pthGrBrush := TGPPathGradientBrush.Create(path);                      // FF: Gradient fix here replace h by h2
      ggVertical: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top,w,h2+1),ColorToARGB(CFU),ColorToARGB(CTU), LinearGradientModeVertical);
      ggDiagonalForward: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top,w,h),ColorToARGB(CFU),ColorToARGB(CTU), LinearGradientModeForwardDiagonal);
      ggDiagonalBackward: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top,w,h),ColorToARGB(CFU),ColorToARGB(CTU), LinearGradientModeBackwardDiagonal);
      end;

      if GradientU = ggRadial then
      begin
        pthGrBrush.SetCenterPoint(MakePoint(r.Left + w2, r.top));

        // Set the color at the center point to blue.
        pthGrBrush.SetCenterColor(ColorToARGB(CTU));

        colors[0] := ColorToARGB(CFU);
        count := 1;
        pthGrBrush.SetSurroundColors(@colors, count);

        graphics.FillRectangle(pthGrBrush, r.Left + 1,r.Top + 1, w - 1, h - h2 - 1);
        pthGrBrush.Free;
      end
      else
      begin
        graphics.FillRectangle(linGrBrush, r.Left + 1,r.Top + 1, w - 1, h2);
        linGrBrush.Free;
      end;

      path.Free;

    end;
    dwpBottom:
    begin
      // down ellips brush
      Canvas.Brush.Color := cfb;
      Canvas.FillRect(rect(r.Left , r.top, r.Right , r.top +  h2));

      // Create a path that consists of a single ellipse.
      path := TGPGraphicsPath.Create;
      //  path.AddRectangle(MakeRect(r.Left, r.Top +  (h div 2), w , h));
      path.AddEllipse(r.Left, r.Top, w , h2);

      pthGrBrush := nil;
      linGrBrush := nil;

      case GradientB of
      ggRadial: pthGrBrush := TGPPathGradientBrush.Create(path);
      ggVertical: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top,w,h2),ColorToARGB(CTB),ColorToARGB(CFB), LinearGradientModeVertical);
      ggDiagonalForward: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top,w,h2),ColorToARGB(CTB),ColorToARGB(CFB), LinearGradientModeForwardDiagonal);
      ggDiagonalBackward: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top,w,h2),ColorToARGB(CTB),ColorToARGB(CFB), LinearGradientModeBackwardDiagonal);
      end;

      if GradientB = ggRadial then
      begin
        pthGrBrush.SetCenterPoint(MakePoint(r.Left + w2, r.Top));

        // Set the color at the center point to blue.
        pthGrBrush.SetCenterColor(ColorToARGB(CTB));

        colors[0] := ColorToARGB(CFB);
        count := 1;
        pthGrBrush.SetSurroundColors(@colors, count);
        graphics.FillRectangle(pthGrBrush, r.Left + 1,r.Top, w - 1, h2+1);
        pthGrBrush.Free;
      end
      else
      begin
        graphics.FillRectangle(linGrBrush, r.Left + 1,r.Top + 1, w - 1, h2 + 1);
        linGrBrush.Free;
      end;

      path.Free;

      Canvas.Brush.Color := cfu;
      Canvas.FillRect(rect(r.Left , r.top +  h2, r.Right , r.Bottom));

      // Create a path that consists of a single ellipse.
      path := TGPGraphicsPath.Create;
      path.AddEllipse(r.Left, r.Bottom - h2 , w , h);

      case GradientU of
      ggRadial: pthGrBrush := TGPPathGradientBrush.Create(path);                      // FF: Gradient fix here replace h by h2
      ggVertical: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top + h2-1,w,h2),ColorToARGB(CTU),ColorToARGB(CFU), LinearGradientModeVertical);
      ggDiagonalForward: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top + h2,w,h),ColorToARGB(CTU),ColorToARGB(CFU), LinearGradientModeForwardDiagonal);
      ggDiagonalBackward: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top + h2,w,h),ColorToARGB(CTU),ColorToARGB(CFU), LinearGradientModeBackwardDiagonal);
      end;

      if GradientU = ggRadial then
      begin
        pthGrBrush.SetCenterPoint(MakePoint(r.Left + w2, r.Bottom));

        // Set the color at the center point to blue.
        pthGrBrush.SetCenterColor(ColorToARGB(CTU));

        colors[0] := ColorToARGB(CFU);
        count := 1;
        pthGrBrush.SetSurroundColors(@colors, count);

        graphics.FillRectangle(pthGrBrush, r.Left + 1,r.Top + h2 + 1, w - 1, h2 - 1);
        pthGrBrush.Free;
      end
      else
      begin
        graphics.FillRectangle(linGrBrush, r.Left + 1,r.Top + h2, w - 1, h2 - 1);
        linGrBrush.Free;
      end;

      path.Free;
    end;
    dwpLeft:
    begin
      // down ellips brush
      Canvas.Brush.Color := cfb;
      Canvas.FillRect(rect(r.Left + w2, r.top, r.Right , r.Bottom));

      // Create a path that consists of a single ellipse.
      path := TGPGraphicsPath.Create;
      //  path.AddRectangle(MakeRect(r.Left, r.Top +  (h div 2), w , h));
      path.AddEllipse(r.Left + w2, r.Top, w , h);

      pthGrBrush := nil;
      linGrBrush := nil;

      case GradientB of
      ggRadial: pthGrBrush := TGPPathGradientBrush.Create(path);
      ggVertical: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left + w2,r.Top,w2,h),ColorToARGB(CFB),ColorToARGB(CTB), LinearGradientModeHorizontal);
      ggDiagonalForward: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left + w2,r.Top,w2,h),ColorToARGB(CFB),ColorToARGB(CTB), LinearGradientModeForwardDiagonal);
      ggDiagonalBackward: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left + w2,r.Top,w2,h),ColorToARGB(CFB),ColorToARGB(CTB), LinearGradientModeBackwardDiagonal);
      end;

      if GradientB = ggRadial then
      begin
        pthGrBrush.SetCenterPoint(MakePoint(r.Right, r.Top + h2));

        // Set the color at the center point to blue.
        pthGrBrush.SetCenterColor(ColorToARGB(CTB));

        colors[0] := ColorToARGB(CFB);
        count := 1;
        pthGrBrush.SetSurroundColors(@colors, count);
        graphics.FillRectangle(pthGrBrush, r.Left + w2, r.Top, w2 + 1, h-1);
        pthGrBrush.Free;
      end
      else
      begin
        graphics.FillRectangle(linGrBrush, r.Left + w2 + 1,r.Top, w2 + 1, h - 1);
        linGrBrush.Free;
      end;

      path.Free;

      Canvas.Brush.Color := cfu;
      //Canvas.FillRect(rect(r.Left + 1, r.Top + 2, r.Right - 1, r.top +  h2));
      Canvas.FillRect(rect(r.Left , r.Top , r.Left + w2 , r.Bottom));

      // Create a path that consists of a single ellipse.
      path := TGPGraphicsPath.Create;
      path.AddEllipse(r.Left - w2, r.Top, w , h);

      case GradientU of
      ggRadial: pthGrBrush := TGPPathGradientBrush.Create(path);                      // FF: Gradient fix here replace h by h2
      ggVertical: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top,w2,h),ColorToARGB(CFU),ColorToARGB(CTU), LinearGradientModeHorizontal);
      ggDiagonalForward: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top,w,h),ColorToARGB(CFU),ColorToARGB(CTU), LinearGradientModeForwardDiagonal);
      ggDiagonalBackward: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top,w,h),ColorToARGB(CFU),ColorToARGB(CTU), LinearGradientModeBackwardDiagonal);
      end;

      if GradientU = ggRadial then
      begin
        pthGrBrush.SetCenterPoint(MakePoint(r.Left, r.top + h2));

        // Set the color at the center point to blue.
        pthGrBrush.SetCenterColor(ColorToARGB(CTU));

        colors[0] := ColorToARGB(CFU);
        count := 1;
        pthGrBrush.SetSurroundColors(@colors, count);

        graphics.FillRectangle(pthGrBrush, r.Left + 1,r.Top + 1, w2 - 1, h - 1);
        pthGrBrush.Free;
      end
      else
      begin
        graphics.FillRectangle(linGrBrush, r.Left + 1,r.Top + 1, w2 - 1, h - 1);
        linGrBrush.Free;
      end;

      path.Free;

    end;
    dwpRight:
    begin
      Canvas.Brush.Color := cfu;
      Canvas.FillRect(rect(r.Right - w2 , r.Top , r.Right ,r.Bottom));

      // Create a path that consists of a single ellipse.
      path := TGPGraphicsPath.Create;
      path.AddEllipse(r.Right - w2, r.Top, w, h);

      pthGrBrush := nil;
      linGrBrush := nil;

      case GradientU of
      ggRadial: pthGrBrush := TGPPathGradientBrush.Create(path);                      // FF: Gradient fix here replace h by h2
      ggVertical: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Right-w2,r.Top,w2,h),ColorToARGB(CTU),ColorToARGB(CFU), LinearGradientModeHorizontal);
      ggDiagonalForward: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Right-w2,r.Top,w,h),ColorToARGB(CTU),ColorToARGB(CFU), LinearGradientModeForwardDiagonal);
      ggDiagonalBackward: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Right-w2,r.Top,w,h),ColorToARGB(CTU),ColorToARGB(CFU), LinearGradientModeBackwardDiagonal);
      end;

      if GradientU = ggRadial then
      begin
        pthGrBrush.SetCenterPoint(MakePoint(r.Right, r.top + h2));

        // Set the color at the center point to blue.
        pthGrBrush.SetCenterColor(ColorToARGB(CTU));

        colors[0] := ColorToARGB(CFU);
        count := 1;
        pthGrBrush.SetSurroundColors(@colors, count);

        graphics.FillRectangle(pthGrBrush, r.Right - w2 + 1,r.Top + 1, w2 - 1, h - 1);
        pthGrBrush.Free;
      end
      else
      begin
        graphics.FillRectangle(linGrBrush, r.Right - w2, r.Top + 1, w2, h - 1);
        linGrBrush.Free;
      end;

      path.Free;

      // down ellips brush
      Canvas.Brush.Color := cfb;
      Canvas.FillRect(rect(r.Left , r.top, r.Left + w2, r.Bottom ));

      // Create a path that consists of a single ellipse.
      path := TGPGraphicsPath.Create;
      //  path.AddRectangle(MakeRect(r.Left, r.Top +  (h div 2), w , h));
      path.AddEllipse(r.Left - w2, r.Top, w , h);

      pthGrBrush := nil;
      linGrBrush := nil;

      case GradientB of
      ggRadial: pthGrBrush := TGPPathGradientBrush.Create(path);
      ggVertical: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top,w2+2,h),ColorToARGB(CTB),ColorToARGB(CFB), LinearGradientModeHorizontal);
      ggDiagonalForward: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top,w2,h),ColorToARGB(CTB),ColorToARGB(CFB), LinearGradientModeForwardDiagonal);
      ggDiagonalBackward: linGrBrush := TGPLinearGradientBrush.Create(MakeRect(r.Left,r.Top,w2,h),ColorToARGB(CTB),ColorToARGB(CFB), LinearGradientModeBackwardDiagonal);
      end;

      if GradientB = ggRadial then
      begin
        pthGrBrush.SetCenterPoint(MakePoint(r.Left, r.Top + h2));

        // Set the color at the center point to blue.
        pthGrBrush.SetCenterColor(ColorToARGB(CTB));

        colors[0] := ColorToARGB(CFB);
        count := 1;
        pthGrBrush.SetSurroundColors(@colors, count);
        graphics.FillRectangle(pthGrBrush, r.Left,r.Top, w2 + 1, h-1);
        pthGrBrush.Free;
      end
      else
      begin
        graphics.FillRectangle(linGrBrush, r.Left,r.Top, w2 + 2, h - 1);
        linGrBrush.Free;
      end;

      path.Free;

    end;
  end;


  gppen := tgppen.Create(ColorToARGB(PC),1);

  graphics.SetSmoothingMode(SmoothingModeAntiAlias);

  if (PC <> clNone) then
  begin
    if not RoundEdges then
      DrawRect(graphics, gppen,r.Left,r.Top, w - 1, h - 1)
    else
    begin
      case ButtonPos of
      bpStandalone: DrawRoundRect(graphics, gppen,r.Left,r.Top, w - 1, h - 1, 3);
      bpLeft: DrawOpenRoundRectLeft(Graphics, PC, r.Left, r.Top, w - 1, h - 1, 3);
      bpRight: DrawOpenRoundRectRight(Graphics, PC, r.Left, r.Top, w - 1, h - 1, 3, False);
      bpMiddle: DrawOpenRoundRectMiddle(Graphics, PC, r.Left, r.Top, w - 1, h - 1, 3, False);
      end;
    end;
  end;

  gppen.Free;

  if Focus then
  begin
    gppen := tgppen.Create(ColorToARGB($E4AD89),1);
    graphics.SetSmoothingMode(SmoothingModeAntiAlias);
    DrawRoundRect(graphics, gppen,r.Left + 1,r.Top + 1, r.Right - 3, r.Bottom - 3, 3);
    gppen.Free;
    gppen := tgppen.Create(ColorToARGB(clgray),1);
    gppen.SetDashStyle(DashStyleDot);
    graphics.SetSmoothingMode(SmoothingModeAntiAlias);
    DrawRoundRect(graphics, gppen,r.Left + 2,r.Top + 2, r.Right - 5, r.Bottom - 5, 3);
    gppen.Free;
  end;

  fontFamily:= TGPFontFamily.Create(AFont.Name);

  fs := 0;

  ImgH := 0;
  ImgW := 0;

  if (fsBold in AFont.Style) then
    fs := fs + 1;
  if (fsItalic in AFont.Style) then
    fs := fs + 2;
  if (fsUnderline in AFont.Style) then
    fs := fs + 4;

  if Assigned(Picture) and not Picture.Empty then
  begin
    Picture.GetImageSizes;
    ImgW := Picture.Width;
    ImgH := Picture.Height;
  end
  else
  begin
    if (ImageIndex > -1) and Assigned(Images) then
    begin
      ImgW := Images.Width;
      ImgH := Images.Height;
    end;
  end;

  if (Caption <> '') then
  begin
    font := TGPFont.Create(fontFamily, AFont.Size , fs, UnitPoint);

    w := BtnR.Right - BtnR.Left;
    h := BtnR.Bottom - BtnR.Top;

    x1 := r.Left;
    y1 := r.Top;
    x2 := w;
    y2 := h;

    rectf := MakeRect(x1,y1,x2,y2);

    stringFormat := TGPStringFormat.Create;

    if Enabled then
      solidBrush := TGPSolidBrush.Create(ColorToARGB(AFont.Color))
    else
      solidBrush := TGPSolidBrush.Create(ColorToARGB(clGray));

    // Center-justify each line of text.
    stringFormat.SetAlignment(StringAlignmentCenter);

    // Center the block of text (top to bottom) in the rectangle.
    stringFormat.SetLineAlignment(StringAlignmentCenter);

    stringFormat.SetHotkeyPrefix(HotkeyPrefixShow);

    case AntiAlias of
    aaClearType:graphics.SetTextRenderingHint(TextRenderingHintClearTypeGridFit);
    aaAntiAlias:graphics.SetTextRenderingHint(TextRenderingHintAntiAlias);
    end;

    //graphics.MeasureString(Caption, Length(Caption), font, rectf, stringFormat, sizerect);
    if AntiAlias = aaNone then
    begin
      szRect.Left := round(rectf.X);
      szRect.Top := round(rectf.Y);

      szRect.Right := szRect.Left + 2;
      szRect.Bottom := DrawText(Canvas.Handle,PChar(Caption),Length(Caption), szrect, DT_CALCRECT or DT_LEFT or DT_WORDBREAK);

      sizeRect.X := szRect.Left;
      sizeRect.Y := szRect.Top;
      sizeRect.Width := szRect.Right - szRect.Left;
      sizeRect.Height := szRect.Bottom - szRect.Top;
    end
    else
      graphics.MeasureString(Caption, Length(Caption), font, rectf, stringFormat, sizerect);

    if (ImgW > 0) then
    begin
      case Layout of
        blGlyphLeft:
        begin
          x1 := r.Left + 2 + ImgW;
          x2 := w - 2 - ImgW;

          ImgX := round(sizerect.X - ImgW div 2);
          if ImgX < 2 then ImgX := 2;
          ImgY := r.Top + Max(0, (h - ImgH) div 2);
        end;
        blGlyphTop:
        begin
          y1 := r.Top{ + 2} + ImgH;
          y2 := h - 2 - ImgH;

          ImgX := r.Left + Max(0, (w - ImgW) div 2);
          ImgY := round(y2 - sizerect.Height);
          ImgY := Max(0, ImgY div 2);
          ImgY := round(y1) - ImgH + ImgY; //round(sizerect.Height) - ImgY - 4;
          if ImgY < 2 then ImgY := 2;
        end;
        blGlyphRight:
        begin
          x1 := 2;
          x2 := w - 4 - ImgW;

          ImgX := round(X2 - sizerect.width);
          ImgX := Max(0, ImgX div 2);
          ImgX := ImgX + round(sizerect.width) + 4;
          if ImgX > (w - ImgW) then
            ImgX := w - ImgW - 2;
          ImgY := r.Top + Max(0, (h - ImgH) div 2);
        end;
        blGlyphBottom:
        begin
          y1 := 2;
          y2 := h - 2 - ImgH;

          ImgX := r.Left + Max(0, (w - ImgW) div 2);
          ImgY := round(y2 - sizerect.Height);
          ImgY := Max(0, ImgY div 2);
          ImgY := round(sizerect.Height + 2) + ImgY;
          if ImgY > (h - ImgH) then ImgY := h - ImgH - 2;
        end;
      end;
    end;

    rectf := MakeRect(x1,y1,x2,y2);

    //graphics.DrawString(Caption, Length(Caption), font, rectf, stringFormat, solidBrush);
    if AntiAlias = aaNone then
    begin
      szRect.Left := round(rectf.X);
      szRect.Top := round(rectf.Y);
      szRect.Right := szRect.Left + round(rectf.Width);
      szRect.Bottom := szRect.Top + round(rectf.Height);
      Canvas.Brush.Style := bsClear;
      DrawText(Canvas.Handle,PChar(Caption),Length(Caption), szrect, DT_CENTER or DT_VCENTER or DT_SINGLELINE)
    end
    else
      graphics.DrawString(Caption, Length(Caption), font, rectf, stringFormat, solidBrush);

    stringformat.Free;
    font.Free;
  end;

  fontfamily.Free;

  if DropDownButton then
  begin

    if DropDownPos = dpRight then
      w := w - 8
    else
      h := h - 8;
  end;

  if Assigned(Picture) and not Picture.Empty then
  begin
     if Caption = '' then
       Canvas.Draw(r.Left + Max(0, (w - ImgW) div 2), r.Top + Max(0, (h - ImgH) div 2), Picture)
     else
       Canvas.Draw(ImgX, ImgY, Picture);
  end
  else
    if (ImageIndex <> -1) and Assigned(Images) then
    begin
      if Caption = '' then
        Images.Draw(Canvas, r.Left + Max(0, (w - Images.Width) div 2), r.Top + Max(0, (h - Images.Height) div 2), ImageIndex, EnabledImage)
      else
      begin
        Images.Draw(Canvas, ImgX, ImgY, ImageIndex, EnabledImage);
      end;
    end;


  Canvas.Brush.Style := bsClear;
  if DropDownButton then
  begin
    if DrawDwLine then
    begin
      Canvas.Pen.Color := PC;
      //Canvas.RoundRect(R.Left, R.Top, R.Right, R.Bottom, 6, 6);
      if (DropDownPos = dpRight) then
      begin
        Canvas.MoveTo(DwR.Left, DwR.Top);
        Canvas.LineTo(DwR.Left, DwR.Bottom);
      end
      else
      begin
        Canvas.MoveTo(DwR.Left, DwR.Top);
        Canvas.LineTo(DwR.Right, DwR.Top);
      end;
    end;
    AP.X := DwR.Left + ((DwR.Right - DwR.Left - 5) div 2);
    AP.Y := DwR.Top + ((DwR.Bottom - DwR.Top - 3) div 2) + 1;
    if not Enabled then
      DrawArrow(AP, clGray)
    else
      DrawArrow(AP, clBlack);
  end;

  if not Assigned(Graph) then
    graphics.Free;
end;


procedure DrawVistaGradient(Canvas: TCanvas; r: TRect; CFU, CTU, CFB, CTB, PC: TColor;
   GradientU,GradientB: TGDIPGradient; Caption:string; AFont: TFont; Enabled: Boolean; Focus: Boolean;
   AntiAlias: TAntiAlias; RoundEdges: Boolean; RotateLeftRight: Boolean; Direction: TDrawPosition = dwpTop; Graph: TGPGraphics = nil; ButtonPos: TButtonPosition = bpStandalone); overload;
begin
  DrawVistaGradient(Canvas, r, CFU, CTU, CFB, CTB, PC, GradientU,GradientB, Caption, AFont,
   nil, -1, True, blGlyphLeft, False, False, Enabled, Focus, dpRight, nil, AntiAlias, RoundEdges, RotateLeftRight, Direction, Graph, ButtonPos);
end;

//------------------------------------------------------------------------------

procedure DrawRightArrow(Canvas: TCanvas; X, Y, S: Integer; Clr: TColor);
var
  i: Integer;
begin
  if not Assigned(Canvas) then
   Exit;

  with Canvas do
  begin
    Pen.Color := Clr;

    for i := 0 to ((S-1) div 2) do
    begin
      MoveTo(X, Y+i);
      LineTo(X, Y + S - i);
      X := X + 1;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure DrawGradient(Canvas: TCanvas; FromColor, ToColor: TColor; Steps: Integer; R: TRect; Direction: Boolean);
var
  diffr, startr, endr: Integer;
  diffg, startg, endg: Integer;
  diffb, startb, endb: Integer;
  rstepr, rstepg, rstepb, rstepw: Real;
  i, stepw: Word;

begin
  if Steps = 0 then
    Steps := 1;

  FromColor := ColorToRGB(FromColor);
  ToColor := ColorToRGB(ToColor);

  startr := (FromColor and $0000FF);
  startg := (FromColor and $00FF00) shr 8;
  startb := (FromColor and $FF0000) shr 16;
  endr := (ToColor and $0000FF);
  endg := (ToColor and $00FF00) shr 8;
  endb := (ToColor and $FF0000) shr 16;

  diffr := endr - startr;
  diffg := endg - startg;
  diffb := endb - startb;

  rstepr := diffr / steps;
  rstepg := diffg / steps;
  rstepb := diffb / steps;

  if Direction then
    rstepw := (R.Right - R.Left) / Steps
  else
    rstepw := (R.Bottom - R.Top) / Steps;

  with Canvas do
  begin
    for i := 0 to steps - 1 do
    begin
      endr := startr + Round(rstepr * i);
      endg := startg + Round(rstepg * i);
      endb := startb + Round(rstepb * i);
      stepw := Round(i * rstepw);
      Pen.Color := endr + (endg shl 8) + (endb shl 16);
      Brush.Color := Pen.Color;
      if Direction then
        Rectangle(R.Left + stepw, R.Top, R.Left + stepw + Round(rstepw) + 1, R.Bottom)
      else
        Rectangle(R.Left, R.Top + stepw, R.Right, R.Top + stepw + Round(rstepw) + 1);
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure GetShortCutHintSize(Canvas: TCanvas; ShortCutHint: string; var h, w: Integer);
var
  R: TRect;
begin
  if (ShortCutHint <> '') then
  begin
    R := Rect(0,0,1000,100);
    DrawText(Canvas.Handle,PChar(ShortCutHint),Length(ShortCutHint), R, DT_CALCRECT or DT_LEFT or DT_SINGlELINE);
    h := R.Bottom + 4*2;
    w := R.Right + 3*2;
  end;
end;

procedure DrawShortCutHint(Canvas: TCanvas; ShortCutHint: string; Pt: TPoint; Shaded: Boolean);
var
  h, w: Integer;
  R: TRect;
begin
  if (ShortCutHint <> '') then
  begin
    h := 0;
    w := 0;
    GetShortCutHintSize(Canvas, ShortCutHint, h, w);
    R := Rect(pt.X, pt.Y, pt.X + w, pt.Y + h);

    DrawGradient(Canvas, clWhite, clSilver, 32, r, false);
    Canvas.Brush.Style := bsClear;
    DrawText(Canvas.Handle,PChar(ShortCutHint),Length(ShortCutHint),r, DT_CENTER or DT_SINGLELINE or DT_VCENTER);

    Canvas.Pen.Color := clGray;
    RoundRect(Canvas.Handle, R.Left, R.Top, R.Right, R.Bottom, 3,3);

    if Shaded then
    begin
      Canvas.Pen.Color := RGB(136, 150, 166);
      Canvas.MoveTo(R.Left + 6, R.Bottom);
      Canvas.LineTo(R.Right+1, R.Bottom);
      Canvas.MoveTo(R.Right, R.Top + 6);
      Canvas.LineTo(R.Right, R.Bottom+1);

      Canvas.Pen.Color := RGB(184, 189, 192);
      Canvas.MoveTo(R.Left + 6, R.Bottom+1);
      Canvas.LineTo(R.Right+1, R.Bottom+1);
      Canvas.MoveTo(R.Right+1, R.Top + 6);
      Canvas.LineTo(R.Right+1, R.Bottom+2);

      Canvas.Pixels[R.left+5, R.Bottom] := Canvas.Pen.color;
      Canvas.Pixels[R.Right, R.Top +5] := Canvas.Pen.color;

      Canvas.Pen.Color := RGB(211, 214, 214);
      Canvas.MoveTo(R.Left + 6, R.Bottom+2);
      Canvas.LineTo(R.Right+2, R.Bottom+2);
      Canvas.MoveTo(R.Right+2, R.Top + 6);
      Canvas.LineTo(R.Right+2, R.Bottom+2);

      Canvas.Pixels[R.left+4, R.Bottom] := Canvas.Pen.color;
      Canvas.Pixels[R.left+5, R.Bottom+1] := Canvas.Pen.color;
      Canvas.Pixels[R.left+4, R.Bottom+1] := Canvas.Pen.color;
      Canvas.Pixels[R.Right, R.Top +4] := Canvas.Pen.color;
      Canvas.Pixels[R.Right+1, R.Top +5] := Canvas.Pen.color;
      Canvas.Pixels[R.Right+1, R.Top +4] := Canvas.Pen.color;
    end;
  end;
end;

//------------------------------------------------------------------------------

{ TButtonCollectionItem }

procedure TButtonCollectionItem.ActionChange(Sender: TObject;
  CheckDefaults: Boolean);
begin
  if Sender is TCustomAction then
    with TCustomAction(Sender) do
    begin
      if not CheckDefaults or (Self.Caption = '') then
        Self.Caption := Caption;
      if not CheckDefaults or (Self.Enabled = True) then
        Self.Enabled := Enabled;
      if not CheckDefaults or (Self.ImageIndex = -1) then
        Self.ImageIndex := ImageIndex;
      if not CheckDefaults or (Self.Visible = True) then
        Self.Visible := Visible;
      //if not CheckDefaults or not Assigned(Self.OnClick) then
        //Self.OnClick := OnExecute;
    end;
end;

procedure TButtonCollectionItem.Assign(Source: TPersistent);
begin
  if (Source is TButtonCollectionItem) then
  begin
    FCaption := TButtonCollectionItem(Source).Caption;
    FVisible := TButtonCollectionItem(Source).Visible;
    FTag := TButtonCollectionItem(Source).Tag;
    FImageIndex := TButtonCollectionItem(Source).ImageIndex;
    FEnabled := TButtonCollectionItem(Source).Enabled;
    FWidth := TButtonCollectionItem(Source).Width;
    FIPicture.Assign(TButtonCollectionItem(Source).Picture);
    FIDisabledPicture.Assign(TButtonCollectionItem(Source).DisabledPicture);
    FOfficeHint.Assign(TButtonCollectionItem(Source).FOfficeHint);
    FFont.Assign(TButtonCollectionItem(Source).Font);
    Action := TButtonCollectionItem(Source).Action;
  end
  else
    inherited;
end;

//------------------------------------------------------------------------------

constructor TButtonCollectionItem.Create(Collection: TCollection);
begin
  inherited;
  FCaption := '';
  FVisible := True;
  FTag := 0;
  FImageIndex := -1;
  FEnabled := True;
  FWidth := 75;
  FIPicture := TGDIPPicture.Create;
  FIPicture.OnChange := PictureChanged;
  FIDisabledPicture := TGDIPPicture.Create;
  FIDisabledPicture.OnChange := PictureChanged;
  FOfficeHint := TAdvHintInfo.Create;
  FFont := TFont.Create;
  FFont.OnChange := OnFontChanged;
end;

//------------------------------------------------------------------------------

destructor TButtonCollectionItem.Destroy;
begin
  FIPicture.Free;
  FIDisabledPicture.Free;
  FOfficeHint.Free;
  FFont.Free;
  FreeAndNil(FActionLink);
  inherited;
end;

//------------------------------------------------------------------------------

procedure TButtonCollectionItem.DoActionChange(Sender: TObject);
begin
  if Sender = Action then ActionChange(Sender, False);
end;

//------------------------------------------------------------------------------

function TButtonCollectionItem.GetAction: TBasicAction;
begin
  if FActionLink <> nil then
    Result := FActionLink.Action
  else
    Result := nil;
end;

//------------------------------------------------------------------------------

function TButtonCollectionItem.GetActionLinkClass: TButtonItemActionLinkClass;
begin
  Result := TButtonItemActionLink;
end;

//------------------------------------------------------------------------------

function TButtonCollectionItem.GetDisplayName: string;
begin
  Result := inherited GetDisplayName;
end;

//------------------------------------------------------------------------------

procedure TButtonCollectionItem.OnFontChanged(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------

procedure TButtonCollectionItem.PictureChanged(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------

procedure TButtonCollectionItem.Refresh;
begin

end;

//------------------------------------------------------------------------------

procedure TButtonCollectionItem.SetAction(const Value: TBasicAction);
begin
  {if (Value is TCustomAction) and (not (csLoading in Value.ComponentState) or (Caption = '')) then
  begin
    Caption := TCustomAction(Value).Caption;
    ImageIndex := TCustomAction(Value).ImageIndex;
  end;
  }
  if Value = nil then
  begin
    FActionLink.Free;
    FActionLink := nil;
  end
  else
  begin
    if FActionLink = nil then
      FActionLink := GetActionLinkClass.Create(Self);
    FActionLink.Action := Value;
    FActionLink.OnChange := DoActionChange;
    if Assigned(TButtonCollection(Collection).FPreviewMenu) then
    begin
      ActionChange(Value, csLoading in Value.ComponentState);
      Value.FreeNotification(TButtonCollection(Collection).FPreviewMenu);
    end;
  end;

end;

//------------------------------------------------------------------------------

procedure TButtonCollectionItem.SetCaption(const Value: string);
begin
  if (FCaption <> Value) then
  begin
    FCaption := Value;
  end;
end;

//------------------------------------------------------------------------------

procedure TButtonCollectionItem.SetDisabledPicture(
  const Value: TGDIPPicture);
begin
  FIDisabledPicture.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TButtonCollectionItem.SetEnabled(const Value: boolean);
begin
  if (FEnabled <> Value) then
  begin
    FEnabled := Value;
  end;
end;

//------------------------------------------------------------------------------

procedure TButtonCollectionItem.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TButtonCollectionItem.SetImageIndex(const Value: Integer);
begin
  if (FImageIndex <> Value) then
  begin
    FImageIndex := Value;
  end;
end;

//------------------------------------------------------------------------------

procedure TButtonCollectionItem.SetIndex(Value: Integer);
begin
  inherited;

end;

//------------------------------------------------------------------------------

procedure TButtonCollectionItem.SetOfficeHint(const Value: TAdvHintInfo);
begin
  FOfficeHint.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TButtonCollectionItem.SetPicture(const Value: TGDIPPicture);
begin
  FIPicture.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TButtonCollectionItem.SetVisible(const Value: Boolean);
begin
  if (FVisible <> Value) then
  begin
    FVisible := Value;
  end;
end;

//------------------------------------------------------------------------------

{ TButtonCollection }

function TButtonCollection.Add: TButtonCollectionItem;
begin
  Result := TButtonCollectionItem(inherited Add);
end;

//------------------------------------------------------------------------------

constructor TButtonCollection.Create(AOwner: TPersistent);
begin
  inherited Create(TButtonCollectionItem);
  FOwner := AOwner;
end;

//------------------------------------------------------------------------------

procedure TButtonCollection.Delete(Index: Integer);
begin
  inherited Delete(Index);
end;

//------------------------------------------------------------------------------

function TButtonCollection.GetItem(Index: Integer): TButtonCollectionItem;
begin
  Result := TButtonCollectionItem(inherited Items[Index]);
end;

//------------------------------------------------------------------------------

function TButtonCollection.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

//------------------------------------------------------------------------------

function TButtonCollection.Insert(Index: Integer): TButtonCollectionItem;
begin
  Result := TButtonCollectionItem(inherited Insert(Index));
end;

//------------------------------------------------------------------------------

procedure TButtonCollection.SetItem(Index: Integer;
  const Value: TButtonCollectionItem);
begin
  inherited Items[Index] := Value;
end;

//------------------------------------------------------------------------------


{ TAdvPreviewSubMenuItem }

procedure TAdvPreviewSubMenuItem.Assign(Source: TPersistent);
begin
  if (Source is TAdvPreviewSubMenuItem) then
  begin
    FTitle := TAdvPreviewSubMenuItem(Source).Title;
    FWideTitle := TAdvPreviewSubMenuItem(Source).FWideTitle;
    FImageIndex := TAdvPreviewSubMenuItem(Source).ImageIndex;
    FEnabled := TAdvPreviewSubMenuItem(Source).Enabled;
    if not TAdvPreviewSubMenuItem(Source).Picture.Empty then
      FIPicture.Assign(TAdvPreviewSubMenuItem(Source).Picture);
    if not TAdvPreviewSubMenuItem(Source).DisabledPicture.Empty then
      FIDisabledPicture.Assign(TAdvPreviewSubMenuItem(Source).DisabledPicture);
    FOfficeHint.Assign(TAdvPreviewSubMenuItem(Source).OfficeHint);
    FNotes.Assign(TAdvPreviewSubMenuItem(Source).Notes);
    FWideNotes := TAdvPreviewSubMenuItem(Source).FWideNotes;
    FSeparator := TAdvPreviewSubMenuItem(Source).Separator;
    FShortCutHint := TAdvPreviewSubMenuItem(Source).FShortCutHint;
    FVisible := TAdvPreviewSubMenuItem(Source).Visible;
    FTag := TAdvPreviewSubMenuItem(Source).Tag;
    Action := TAdvPreviewSubMenuItem(Source).Action;
  end
  else
    inherited;
end;

//------------------------------------------------------------------------------

constructor TAdvPreviewSubMenuItem.Create(Collection: TCollection);
begin
  inherited;
  FTitle := '';
  FWideTitle := '';
  FImageIndex := -1;
  FEnabled := True;
  FVisible := True;
  FIPicture := TGDIPPicture.Create;
  FIPicture.OnChange := PictureChanged;
  FIDisabledPicture := TGDIPPicture.Create;
  FIDisabledPicture.OnChange := PictureChanged;
  FOfficeHint := TAdvHintInfo.Create;
  FNotes := TStringList.Create;
  FWideNotes := '';
  FShortCutHint := '';
  FTag := 0;
  FSeparator := False;
end;

//------------------------------------------------------------------------------

destructor TAdvPreviewSubMenuItem.Destroy;
begin
  FIPicture.Free;
  FIDisabledPicture.Free;
  FOfficeHint.Free;
  FNotes.Free;
  FreeAndNil(FActionLink);
  inherited;
end;

//------------------------------------------------------------------------------

function TAdvPreviewSubMenuItem.GetDisplayName: string;
begin
  Result := inherited GetDisplayName;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.PictureChanged(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.SetDisabledPicture(
  const Value: TGDIPPicture);
begin
  FIDisabledPicture.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.SetEnabled(const Value: boolean);
begin
  if (FEnabled <> Value) then
  begin
    FEnabled := Value;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.SetImageIndex(const Value: Integer);
begin
  if (FImageIndex <> Value) then
  begin
    FImageIndex := Value;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.SetIndex(Value: Integer);
begin
  inherited;

end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.SetNotes(const Value: TStringList);
begin
  FNotes.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.SetOfficeHint(const Value: TAdvHintInfo);
begin
  FOfficeHint.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.SetPicture(const Value: TGDIPPicture);
begin
  FIPicture.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.SetSubMenu(const Value: TPopupMenu);
begin
  FSubMenu := Value;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.SetTitle(const Value: string);
begin
  if (FTitle <> Value) then
  begin
    FTitle := Value;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.AssignTo(Dest: TPersistent);
begin
  if Dest is TCustomAction then
    with TCustomAction(Dest) do
    begin
      Enabled := Self.Enabled;
      ImageIndex := Self.ImageIndex;
      Caption := Self.Title;
      Visible := Self.Visible;
      OnExecute := Self.OnClick;
    end
  else inherited AssignTo(Dest);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.DoActionChange(Sender: TObject);
begin
  if Sender = Action then ActionChange(Sender, False);
end;

//------------------------------------------------------------------------------

function TAdvPreviewSubMenuItem.GetAction: TBasicAction;
begin
  if FActionLink <> nil then
    Result := FActionLink.Action
  else
    Result := nil;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.SetAction(Value: TBasicAction);
begin
  if Value = nil then
  begin
    FActionLink.Free;
    FActionLink := nil;
  end
  else
  begin
    if FActionLink = nil then
      FActionLink := GetActionLinkClass.Create(Self);
    FActionLink.Action := Value;
    FActionLink.OnChange := DoActionChange;
    if Assigned(TAdvPreviewSubMenuItems(Collection).FPreviewMenu) then
    begin
      ActionChange(Value, csLoading in Value.ComponentState);
      Value.FreeNotification(TAdvPreviewSubMenuItems(Collection).FPreviewMenu);
    end;
  end;
end;

//------------------------------------------------------------------------------

function TAdvPreviewSubMenuItem.GetActionLinkClass: TSubItemActionLinkClass;
begin
  Result := TSubItemActionLink;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.InitiateAction;
begin
  if FActionLink <> nil then FActionLink.Update;
end;

//------------------------------------------------------------------------------

function TAdvPreviewSubMenuItem.IsTitleStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsCaptionLinked;
end;

//------------------------------------------------------------------------------

function TAdvPreviewSubMenuItem.IsEnabledStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsEnabledLinked;
end;

//------------------------------------------------------------------------------

function TAdvPreviewSubMenuItem.IsImageIndexStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsImageIndexLinked;
end;

//------------------------------------------------------------------------------

function TAdvPreviewSubMenuItem.IsOnClickStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsOnExecuteLinked;
end;

//------------------------------------------------------------------------------

function TAdvPreviewSubMenuItem.IsVisibleStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsVisibleLinked;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.Loaded;
begin
  if Action <> nil then ActionChange(Action, True);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.Click;
begin
  if Assigned(FOnClick) and (Action <> nil) and (@FOnClick <> @Action.OnExecute) then
    FOnClick(Self{TAdvPreviewSubMenuItems(Collection).FPreviewMenu})
  else if not (csDesigning in TAdvPreviewSubMenuItems(Collection).FPreviewMenu.ComponentState) and (ActionLink <> nil) then
  {$IFDEF DELPHI6_LVL}
    FActionLink.Execute(TAdvPreviewSubMenuItems(Collection).FPreviewMenu)
  {$ELSE}
    FActionLink.Execute
  {$ENDIF}
  else if Assigned(FOnClick) then
    FOnClick(Self{TAdvPreviewSubMenuItems(Collection).FPreviewMenu});
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.ActionChange(Sender: TObject;
  CheckDefaults: Boolean);
begin
  if Sender is TCustomAction then
    with TCustomAction(Sender) do
    begin
      {if not CheckDefaults or (Self.AutoCheck = False) then
        Self.AutoCheck := AutoCheck;}
      if not CheckDefaults or ((Self.Title = '') and (Self.WideTitle = '')) then
        Self.Title := Caption;
      {if not CheckDefaults or (Self.Checked = False) then
        Self.Checked := Checked;}
      if not CheckDefaults or (Self.Enabled = True) then
        Self.Enabled := Enabled;
      {if not CheckDefaults or (Self.HelpContext = 0) then
        Self.HelpContext := HelpContext;
      if not CheckDefaults or (Self.Hint = '') then
        Self.Hint := Hint;
      if RadioItem and (not CheckDefaults or (Self.GroupIndex = 0)) then
        Self.GroupIndex := GroupIndex;}
      if not CheckDefaults or (Self.ImageIndex = -1) then
        Self.ImageIndex := ImageIndex;
      {if not CheckDefaults or (Self.ShortCut = scNone) then
        Self.ShortCut := ShortCut;}
      if not CheckDefaults or (Self.Visible = True) then
        Self.Visible := Visible;
      if not CheckDefaults or not Assigned(Self.OnClick) then
        Self.OnClick := OnExecute;
    end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.SetWideTitle(const Value: widestring);
begin
  FWideTitle := Value;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.SetWideNotes(const Value: widestring);
begin
  FWideNotes := Value;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItem.SetSeparator(const Value: Boolean);
begin
  if (FSeparator <> Value) then
  begin
    FSeparator := Value;
  end;
end;

//------------------------------------------------------------------------------

{ TAdvPreviewSubMenuItems }

function TAdvPreviewSubMenuItems.Add: TAdvPreviewSubMenuItem;
begin
  Result := TAdvPreviewSubMenuItem(inherited Add);
end;

//------------------------------------------------------------------------------

constructor TAdvPreviewSubMenuItems.Create(AOwner: TPersistent);
begin
  inherited Create(TAdvPreviewSubMenuItem);
  FOwner := AOwner;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItems.Delete(Index: Integer);
begin
  inherited Delete(Index);
end;

//------------------------------------------------------------------------------

function TAdvPreviewSubMenuItems.GetItem(Index: Integer): TAdvPreviewSubMenuItem;
begin
  Result := TAdvPreviewSubMenuItem(inherited Items[Index]);
end;

//------------------------------------------------------------------------------

function TAdvPreviewSubMenuItems.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItems.InitiateActions;
var
  i: Integer;
begin
  for i := 0 to Count -1 do
  begin
    Items[i].InitiateAction;
  end;
end;

//------------------------------------------------------------------------------

function TAdvPreviewSubMenuItems.Insert(Index: Integer): TAdvPreviewSubMenuItem;
begin
  Result := TAdvPreviewSubMenuItem(inherited Insert(Index));
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewSubMenuItems.SetItem(Index: Integer;
  const Value: TAdvPreviewSubMenuItem);
begin
  inherited Items[Index] := Value;
end;

//------------------------------------------------------------------------------

{ TAdvPreviewMenuItem }

procedure TAdvPreviewMenuItem.ActionChange(Sender: TObject;
  CheckDefaults: Boolean);
begin
  if Sender is TCustomAction then
    with TCustomAction(Sender) do
    begin
      {if not CheckDefaults or (Self.AutoCheck = False) then
        Self.AutoCheck := AutoCheck;}
      if not CheckDefaults or ((Self.Caption = '') and (Self.WideCaption = '')) then
        Self.Caption := Caption;
      {if not CheckDefaults or (Self.Checked = False) then
        Self.Checked := Checked;}
      if not CheckDefaults or (Self.Enabled = True) then
        Self.Enabled := Enabled;
      {if not CheckDefaults or (Self.HelpContext = 0) then
        Self.HelpContext := HelpContext;
      if not CheckDefaults or (Self.Hint = '') then
        Self.Hint := Hint;
      if RadioItem and (not CheckDefaults or (Self.GroupIndex = 0)) then
        Self.GroupIndex := GroupIndex;}
      if not CheckDefaults or (Self.ImageIndex = -1) then
        Self.ImageIndex := ImageIndex;
      {if not CheckDefaults or (Self.ShortCut = scNone) then
        Self.ShortCut := ShortCut;}
      if not CheckDefaults or (Self.Visible = True) then
        Self.Visible := Visible;
      if not CheckDefaults or not Assigned(Self.OnClick) then
        Self.OnClick := OnExecute;
    end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.Assign(Source: TPersistent);
begin
  if (Source is TAdvPreviewMenuItem) then
  begin
    FCaption := TAdvPreviewMenuItem(Source).Caption;
    FWideCaption := TAdvPreviewMenuItem(Source).WideCaption;
    FTag := TAdvPreviewMenuItem(Source).Tag;
    FImageIndex := TAdvPreviewMenuItem(Source).ImageIndex;
    FEnabled := TAdvPreviewMenuItem(Source).Enabled;
    if not TAdvPreviewMenuItem(Source).Picture.Empty then
      FIPicture.Assign(TAdvPreviewMenuItem(Source).Picture);
    if not TAdvPreviewMenuItem(Source).DisabledPicture.Empty then
      FIDisabledPicture.Assign(TAdvPreviewMenuItem(Source).DisabledPicture);
    FOfficeHint.Assign(TAdvPreviewMenuItem(Source).OfficeHint);
    FSubItems.Assign(TAdvPreviewMenuItem(Source).SubItems);
    FSubMenuCaption := TAdvPreviewMenuItem(Source).SubMenuCaption;
    FWideSubMenuCaption := TAdvPreviewMenuItem(Source).FWideSubMenuCaption;
    FSeparator := TAdvPreviewMenuItem(Source).Separator;
    FSubMenuItemSpacing := TAdvPreviewMenuItem(Source).SubMenuItemSpacing;
    FSubMenuItemIndex := TAdvPreviewMenuItem(Source).SubMenuItemIndex;
    CanSelect := TAdvPreviewMenuItem(Source).CanSelect;
    FShortCutSubItemsHint := TAdvPreviewMenuItem(Source).FShortCutSubItemsHint;
    FShortCutHint := TAdvPreviewMenuItem(Source).FShortCutHint;
    FVisible := TAdvPreviewMenuItem(Source).Visible;
    Action := TAdvPreviewMenuItem(Source).Action;
  end
  else
    inherited;
end;

//------------------------------------------------------------------------------

constructor TAdvPreviewMenuItem.Create(Collection: TCollection);
begin
  inherited;
  FCaption := '';
  FWideCaption := '';
  FTag := 0;
  FImageIndex := -1;
  FEnabled := True;
  FVisible := True;
  FIPicture := TGDIPPicture.Create;
  FIPicture.OnChange := PictureChanged;
  FIDisabledPicture := TGDIPPicture.Create;
  FIDisabledPicture.OnChange := PictureChanged;
  FOfficeHint := TAdvHintInfo.Create;
  FSubItems := TAdvPreviewSubMenuItems.Create(Self);
  FSubItems.FPreviewMenu := TAdvPreviewMenu(TAdvPreviewMenuItems(Collection).FOwner);
  FSubMenuCaption := '';
  FWideSubMenuCaption := '';
  FSeparator := False;
  FSubMenuItemSpacing := 4;
  FSubMenuItemIndex := -1;
  FCanSelect := False;
  FShortCutSubItemsHint := '';
  FShortCutHint := '';
end;

//------------------------------------------------------------------------------

destructor TAdvPreviewMenuItem.Destroy;
begin
  FIPicture.Free;
  FIDisabledPicture.Free;
  FOfficeHint.Free;
  FSubItems.Free;
  FreeAndNil(FActionLink);
  inherited;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuItem.GetDisplayName: string;
begin
  Result := inherited GetDisplayName;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.PictureChanged(Sender: TObject);
begin

end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.SetCaption(const Value: string);
begin
  if (FCaption <> Value) then
  begin
    FCaption := Value;
    if TAdvPreviewMenuItems(Collection).FOwner is TAdvPreviewMenu then
    begin
      TAdvPreviewMenu(TAdvPreviewMenuItems(Collection).FOwner).DrawMenuItem(Index);
    end;    
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.SetDisabledPicture(
  const Value: TGDIPPicture);
begin
  FIDisabledPicture.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.SetEnabled(const Value: boolean);
begin
  if (FEnabled <> Value) then
  begin
    FEnabled := Value;
    if TAdvPreviewMenuItems(Collection).FOwner is TAdvPreviewMenu then
    begin
      TAdvPreviewMenu(TAdvPreviewMenuItems(Collection).FOwner).DrawMenuItem(Index);
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.SetImageIndex(const Value: Integer);
begin
  if (FImageIndex <> Value) then
  begin
    FImageIndex := Value;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.SetIndex(Value: Integer);
begin
  inherited;

end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.SetOfficeHint(const Value: TAdvHintInfo);
begin
  FOfficeHint.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.SetPicture(const Value: TGDIPPicture);
begin
  FIPicture.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.SetSeparator(const Value: Boolean);
begin
  if (FSeparator <> Value) then
  begin
    FSeparator := Value;
  end;  
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.SetSubItems(
  const Value: TAdvPreviewSubMenuItems);
begin
  FSubItems.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.SetSubMenuCaption(const Value: string);
begin
  if (FSubMenuCaption <> Value) then
  begin
    FSubMenuCaption := Value;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.SetSubMenuItemIndex(const Value: Integer);
begin
  FSubMenuItemIndex := Value;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.SetSubMenuItemSpacing(const Value: Integer);
begin
  if (FSubMenuItemSpacing <> Value) then
  begin
    FSubMenuItemSpacing := Value;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.AssignTo(Dest: TPersistent);
begin
  if Dest is TCustomAction then
    with TCustomAction(Dest) do
    begin
      Enabled := Self.Enabled;
      ImageIndex := Self.ImageIndex;
      Caption := Self.Caption;
      Visible := Self.Visible;
      OnExecute := Self.OnClick;
    end
  else inherited AssignTo(Dest);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.DoActionChange(Sender: TObject);
begin
  if Sender = Action then ActionChange(Sender, False);
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuItem.GetAction: TBasicAction;
begin
  if FActionLink <> nil then
    Result := FActionLink.Action else
    Result := nil;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.SetAction(Value: TBasicAction);
begin
  if Value = nil then
  begin
    FActionLink.Free;
    FActionLink := nil;
  end
  else
  begin
    if FActionLink = nil then
      FActionLink := GetActionLinkClass.Create(Self);
    FActionLink.Action := Value;
    FActionLink.OnChange := DoActionChange;
    if (TAdvPreviewMenuItems(Collection).FOwner is TAdvPReviewMenu) then
    begin
      ActionChange(Value, csLoading in Value.ComponentState);
      Value.FreeNotification(TAdvPreviewMenu(TAdvPreviewMenuItems(Collection).FOwner));
    end;
  end;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuItem.GetActionLinkClass: TItemActionLinkClass;
begin
  Result := TItemActionLink;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.InitiateAction;
begin
  if FActionLink <> nil then FActionLink.Update;
  SubItems.InitiateActions;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuItem.IsCaptionStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsCaptionLinked;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuItem.IsEnabledStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsEnabledLinked;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuItem.IsImageIndexStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsImageIndexLinked;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuItem.IsOnClickStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsOnExecuteLinked;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuItem.IsVisibleStored: Boolean;
begin
  Result := (ActionLink = nil) or not FActionLink.IsVisibleLinked;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.Loaded;
var
  i: Integer;
begin
  if Action <> nil then ActionChange(Action, True);
  for i:= 0 to SubItems.Count-1 do
  begin
    SubItems.Items[i].Loaded;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.Click;
begin
  if Assigned(FOnClick) and (Action <> nil) and (@FOnClick <> @Action.OnExecute) then
    FOnClick(Self{TAdvPreviewMenu(TAdvPreviewMenuItems(Collection).FOwner)})
  else if not (csDesigning in TAdvPreviewMenu(TAdvPreviewMenuItems(Collection).FOwner).ComponentState) and (ActionLink <> nil) then
  {$IFDEF DELPHI6_LVL}
    FActionLink.Execute(TAdvPreviewMenu(TAdvPreviewMenuItems(Collection).FOwner))
 {$ELSE}
    FActionLink.Execute
 {$ENDIF}
  else if Assigned(FOnClick) then
    FOnClick(Self{TAdvPreviewMenu(TAdvPreviewMenuItems(Collection).FOwner)});
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.SetWideCaption(const Value: widestring);
begin
  if (FWideCaption <> Value) then
  begin
    FWideCaption := Value;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItem.SetWideSubMenuCaption(
  const Value: widestring);
begin
  FWideSubMenuCaption := Value;
end;

//------------------------------------------------------------------------------

{ TAdvPreviewMenuItems }

function TAdvPreviewMenuItems.Add: TAdvPreviewMenuItem;
begin
  Result := TAdvPreviewMenuItem(inherited Add);
end;

//------------------------------------------------------------------------------

constructor TAdvPreviewMenuItems.Create(AOwner: TPersistent);
begin
  inherited Create(TAdvPreviewMenuItem);
  FOwner := AOwner;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItems.Delete(Index: Integer);
begin
  inherited Delete(Index);
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuItems.GetItem(Index: Integer): TAdvPreviewMenuItem;
begin
  Result := TAdvPreviewMenuItem(inherited Items[Index]);
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuItems.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItems.InitiateActions;
var
  i: Integer;
begin
  for i := 0 to Count -1 do
  begin
    Items[i].InitiateAction;
  end;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuItems.Insert(Index: Integer): TAdvPreviewMenuItem;
begin
  Result := TAdvPreviewMenuItem(inherited Insert(Index));
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuItems.SetItem(Index: Integer;
  const Value: TAdvPreviewMenuItem);
begin
  inherited Items[Index] := Value;
end;

//------------------------------------------------------------------------------

{ TAdvPreviewMenu }

constructor TAdvPreviewMenu.Create(AOwner: TComponent);
begin
  inherited;
  FOwner := AOwner;
  FMenuWidth := 0;
  FSubMenuWidth := 0;
  FTopFrameHeight := 16;
  FOffSetX := 10;
  FInternalStyler := TAdvCustomPreviewMenuStyler.Create(self);
  FInternalStyler.Name := 'InternalStyler';
  FStyler := nil;
  FCurrentStyler := FInternalStyler;
  {$IFDEF DELPHI6_LVL}
  FInternalStyler.SetSubComponent(True);
  {$ENDIF}
  FMenuItems := TAdvPreviewMenuItems.Create(Self);
  FMenuSpacing := 8;
  FPreviewMenuWindow := nil;
  FAdvPreviewMenuPanel := nil;
  FButtons := TButtonCollection.Create(Self);
  FButtons.FPreviewMenu := Self;
  FButtonHeight := 25;
  FButtonSpacing := 4;
  FShowHint := False;
  FSubMenuItems := TAdvPreviewSubMenuItems.Create(Self);
  FSubMenuItems.FPreviewMenu := Self;
  FWideSubMenuCaption := '';
end;

//------------------------------------------------------------------------------

destructor TAdvPreviewMenu.Destroy;
begin
  FMenuItems.Free;
  FButtons.Free;
  FInternalStyler.Free;
  FSubMenuItems.Free;
  inherited;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenu.GetVersion: string;
var
  vn: Integer;
begin
  vn := GetVersionNr;
  Result := IntToStr(Hi(Hiword(vn)))+'.'+IntToStr(Lo(Hiword(vn)))+'.'+IntToStr(Hi(Loword(vn)))+'.'+IntToStr(Lo(Loword(vn)));
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenu.GetVersionNr: integer;
begin
  Result := MakeLong(MakeWord(BLD_VER,REL_VER),MakeWord(MIN_VER,MAJ_VER));
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.Notification(AComponent: TComponent;
  Operation: TOperation);
var
  i, j: Integer;  
begin
  inherited;
  if not (csDestroying in ComponentState) and (Operation = opRemove) then
  begin
    if (AComponent = FMenuImages) then
    begin
      MenuImages := nil;
    end;

    if (AComponent = FSubMenuImages) then
    begin
      SubMenuImages := nil;
    end;

    if (AComponent = FButtonImages) then
    begin
      ButtonImages := nil;
    end;

    if (AComponent = Styler) then
      Styler := nil;

    if (AComponent is TBasicAction) then
    begin
      for i:= 0 to MenuItems.Count-1 do
      begin
        if (AComponent = MenuItems.Items[i].Action) then
          MenuItems.Items[i].Action := nil;

        for j := 0 to MenuItems.Items[i].SubItems.Count-1 do
        begin
          if (AComponent = MenuItems.Items[i].SubItems.Items[j].Action) then
            MenuItems.Items[i].SubItems.Items[j].Action := nil;
        end;
      end;

      for j := 0 to SubMenuItems.Count-1 do
      begin
        if (AComponent = SubMenuItems.Items[j].Action) then
          SubMenuItems.Items[j].Action := nil;
      end;

      for i:= 0 to Buttons.Count-1 do
      begin
        if (AComponent = Buttons.Items[i].Action) then
          Buttons.Items[i].Action := nil;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.SetButtonImages(const Value: TImageList);
begin
  FButtonImages := Value;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.SetMenuItems(const Value: TAdvPreviewMenuItems);
begin
  FMenuItems.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.SetStyler(
  const Value: TAdvCustomPreviewMenuStyler);
begin
  if (FStyler <> Value) or (Value = nil) then
  begin
    FStyler := Value;

    if (FStyler = nil) then
    begin
      FCurrentStyler := FInternalStyler;
    end
    else
    begin
      FCurrentStyler := FStyler;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.SetVersion(const Value: string);
begin

end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.GetMenuSize(var W, H: Integer);
begin
  InitializeMenu;
  if Assigned(FPreviewMenuWindow) then
  begin
    W := FPreviewMenuWindow.Width;
    H := FPreviewMenuWindow.Height;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.InitializeMenu;
begin
  if (FPreviewMenuWindow = nil) then
  begin
    FPreviewMenuWindow := TPreviewMenuWindow.CreateNew(FOwner);
    FPreviewMenuWindow.BorderIcons := [];
    FPreviewMenuWindow.BorderStyle := bsNone;
    FPreviewMenuWindow.Ctl3D := false;
    FPreviewMenuWindow.FormStyle := fsStayOnTop;
    FPreviewMenuWindow.Visible := False;
    FPreviewMenuWindow.AutoScroll := False;
    FPreviewMenuWindow.BorderWidth := 0;
    FPreviewMenuWindow.OnHide := OnPreviewMenuWindowHide;
    FPreviewMenuWindow.OnClose := OnPreviewMenuWindowClose;
    FPreviewMenuWindow.ShowBorder := False;
    //FPreviewMenuWindow.Color := Self.ColorDropDown;
  end;

  if (FAdvPreviewMenuPanel = nil) then
  begin
    FAdvPreviewMenuPanel := TAdvPreviewMenuPanel.Create(FPreviewMenuWindow);
    FAdvPreviewMenuPanel.Parent := FPreviewMenuWindow;
  end;
  FAdvPreviewMenuPanel.AdvPreviewMenu := Self;

  FPreviewMenuWindow.PreviewMenuPanel := FAdvPreviewMenuPanel;
  FPreviewMenuWindow.UpdateSize;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.ShowMenu(X, Y: Integer);
begin
  InitializeMenu;
  MenuItems.InitiateActions;
  if Assigned(FPreviewMenuWindow) then
  begin
    FPreviewMenuWindow.Left := X;
    FPreviewMenuWindow.Top := Y;
    FMenuShowing := True;
    FPreviewMenuWindow.Visible := True;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.HideMenu;
begin
  FMenuShowing := False;  
  if Assigned(FPreviewMenuWindow) then
    FPreviewMenuWindow.Hide;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.OnPreviewMenuWindowClose(Sender: TObject; var Action: TCloseAction);
begin

end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.OnPreviewMenuWindowHide(Sender: TObject);
begin
  if Assigned(OnPreviewHide) then
    OnPreviewHide(Self);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.SetButtons(const Value: TButtonCollection);
begin
  FButtons.Assign(Value);
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenu.GetBottomFrameHeight: Integer;
begin
  Result := ButtonHeight + 4*2;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.SetMenuImages(const Value: TCustomImageList);
begin
  FMenuImages := Value;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.SetSubMenuImages(const Value: TCustomImageList);
begin
  FSubMenuImages := Value;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.SetSubMenuItems(
  const Value: TAdvPreviewSubMenuItems);
begin
  FSubMenuItems.Assign(Value);
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenu.GetVisible: Boolean;
begin
  Result := Assigned(FPreviewMenuWindow) and (FPreviewMenuWindow.Visible);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.InvalidateTopFrame;
begin
  if Assigned(FPreviewMenuWindow) and (FPreviewMenuWindow.Visible) and Assigned(FAdvPreviewMenuPanel) then
    FAdvPreviewMenuPanel.InvalidateTopFrame;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.InvalidateMenu;
begin
  if Assigned(FPreviewMenuWindow) and (FPreviewMenuWindow.Visible) and Assigned(FAdvPreviewMenuPanel) then
    FAdvPreviewMenuPanel.Invalidate;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.DrawMenuItem(Index: Integer);
begin
  if (Assigned(FPreviewMenuWindow) and (FPreviewMenuWindow.Visible) and Assigned(FAdvPreviewMenuPanel)) or (Assigned(FAdvPreviewMenuPanel) and FAdvPreviewMenuPanel.FEditorCreated) then
  begin
    FAdvPreviewMenuPanel.DrawItem(Index);
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.HideShortCutHints;
begin
  if Assigned(FAdvPreviewMenuPanel) and FAdvPreviewMenuPanel.Visible then
    FAdvPreviewMenuPanel.HideAllItemsShortCutHint;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.ShowShortCutHints;
begin
  if Assigned(FAdvPreviewMenuPanel) and FAdvPreviewMenuPanel.Visible then
    FAdvPreviewMenuPanel.ShowAllItemsShortCutHint;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenu.Loaded;
var
  i: Integer;
begin
  inherited;
  for i:= 0 to MenuItems.Count-1 do
  begin
    MenuItems.Items[i].Loaded;
  end;
  
end;

//------------------------------------------------------------------------------

{ TAdvCustomPreviewMenuStyler }

constructor TAdvCustomPreviewMenuStyler.Create(AOwner: TComponent);
begin
  inherited;
  FButtonAppearance := TGlowbuttonAppearance.Create;
  FMenuItemAppearance := TSelectionAppearance.Create;
  FMenuItemAppearance.Color := clNone;
  FMenuItemAppearance.ColorTo := clNone;
  FMenuItemAppearance.BorderColor := clNone;
  FMenuItemAppearance.ColorMirror := clNone;
  FMenuItemAppearance.ColorMirrorTo := clNone;
  FFrameAppearance := TVistaBackGround.Create;
  FRightFrameColor := RGB(233, 234, 238);
  FLeftFrameColor := clWhite;
  FRightFrameBorderColor := clGray;
end;

//------------------------------------------------------------------------------

destructor TAdvCustomPreviewMenuStyler.Destroy;
begin
  FButtonAppearance.Free;
  FMenuItemAppearance.Free;
  FFrameAppearance.Free;
  inherited;
end;

//------------------------------------------------------------------------------

procedure TAdvCustomPreviewMenuStyler.Assign(Source: TPersistent);
begin
  if (Source is TAdvCustomPreviewMenuStyler) then
  begin
    FButtonAppearance.Assign(TAdvCustomPreviewMenuStyler(Source));
    FMenuItemAppearance.Assign(TAdvCustomPreviewMenuStyler(Source));
    FFrameAppearance.Assign(TAdvCustomPreviewMenuStyler(Source));
    FRightFrameColor := TAdvCustomPreviewMenuStyler(Source).RightFrameColor;
    FLeftFrameColor := TAdvCustomPreviewMenuStyler(Source).LeftFrameColor;
    FRightFrameBorderColor := TAdvCustomPreviewMenuStyler(Source).RightFrameBorderColor;
  end
  else
    inherited;
end;

//------------------------------------------------------------------------------

procedure TAdvCustomPreviewMenuStyler.Change(PropID: integer);
begin

end;

//------------------------------------------------------------------------------

procedure TAdvCustomPreviewMenuStyler.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;

end;

//------------------------------------------------------------------------------

procedure TAdvCustomPreviewMenuStyler.SetButtonAppearance(
  const Value: TGlowbuttonAppearance);
begin
  FButtonAppearance.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TAdvCustomPreviewMenuStyler.SetFrameAppearance(
  const Value: TVistaBackGround);
begin
  FFrameAppearance.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TAdvCustomPreviewMenuStyler.SetMenuItemAppearance(
  const Value: TSelectionAppearance);
begin
  FMenuItemAppearance.Assign(Value);
end;

//------------------------------------------------------------------------------

{ TPreviewMenuWindow }

constructor TPreviewMenuWindow.Create(AOwner: TComponent);
begin
  inherited;
  FHideOnDeActivate := true;
  FHideTimer := TTimer.Create(self);
  FHideTimer.Interval := 1;
  FHideTimer.Enabled := false;
  FHideTimer.OnTimer := HideTimerOnTime;
  Font.Name := 'Tahoma';
end;

//------------------------------------------------------------------------------

constructor TPreviewMenuWindow.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  inherited;
  FOwner := AOwner;
  FHideOnDeActivate := true;
  FHideTimer := TTimer.Create(self);
  FHideTimer.Interval := 1;
  FHideTimer.Enabled := false;
  FHideTimer.OnTimer := HideTimerOnTime;
  FBorderColor := clNone;
  Font.Name := 'Tahoma';
  DoubleBuffered := True;
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuWindow.CreateParams(var Params: TCreateParams);
const
  CS_DROPSHADOW = $00020000;
begin
  inherited CreateParams(Params);
  //Params.Style := Params.Style - WS_BORDER;
  {
  Params.ExStyle := Params.ExStyle or WS_EX_TOPMOST; }

  if (Win32Platform = VER_PLATFORM_WIN32_NT) and
     ((Win32MajorVersion > 5) or
      ((Win32MajorVersion = 5) and (Win32MinorVersion >= 1))) then
    Params.WindowClass.Style := Params.WindowClass.Style or CS_DROPSHADOW;
end;

//------------------------------------------------------------------------------

destructor TPreviewMenuWindow.Destroy;
begin
  FHideTimer.Enabled := false;
  FHideTimer.Free;
  inherited;
end;

//------------------------------------------------------------------------------

function TPreviewMenuWindow.GetParentWnd: HWnd;
var
  Last, P: HWnd;
begin
  P := {GetParent}((Owner as TWinControl).Handle);
  Last := P;
  while P <> 0 do
  begin
    Last := P;
    P := GetParent(P);
  end;
  Result := Last;
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuWindow.HideTimerOnTime(Sender: TObject);
begin
  Hide;
  FHideTimer.Enabled := false;
end;


//------------------------------------------------------------------------------

procedure TPreviewMenuWindow.Loaded;
begin
  inherited;
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuWindow.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuWindow.MouseMove(Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuWindow.MouseUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuWindow.Paint;
var
  R: TRect;
begin
  inherited;
(*  if not Assigned(ScrollSelector) then
    Exit;

  R := ClientRect;

  // Draw Caption
  with ScrollSelector.CaptionAppearance do
  begin
    cr := GetCaptionRect;
    cr.Bottom := cr.Bottom - 4;
    if ColorTo <> clNone then
      DrawGradient(Canvas, Color, ColorTo, 40, cr, Direction = gdHorizontal)
    else
    begin
      Canvas.Brush.Color := Color;
      Canvas.Pen.Color := Color;
      Canvas.Rectangle(cr);
    end;

    Canvas.Brush.Style := bsClear;
    Canvas.Font.Color := TextColor;

    if (DropDownCaption <> '') then
    begin
      cr.Left := cr.Left + 4;
{$IFNDEF TMSDOTNET}
      DrawText(Canvas.Handle, PChar(DropDownCaption), -1, cr, DT_SINGLELINE or DT_VCENTER or DT_LEFT);
{$ENDIF}
{$IFDEF TMSDOTNET}
      DrawText(Canvas.Handle, DropDownCaption, -1, cr, DT_SINGLELINE or DT_VCENTER or DT_LEFT);
{$ENDIF}
      cr.Left := cr.Left - 4;
    end;

    if (BorderColor <> clNone) then
    begin
      Canvas.Brush.Style := bsClear;
      Canvas.Pen.Color := BorderColor;
      Canvas.Rectangle(cr);
    end;
  end;

  // Draw Resizer
  with ScrollSelector.ResizerAppearance do
  begin
    rr := GetResizerRect;
    if ColorTo <> clNone then
      DrawGradient(Canvas, Color, ColorTo, 40, rr, Direction = gdHorizontal)
    else
    begin
      Canvas.Brush.Color := Color;
      Canvas.Pen.Color := Color;
      Canvas.Rectangle(rr);
    end;

    if (ColorTo <> clNone) then
    begin
      Canvas.Pen.Color := ColorTo;
      Canvas.MoveTo(0, rr.Top);
      Canvas.LineTo(Width, rr.Top);
    end;

    Canvas.Pen.Color := Color;
    Canvas.MoveTo(rr.Left, rr.Top+1);
    Canvas.LineTo(rr.Left, rr.Bottom);

    if SizeGrip then
    begin
      Canvas.Brush.Color := clWhite;
      Canvas.Pen.Color := clWhite;
      Canvas.Rectangle(rr.Right - 6, rr.Bottom - 7, rr.Right - 4, rr.Bottom - 5);
      Canvas.Rectangle(rr.Right - 6, rr.Bottom - 3, rr.Right - 4, rr.Bottom - 1);
      Canvas.Rectangle(rr.Right - 10, rr.Bottom - 3, rr.Right - 8, rr.Bottom - 1);

      Clr := Color;
      if (ColorTo <> clNone) then
        Clr := ColorTo;

      Clr := BlendColor(Clr, clBlack, 50);
      Canvas.Brush.Color :=  Clr;
      Canvas.Pen.Color := Clr;
      Canvas.Rectangle(rr.Right - 5, rr.Bottom - 8, rr.Right - 3, rr.Bottom - 6);
      Canvas.Rectangle(rr.Right - 5, rr.Bottom - 4, rr.Right - 3, rr.Bottom - 2);
      Canvas.Rectangle(rr.Right - 9, rr.Bottom - 4, rr.Right - 7, rr.Bottom - 2);
    end;
  end;
  *)
  if ShowBorder then
  begin
    R := ClientRect;
    Canvas.Pen.Color := BorderColor;
    Canvas.Brush.Style := bsClear;
    Canvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
  end;
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuWindow.SetBounds(ALeft, ATop, AWidth,
  AHeight: Integer);
begin
  inherited;
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuWindow.WMActivate(var Message: TWMActivate);
var
  rgn: THandle;
  R: TRect;
begin
  inherited;

  if Message.Active = integer(False) then
  begin
    if HideOnDeactivate and Visible then
    begin
      Hide;
      FHideTimer.Enabled := true;
    end;
  end
  else
  begin
    //if Assigned(PreviewMenuPanel) then
    begin
      SendMessage(GetParentWnd, WM_NCACTIVATE, 1, 0);
    end;

    R := ClientRect;
    rgn := CreateRoundRectRgn(0,0,R.Right-R.Left,R.Bottom-R.Top, 4, 4);
    if rgn > 0 then
    begin
      try
        SetWindowRgn(Handle,rgn,true);
      finally
        DeleteObject(rgn);
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuWindow.WMNCHitTest(var Message: TWMNCHitTest);
begin
  inherited;
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuWindow.WMKeyDown(var Message: TWMKeyDown);
begin
  inherited;
  if Assigned(PreviewMenuPanel) then
    PreviewMenuPanel.KeyDown(Message.CharCode, []);
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuWindow.UpdateSize;
var
  x, y: Integer;
begin
  if Assigned(PreviewMenuPanel) then
  begin
    x := 0;
    y := 0;
    PreviewMenuPanel.InitializeAndUpdate;
    PreviewMenuPanel.Top := y;
    PreviewMenuPanel.Left := x;
    Width := PreviewMenuPanel.Width + x*2;
    Height := PreviewMenuPanel.Height + y*2;
  end;
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuWindow.CMDialogChar(var Message: TCMDialogChar);
begin
  inherited;
end;

//------------------------------------------------------------------------------

{ TAdvCustomPreviewMenuPanel }

procedure TAdvCustomPreviewMenuPanel.CMMouseLeave(var Message: TMessage);
begin
  inherited;
end;

//------------------------------------------------------------------------------

constructor TAdvCustomPreviewMenuPanel.Create(AOwner: TComponent);
begin
  inherited;
  FOwner := AOwner;
end;

//------------------------------------------------------------------------------

destructor TAdvCustomPreviewMenuPanel.Destroy;
begin

  inherited;
end;

//------------------------------------------------------------------------------

procedure TAdvCustomPreviewMenuPanel.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  inherited;

end;

//------------------------------------------------------------------------------

procedure TAdvCustomPreviewMenuPanel.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;

end;

//------------------------------------------------------------------------------

procedure TAdvCustomPreviewMenuPanel.MouseMove(Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;

end;

//------------------------------------------------------------------------------

procedure TAdvCustomPreviewMenuPanel.MouseUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;

end;

//------------------------------------------------------------------------------

procedure TAdvCustomPreviewMenuPanel.Paint;
begin
  inherited;

end;

//------------------------------------------------------------------------------

procedure TAdvCustomPreviewMenuPanel.InitializeAndUpdate;
begin

end;

//------------------------------------------------------------------------------

{ TVistaBackground }

constructor TVistaBackground.Create;
begin
  inherited;
  FSteps := 64;
  FColor := clWhite;
  FColorTo := clWhite;
  FColorMirror := clSilver;
  FColorMirrorTo := clWhite;
  FBorderColor := clGray;
  FGradient := ggVertical;
  FGradientMirror := ggVertical;
  FCaptionBackground := RGB(221, 231, 238);
end;

//------------------------------------------------------------------------------

procedure TVistaBackground.Assign(Source: TPersistent);
begin
  if (Source is TVistaBackground) then
  begin
    FSteps := (Source as TVistaBackground).Steps;
    FColor := (Source as TVistaBackground).Color;
    FColorTo := (Source as TVistaBackground).ColorTo;
    FColorMirror := (Source as TVistaBackground).ColorMirror;
    FColorMirrorTo := (Source as TVistaBackground).ColorMirrorTo;
    FBorderColor := (Source as TVistaBackground).BorderColor;
    Gradient := (Source as TVistaBackground).Gradient;
    GradientMirror := (Source as TVistaBackground).GradientMirror;
    CaptionBackground := (Source as TVistaBackground).CaptionBackground;
  end
  else
    inherited Assign(Source);
end;

//------------------------------------------------------------------------------

procedure TVistaBackground.Changed;
begin
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

//------------------------------------------------------------------------------

procedure TVistaBackground.SetColor(const Value: TColor);
begin
  if (FColor <> Value) then
  begin
    FColor := Value;
    Changed;
  end;
end;

//------------------------------------------------------------------------------

procedure TVistaBackground.SetColorTo(const Value: TColor);
begin
  if (FColorTo  <> Value) then
  begin
    FColorTo := Value;
    Changed;
  end;
end;

//------------------------------------------------------------------------------

procedure TVistaBackground.SetBorderColor(const Value: TColor);
begin
  if (FBorderColor <> Value) then
  begin
    FBorderColor := Value;
    Changed;
  end;
end;

//------------------------------------------------------------------------------

procedure TVistaBackground.SetColorMirror(const Value: TColor);
begin
  if (FColorMirror <> Value) then
  begin
    FColorMirror := Value;
    Changed;
  end;
end;

//------------------------------------------------------------------------------

procedure TVistaBackground.SetColorMirrorTo(const Value: TColor);
begin
  if (FColorMirrorTo <> Value) then
  begin
    FColorMirrorTo := Value;
    Changed;
  end;
end;

//------------------------------------------------------------------------------

procedure TVistaBackground.SetGradient(const Value: TGDIPGradient);
begin
  if (FGradient <> Value) then
  begin
    FGradient := Value;
    Changed;
  end;
end;

//------------------------------------------------------------------------------

procedure TVistaBackground.SetGradientMirror(const Value: TGDIPGradient);
begin
  if(FGradientMirror <> Value) then
  begin
    FGradientMirror := Value;
    Changed;
  end;
end;

//------------------------------------------------------------------------------

procedure TVistaBackground.SetSteps(const Value: Integer);
begin
  if (FSteps <> Value) then
  begin
    FSteps := Value;
    Changed;
  end;
end;

//------------------------------------------------------------------------------

{ TSelectionAppearance }

procedure TSelectionAppearance.Assign(Source: TPersistent);
begin
  inherited;
  if (Source is TSelectionAppearance) then
  begin
    TextColor := TSelectionAppearance(Source).TextColor;
    TextColorHot := TSelectionAppearance(Source).TextColorHot;
    TextColorDown := TSelectionAppearance(Source).TextColorDown;
    TextColorChecked := TSelectionAppearance(Source).TextColorChecked;
    TextColorDisabled := TSelectionAppearance(Source).TextColorDisabled;
    Rounded := TSelectionAppearance(Source).Rounded;
    FFont.Assign(TSelectionAppearance(Source).Font);
    FSubItemFont.Assign(TSelectionAppearance(Source).SubItemFont);
    FSubItemTitleFont.Assign(TSelectionAppearance(Source).SubItemTitleFont);
  end;
end;

//------------------------------------------------------------------------------

constructor TSelectionAppearance.Create;
begin
  inherited;
  FTextColor := clBlack;
  FTextColorDisabled := clGray;
  FTextColorDown := clWhite;
  FTextColorHot := clWhite;
  FTextColorChecked := clBlack;
  FRounded := True;
  FFont := TFont.Create;
  FSubItemFont := TFont.Create;
  FSubItemTitleFont := TFont.Create;

  FSystemFont := true;
  if IsVista then
  begin
    FFont.Name := 'Segoe UI';
    FSubItemFont.Name := 'Segoe UI';
    FSubItemTitleFont.Name := 'Segoe UI';
  end
  else
  begin
    FFont.Name := 'Tahoma';
    FSubItemFont.Name := 'Tahoma';
    FSubItemTitleFont.Name := 'Tahoma';
  end;
end;

//------------------------------------------------------------------------------

destructor TSelectionAppearance.Destroy;
begin
  FFont.Free;
  FSubItemFont.Free;
  FSubItemTitleFont.Free;
  inherited;
end;

//------------------------------------------------------------------------------

procedure TSelectionAppearance.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TSelectionAppearance.SetRounded(const Value: Boolean);
begin
  if (FRounded <> Value) then
  begin
    FRounded := Value;
  end;
end;

//------------------------------------------------------------------------------

procedure TSelectionAppearance.SetSubItemFont(const Value: TFont);
begin
  FSubItemFont.Assign(Value);
end;

//------------------------------------------------------------------------------

procedure TSelectionAppearance.SetSubItemTitleFont(const Value: TFont);
begin
  FSubItemTitleFont.Assign(Value);
end;

procedure TSelectionAppearance.SetSystemFont(const Value: boolean);
begin
  if (FSystemFont <> Value) then
  begin
    FSystemFont := Value;

    if value then
    begin
      if IsVista then
      begin
        Font.Name := 'Segoe UI';
        SubItemTitleFont.Name := 'Segoe UI';
        SubItemFont.Name := 'Segoe UI';
      end
      else
      begin
        Font.Name := 'Tahoma';
        SubItemTitleFont.Name := 'Tahoma';
        SubItemFont.Name := 'Tahoma';
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TSelectionAppearance.SetTextColor(const Value: TColor);
begin
  if (FTextColor <> Value) then
  begin
    FTextColor := Value;
    Changed;
  end;
end;

//------------------------------------------------------------------------------

procedure TSelectionAppearance.SetTextColorChecked(const Value: TColor);
begin
  if (FTextColorChecked <> Value) then
  begin
    FTextColorChecked := Value;
    Changed;
  end;
end;

//------------------------------------------------------------------------------

procedure TSelectionAppearance.SetTextColorDisabled(const Value: TColor);
begin
  if (FTextColorDisabled <> Value) then
  begin
    FTextColorDisabled := Value;
    Changed;
  end;
end;

//------------------------------------------------------------------------------

procedure TSelectionAppearance.SetTextColorDown(const Value: TColor);
begin
  if (FTextColorDown <> Value) then
  begin
    FTextColorDown := Value;
    Changed;
  end;
end;

//------------------------------------------------------------------------------

procedure TSelectionAppearance.SetTextColorHot(const Value: TColor);
begin
  if (FTextColorHot <> Value) then
  begin
    FTextColorHot := Value;
    Changed;
  end;
end;

//------------------------------------------------------------------------------


{ TAdvPreviewMenuPanel Popupmenu support }

var
  SubMenuHook: HHOOK;
  InitDone: Boolean = False;
  PreviewMenuPanel: TAdvPreviewMenuPanel;
  SubMItemIndex: Integer;
  LastMenuItem: TMenuItem;
  LastMousePos: TPoint;
  StillModal: Boolean;

function PreviewMenuGetMsgHook(Code: Integer; WParam: Longint; var Msg: TMsg): Longint; stdcall;
const
  RightArrowKey: array[Boolean] of Word = (VK_LEFT, VK_RIGHT);
  LeftArrowKey: array[Boolean] of Word = (VK_RIGHT, VK_LEFT);
var
  P: TPoint;
  //Target: TControl;
  //Item: Integer;
  //FindKind: TFindItemKind;
  ParentMenu: TMenu;
  //MouseTarget: Boolean;

  (*function FindItem(Forward: Boolean): TAdvPreviewSubMenuItem;
  var
    MenuPanel: TAdvPreviewMenuPanel;
    I, J, Count: Integer;
  begin
    MenuPanel := PreviewMenuPanel;
    if (MenuPanel <> nil) and Assigned(MenuPanel.FAdvPreviewMenu) and (MenuPanel.FSubMenuItem >= 0) and (MenuPanel.FSubMenuItem < MenuPanel.FAdvPreviewMenu.MenuItems.Count) then
    begin
      J := SubMenuItemIndex;
      I := J;
      Count := MenuPanel.FAdvPreviewMenu.MenuItems.Items[MenuPanel.FSubMenuItem].SubItems.Count;
      if Forward then
        repeat
          if I = Count - 1 then
            I := 0
          else
            Inc(I);
          if TControl(ToolBar.FATBControls[I]) is TAdvCustomToolBarButton then
          begin
            Result := TAdvCustomToolBarButton(TControl(ToolBar.FATBControls[I]) {ToolBar.Controls[I]});
            if Result.Visible and Result.Enabled {and Result.Grouped} then Exit;
          end;
        until I = J
      else
        repeat
          if I = 0 then
            I := Count - 1
          else
            Dec(I);
          if TControl(ToolBar.FATBControls[I]) is TAdvCustomToolBarButton then
          begin
            Result := TAdvCustomToolBarButton(TControl(ToolBar.FATBControls[I]) {ToolBar.Controls[I]});
            if Result.Visible and Result.Enabled {and Result.Grouped} then Exit;
          end;
        until I = J;
    end;
    Result := nil;
  end; *)

begin
  //MouseTarget := false;
  if LastMenuItem <> nil then
  begin
    ParentMenu := LastMenuItem.GetParentMenu;
    if ParentMenu <> nil then
    begin
      if ParentMenu.IsRightToLeft then
        if Msg.WParam = VK_LEFT then
          Msg.WParam := VK_RIGHT
        else if Msg.WParam = VK_RIGHT then
          Msg.WParam := VK_LEFT;
    end;
  end;
  Result := CallNextHookEx(SubMenuHook, Code, WParam, Longint(@Msg));
  if Result <> 0 then Exit;
  if (Code = MSGF_MENU) then
  begin
    //Target := nil;
    if not InitDone then
    begin
      InitDone := True;
      PostMessage(Msg.Hwnd, WM_KEYDOWN, VK_DOWN, 0);
    end;
    case Msg.Message of
      WM_MENUSELECT:
        begin
          if (HiWord(Msg.WParam) = $FFFF) and (Msg.LParam = 0) then
          begin
            //if not StillModal then
              //PreviewMenuPanel.CancelSubMenu;
            Exit;
          end
          else
            StillModal := False;
          {FindKind := fkCommand;
          if HiWord(Msg.WParam) and MF_POPUP <> 0 then FindKind := fkHandle;
          if FindKind = fkHandle then
            Item := GetSubMenu(Msg.LParam, LoWord(Msg.WParam))
          else
            Item := LoWord(Msg.WParam);
          LastMenuItem := PreviewMenuPanel.FTempMenu.FindItem(Item, FindKind);}
        end;
      WM_SYSKEYDOWN:
        if Msg.WParam = VK_MENU then
        begin
          //PreviewMenuPanel.CancelSubMenu;
          Exit;
        end;
      WM_KEYDOWN:
        begin
          PreviewMenuPanel.CheckKeyPress(Msg.WParam);
          {if Msg.WParam = VK_RETURN then
            MenuToolBar.FMenuResult := True
          else} if Msg.WParam = VK_ESCAPE then
            StillModal := True
          {else if LastMenuItem <> nil then
          begin
            if (Msg.WParam = VK_RIGHT) and (LastMenuItem.Count = 0) then
              Target := FindButton(True)
            else if (Msg.WParam = VK_LEFT) and (LastMenuItem.GetParentComponent is TPopupMenu) then
              Target := FindButton(False)
            else
              Target := nil;
            if Target <> nil then
            begin
              P := Target.ClientToScreen(Point(0, 0));
              MouseTarget := false;
            end;
          end};
        end;
      WM_MOUSEMOVE:
        begin
          P := Msg.pt;
          if (P.X <> LastMousePos.X) or (P.Y <> LastMousePos.Y) then
          begin
            //Target := FindDragTarget(P, False);
            LastMousePos := P;
            //MouseTarget := true;
            PreviewMenuPanel.CheckMouseMove(p.X, p.Y);
          end;
        end;
    end;
    {if (Target <> nil) then
    begin
      with TAdvCustomToolBarButton(Target) do
        if (Index <> MenuButtonIndex) and (Parent <> nil) and
          Parent.HandleAllocated then
        begin
          StillModal := True;
          MenuToolBar.FCaptureChangeCancels := False;
          MenuToolBar.ClickButton(TAdvCustomToolBarButton(Target), MouseTarget);
        end;
    end;}
  end;
end;

procedure InitPreviewMenuHooks;
begin
  StillModal := False;
  GetCursorPos(LastMousePos);
  if SubMenuHook = 0 then
    SubMenuHook := SetWindowsHookEx(WH_MSGFILTER, @PreviewMenuGetMsgHook, 0,
      GetCurrentThreadID);
end;

procedure ReleasePreviewMenuHooks;
begin
  if SubMenuHook <> 0 then UnhookWindowsHookEx(SubMenuHook);
  SubMenuHook := 0;
  LastMenuItem := nil;
  PreviewMenuPanel := nil;
  SubMItemIndex := -1;
  InitDone := False;
end;

//------------------------------------------------------------------------------

{ TAdvPreviewMenuPanel }

procedure TAdvPreviewMenuPanel.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  FButtonPartHot := False;
  FDropDownPartHot := False;
  if not FEditorCreated then
  begin
    FItemDown := -1;
    ItemHot := -1;
  end;  

  if not Assigned(FSubMenuPopup) then
  begin
    FSubMenuItemDown := -1;
    SubMenuItemHot := -1;
  end;
end;

//------------------------------------------------------------------------------

constructor TAdvPreviewMenuPanel.Create(AOwner: TComponent);
begin
  inherited;
  FOwner := AOwner;
  FLeftFrameRect := Rect(0, 0, 0, 0);
  FRightFrameRect := Rect(0, 0, 0, 0);
  FItemHeight := MINITEM_HEIGHT;
  FImageSpace := 4;
  FLineSpace := 2;
  FButtonList := TList.Create;
  FItemIndex := -1;
  FItemHot := -1;
  FItemDown := -1;
  FSubMenuItem := -1;
  FSubMenuItemHeight := MINITEM_HEIGHT;
  FSubMenuItemHot := -1;
  FSubMenuItemDown := -1;
  FSubMenuCaptionHeight := 0;
  FSubMenuPopup := nil;
  FHintItemIndex := -1;
  FHintSubMenuItemIndex := -1;
  FOfficeHint := TAdvHintInfo.Create;
  FIgnoreMouseMove := False;
  FShortCutChars := '';
  Font.Name := 'Tahoma';
  FMouseTimer := TTimer.Create(Self);
  FMouseTimer.Enabled := False;
  FMouseTimer.Interval := 310;
  FMouseTimer.OnTimer := OnMouseTimer;
  FMouseItemHot := -1;
  FSubMenuVisibleItemCount := 0;
  FTopSubMenuItem := 0;
  FSubMenuScroller := TMenuItemScroller.Create;
  FSelectedItem := -1;
  FSelectedSubItem := -1;
  FHintItem := -1;
  FHintSubItem := -1;
end;

//------------------------------------------------------------------------------

destructor TAdvPreviewMenuPanel.Destroy;
begin
  FButtonList.Free;
  FOfficeHint.Free;
  FMouseTimer.Free;
  FSubMenuScroller.Free;
  inherited;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.GetTopFrameRect: TRect;
begin
  Result := ClientRect;
  Result := Rect(Result.Left, Result.Top, Result.Right, Result.Top + AdvPreviewMenu.TopFrameHeight);
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.GetItemFramesRect: TRect;
begin
  Result := Rect(GetLeftFrameRect.Left, GetLeftFrameRect.Top, GetRightFrameRect.Right, GetRightFrameRect.Bottom);
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.GetLeftFrameRect: TRect;
begin
  Result := FLeftFrameRect;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.GetRightFrameRect: TRect;
begin
  Result := FRightFrameRect;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.ItemHotNext;
var
  i, j: Integer;
begin
  if not Assigned(AdvPreviewMenu) then
    Exit;

  j := FItemHot;
  for i:= 0 to AdvPreviewMenu.MenuItems.Count-1 do
  begin
    j := j + 1;
    if (j >= AdvPreviewMenu.MenuItems.Count) or (j < 0) then
      j := 0;

    if (AdvPreviewMenu.MenuItems.Items[j].Enabled) then
    begin
      ItemHot := j;
      Break;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.ItemHotPrevious;
var
  i, j: Integer;
begin
  if not Assigned(AdvPreviewMenu) then
    Exit;

  j := FItemHot;
  for i:= AdvPreviewMenu.MenuItems.Count-1 downto 0 do
  begin
    j := j - 1;
    if (j < 0) then
      j := AdvPreviewMenu.MenuItems.Count-1;

    if (j >= AdvPreviewMenu.MenuItems.Count) then
      j := 0;

    if (AdvPreviewMenu.MenuItems.Items[j].Enabled) then
    begin
      ItemHot := j;
      Break;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.SubMenuItemHotNext;
var
  i, j: Integer;
  SubItems: TAdvPreviewSubMenuItems;
begin
  if not Assigned(AdvPreviewMenu) then
    Exit;

  SubItems := GetSubMenuItems;

  if Assigned(SubItems) then
  begin
    j := FSubMenuItemHot;
    for i:= 0 to SubItems.Count-1 do
    begin
      j := j + 1;
      if (j >= SubItems.Count) or (j < 0) then
        j := 0;

      if (SubItems.Items[j].Enabled) then
      begin
        SubMenuScrollInView(j);
        SubMenuItemHot := j;
        Break;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.SubMenuItemHotPrevious;
var
  i, j: Integer;
  SubItems: TAdvPreviewSubMenuItems;
begin
  if not Assigned(AdvPreviewMenu) then
    Exit;

  SubItems := GetSubMenuItems;

  if Assigned(SubItems) then
  begin
    j := FSubMenuItemHot;
    for i:= 0 to SubItems.Count-1 do
    begin
      j := j - 1;
      if (j < 0) then
        j := SubItems.Count-1;

      if (j >= SubItems.Count) then
        j := 0;

      if (SubItems.Items[j].Enabled) then
      begin
        SubMenuScrollInView(j);
        SubMenuItemHot := j;
        Break;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.KeyDown(var Key: Word; Shift: TShiftState);
var
  s, shCut, sub: string;
  i, c: Integer;
  found: Boolean;
  SubItems: TAdvPreviewSubMenuItems;
begin
  inherited;

  if not Assigned(AdvPreviewMenu) then
    Exit;

  if (Key in [VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT]) then
  begin
    if FShortCutItemHintShowing then
      HideAllItemsShortCutHint;

    if FShortCutSubMenuItemHintShowing then
    begin
      HideAllSubMenuItemsShortCutHint;
      DrawRightFrame;
    end;  
  end;

  case (Key) of
    VK_UP:
    begin
      if (FSubMenuItemHot >= 0) then
      begin
        SubMenuItemHotPrevious;
      end
      else
      begin
        ItemHotPrevious;
      end;
    end;
    VK_DOWN:
    begin
      if (FSubMenuItemHot >= 0) then
      begin
        SubMenuItemHotNext;
      end
      else
      begin
        ItemHotNext;
      end;
    end;
    VK_LEFT:
    begin
      if (FSubMenuItemHot >= 0) then
      begin
        SubMenuItemHot := -1;
      end;
    end;
    VK_RIGHT:
    begin
      if (FItemHot < 0) then
        ItemHotNext
      else
        SubMenuItemHotNext;
    end;
    VK_RETURN, VK_SPACE:
    begin
      if (FSubMenuItemHot >= 0) then
      begin
        SelectSubMenuItem(FSubMenuItemHot);
      end
      else if (FItemHot >= 0) then
      begin
        SelectItem(FItemHot);
      end;
    end;
    VK_ESCAPE:
    begin
      HideMenuWindow;
    end;
    else
    begin
      if FShortCutItemHintShowing or FShortCutSubMenuItemHintShowing then
      begin
        s := char(Key);
        FShortCutChars := FShortCutChars + s;
        found := False;
        c := 0;

        if (FShortCutItemHintShowing) then   // Search for MenuItems
        begin
          for i := 0 to AdvPreviewMenu.MenuItems.Count-1 do
          begin
            if (AdvPreviewMenu.MenuItems.Items[i].ShortCutHint <> '') then
              shCut := AdvPreviewMenu.MenuItems.Items[i].ShortCutHint
            else
            begin
              shCut := GetHotKey(AdvPreviewMenu.MenuItems.Items[i].Caption);
            end;
            
            if (UpperCase(shCut) = UpperCase(FShortCutChars)) then
            begin
              HideAllItemsShortCutHint;
              found := True;
              SelectItem(i);
              Break;
            end
            else if (Length(shCut) > 0) then
            begin
              sub := Copy(shCut, 1, Length(FShortCutChars));
              if (UpperCase(sub) <> UpperCase(FShortCutChars)) then
              begin
                HideItemShortCutHint(i);
              end
              else
              begin
                found := True;
              end;
            end;
            if AdvPreviewMenu.MenuItems.Items[i].ShortCutHintShowing then
              Inc(c);

            if (AdvPreviewMenu.MenuItems.Items[i].SubItems.Count > 0) then
            begin
              shCut := AdvPreviewMenu.MenuItems.Items[i].ShortCutSubItemsHint;
              if (UpperCase(shCut) = UpperCase(FShortCutChars)) then
              begin
                HideAllItemsShortCutHint;
                found := True;
                ItemHot := i;
                SubMenuItemHot := 0;
                ShowAllSubMenuItemsShortCutHint;
                Break;
              end
              else if (Length(shCut) > 0) then
              begin
                sub := Copy(shCut, 1, Length(FShortCutChars));
                if (UpperCase(sub) <> UpperCase(FShortCutChars)) then
                begin
                  HideItemSubItemShortCutHint(i);
                end
                else
                begin
                  found := True;
                end;
              end;
              if AdvPreviewMenu.MenuItems.Items[i].ShortCutSubItemHintShowing then
                Inc(c);
            end;

          end; // end for

          if (c = 0) then
          begin
            FShortCutItemHintShowing := False;
          end;
        end
        else if FShortCutSubMenuItemHintShowing then // Search for SubMenuItems
        begin
          SubItems := GetSubMenuItems;
          if Assigned(SubItems) and (FSubMenuItemHot < SubItems.Count) then
          begin
            for i := 0 to SubItems.Count-1 do
            begin
              if (SubItems.Items[i].ShortCutHint <> '') then
                shCut := SubItems.Items[i].ShortCutHint
              else
              begin
                shCut := GetHotKey(SubItems.Items[i].Title);
              end;

              if (UpperCase(shCut) = UpperCase(FShortCutChars)) then
              begin
                HideAllSubMenuItemsShortCutHint;
                found := True;
                SelectSubMenuItem(i);
                Break;
              end
              else if (Length(shCut) > 0) then
              begin
                sub := Copy(shCut, 1, Length(FShortCutChars));
                if (UpperCase(sub) <> UpperCase(FShortCutChars)) then
                begin
                  HideSubMenuItemShortCutHint(i);
                end
                else
                begin
                  found := True;
                end;
              end;
              if SubItems.Items[i].ShortCutHintShowing then
                Inc(c);
            end; // end for   
          end;

          if (c = 0) then
          begin
            FShortCutSubMenuItemHintShowing := False;
          end;
        end; // end else

        if not found then
        begin
          Beep;
        end;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i, j: Integer;
  SubItem: TAdvPreviewSubMenuItem;
begin
  inherited;

  if FInternalClick then
  begin
    i := SubMenuItemAtPos(X, Y);
    if (i >= 0) then
    begin
      SubMenuItemHot := i;
    end;
    FInternalClick := False;
    Exit;
  end;

  i := ItemAtPos(X, Y);
  if (i >= 0) then
  begin
    {if (i < AdvPreviewMenu.MenuItems.Count) and (AdvPreviewMenu.MenuItems.Items[i].SubItems.Count > 0) and (AdvPreviewMenu.MenuItems.Items[i].CanSelect) then
    begin
    end;}
    if (i < AdvPreviewMenu.MenuItems.Count) and ((AdvPreviewMenu.MenuItems.Items[i].Enabled) or FEditorCreated) then
    begin
      if FEditorCreated and (FItemDown >= 0) and (FItemDown <> i) then
      begin
        j := FItemDown;
        FItemDown := i;
        DrawItem(j);
      end;
      FItemDown := i;
      DrawItem(FItemDown);
    end;
  end;

  i := SubMenuItemAtPos(X, Y, SubItem);
  if (i >= 0) and Assigned(SubItem) and (SubItem.Enabled or FEditorCreated)  then
  begin
    FSubMenuItemDown := i;
    DrawSubMenuItem(FSubMenuItemDown);
  end;

  if FSubMenuScroller.Visible then
  begin
    if PtInRect(GetUpScrollBtnRect, Point(X, Y)) then
    begin
      FSubMenuScollUpDown := True;
      DrawUpScrollBtn;
    end
    else if PtInRect(GetDownScrollBtnRect, Point(X, Y)) then
    begin
      FSubMenuScollDownDown := True;
      DrawDownScrollBtn;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.MouseMove(Shift: TShiftState; X,
  Y: Integer);
var
  i: Integer;
  EmptyOfficeHint: TAdvHintInfo;
  SubItems: TAdvPreviewSubMenuItems;
begin
  inherited;

  if FIgnoreMouseMove then
  begin
    FIgnoreMouseMove := False;
    Exit;
  end;

  i := ItemAtPos(X, Y);
  if not FEditorCreated then
  begin
    if ((i >= 0) and PtInRect(GetItemFramesRect, Point(X, Y))) and not FEditorCreated then
    begin
      if (i < AdvPreviewMenu.MenuItems.Count) and (AdvPreviewMenu.MenuItems.Items[I].SubItems.Count > 0)
         and (AdvPreviewMenu.MenuItems.Items[i].CanSelect) and AdvPreviewMenu.MenuItems.Items[i].Enabled then
      begin
        if PtInRect(GetItemDropDownRect(I), Point(X, Y)) then
        begin
          if (not FDropDownPartHot) then
          begin
            FButtonPartHot := False;
            FDropDownPartHot := True;
            DrawItem(i, True);
          end;
        end
        else
        begin
          if not FButtonPartHot or (FDropDownPartHot and not FShortCutItemHintShowing) then
          begin
            FButtonPartHot := True;
            FDropDownPartHot := False;
            DrawItem(i, True);
          end;
        end;
      end
      else if (i < AdvPreviewMenu.MenuItems.Count) then
      begin
        if FButtonPartHot or FDropDownPartHot then
        begin
          FButtonPartHot := False;
          FDropDownPartHot := False;
          DrawItem(i, True);
        end;
      end;
    end;
  end;  

  if (i <> FItemHot) and not FEditorCreated then
  begin
    if not ((i < 0) and PtInRect(GetItemFramesRect, Point(X, Y))) then
    begin
      if (ssLeft in Shift) and (i >= 0) and (i < AdvPreviewMenu.MenuItems.Count) and (AdvPreviewMenu.MenuItems.Items[i].Enabled) then
        FItemDown := i;

      FMouseSetHot := True;
      ItemHot := i;
      FMouseSetHot := False;

      if (i >= 0) and (i < AdvPreviewMenu.MenuItems.Count) then
      begin
        Self.OfficeHint.Assign(AdvPreviewMenu.MenuItems.Items[i].OfficeHint);
        Application.CancelHint;
      end;
    end;
  end
  else if FEditorCreated and (i <> FHintItem) and False then
  begin
    if (i < 0) and (FHintItem >= 0) then
    begin
      EmptyOfficeHint := TAdvHintInfo.Create;
      Self.OfficeHint.Assign(EmptyOfficeHint);
      EmptyOfficeHint.Free;
    end;

    FHintItem := i;
    if (i >= 0) and (i < AdvPreviewMenu.MenuItems.Count) then
    begin
      Self.OfficeHint.Assign(AdvPreviewMenu.MenuItems.Items[i].OfficeHint);
      Application.CancelHint;
    end;
  end;

  i := SubMenuItemAtPos(X, Y);
  if (i <> FSubMenuItemHot) and not FEditorCreated then
  begin
    SubItems := GetSubMenuItems;

    if (ssLeft in Shift) and (i >= 0) and (i < SubItems.Count) and SubItems.Items[i].Enabled then
      FSubMenuItemDown := i;
    SubMenuItemHot := i;

    if (i >= 0) and (FSubMenuItem < AdvPreviewMenu.MenuItems.Count) and (i < SubItems.Count) then
    begin
      Self.OfficeHint.Assign(SubItems.Items[i].OfficeHint);
      Application.CancelHint;
    end;
  end
  else if FEditorCreated and (i <> FHintSubItem) and False then
  begin
    SubItems := GetSubMenuItems;
    if (i < 0) and (FHintSubItem >= 0) then
    begin
      EmptyOfficeHint := TAdvHintInfo.Create;
      Self.OfficeHint.Assign(EmptyOfficeHint);
      EmptyOfficeHint.Free;
    end;

    FHintSubItem := i;
    if (i >= 0) and (i < SubItems.Count) then
    begin
      Self.OfficeHint.Assign(SubItems.Items[i].OfficeHint);
      Application.CancelHint;
    end;
  end;

  if FSubMenuScroller.Visible then
  begin
    if PtInRect(GetUpScrollBtnRect, Point(X, Y)) then
    begin
      if not FSubMenuScollUpHot then
      begin
        FSubMenuScollUpHot := True;
        if (ssLeft in Shift) then
          FSubMenuScollUpDown := True;
        DrawUpScrollBtn;
      end;
    end
    else if PtInRect(GetDownScrollBtnRect, Point(X, Y)) then
    begin
      if not FSubMenuScollDownHot then
      begin
        FSubMenuScollDownHot := True;
        if (ssLeft in Shift) then
          FSubMenuScollDownDown := True;
        DrawDownScrollBtn;
      end;
    end
    else
    begin
      if FSubMenuScollUpHot or FSubMenuScollUpDown then
      begin
        FSubMenuScollUpHot := False;
        FSubMenuScollUpDown := False;
        DrawUpScrollBtn;
      end;

      if FSubMenuScollDownHot or FSubMenuScollDownDown then
      begin
        FSubMenuScollDownHot := False;
        FSubMenuScollDownDown := False;
        DrawDownScrollBtn;
      end;
    end;
  end;

  if not FEditorCreated and (FItemHot < 0) and (FSubMenuItemHot < 0) and ((OfficeHint.Title <> '') or (OfficeHint.Notes.Count > 0)) then
  begin
    EmptyOfficeHint := TAdvHintInfo.Create;
    Self.OfficeHint.Assign(EmptyOfficeHint);
    EmptyOfficeHint.Free;
  end;  
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.MouseUp(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i: Integer;
  doClick: Boolean;
begin
  inherited;

  if FInternalClick then
  begin
    FInternalClick := False;
    Exit;
  end;

  if (FItemDown >= 0) then
  begin
    doClick := True;
    if (FItemDown < AdvPreviewMenu.MenuItems.Count) and (AdvPreviewMenu.MenuItems.Items[FItemDown].SubItems.Count > 0)
       and (AdvPreviewMenu.MenuItems.Items[FItemDown].CanSelect) then
    begin
      if PtInRect(GetItemDropDownRect(FItemDown), Point(X, Y)) then
      begin
        doClick := False;
      end;
    end;

    i := FItemDown;
    FItemDown := -1;
    if FEditorCreated then
    begin
      doClick := True;
      FMouseSetHot := True;
      ItemHot := i;
      FMouseSetHot := False;
    end;
    DrawItem(i, True);
    if doClick then
    begin
      SelectItem(i);
    end;
  end;

  if (FSubMenuItemDown >= 0) then
  begin
    i := FSubMenuItemDown;
    FSubMenuItemDown := -1;
    DrawSubMenuItem(i, True);
    SelectSubMenuItem(i);
  end;

  if FSubMenuScroller.Visible then
  begin
    if PtInRect(GetUpScrollBtnRect, Point(X, Y)) and FSubMenuScollUpDown then
    begin
      FSubMenuScollUpDown := False;
      DrawUpScrollBtn;
      SubMenuScrollUpClick;
    end
    else if PtInRect(GetDownScrollBtnRect, Point(X, Y)) and FSubMenuScollDownDown then
    begin
      FSubMenuScollDownDown := False;
      DrawDownScrollBtn;
      SubMenuScrollDownClick;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.Paint;
var
  R, R2, R3: TRect;
begin
  inherited;
  if not Assigned(AdvPreviewMenu) then
    Exit;

  R := ClientRect;

  with AdvPreviewMenu.FCurrentStyler do
  begin
    //------- Sides
    R2 := Rect(R.Left, R.Top, GetLeftFrameRect.Left, R.Bottom);
    Canvas.Brush.Color := FrameAppearance.Color;
    Canvas.FillRect(R2);
    R2 := Rect(GetRightFrameRect.Right, R.Top, R.Right , R.Bottom);
    Canvas.FillRect(R2);
    //------- Top Frame
    R2 := Rect(R.Left, R.Top, R.Right, R.Top + AdvPreviewMenu.TopFrameHeight);
    DrawVistaGradient(Canvas, R2, FrameAppearance.Color, FrameAppearance.ColorTo, FrameAppearance.ColorMirror, FrameAppearance.ColorMirrorTo, clNone,
          FrameAppearance.Gradient, FrameAppearance.GradientMirror, '', Canvas.Font, Enabled, False, aaClearType, False{Rounded}, False, dwpTop);
    R3 := R2;
    //------- Bottom Frame
    R2 := Rect(R.Left, R.Bottom - AdvPreviewMenu.BottomFrameHeight, R.Right, R.Bottom);
    DrawVistaGradient(Canvas, R2, FrameAppearance.Color, FrameAppearance.ColorTo, FrameAppearance.ColorMirror, FrameAppearance.ColorMirrorTo, clNone,
          FrameAppearance.Gradient, FrameAppearance.GradientMirror, '', Canvas.Font, Enabled, False, aaClearType, False{Rounded}, False, dwpTop);

    //------- Borders      
    R2 := R;
    R2.Right := R2.Right-1;
    R2.Bottom := R2.Bottom-1;
    Canvas.Brush.Style := bsClear;
    Canvas.Pen.Color := FrameAppearance.BorderColor;
    Canvas.RoundRect(R2.Left, R2.Top, R2.Right, R2.Bottom, 5, 5);

    R2 := Rect(R2.Left+1, R2.Top+1, R2.Right-1, R2.Bottom-1);
    Canvas.Pen.Color := BlendColor(FrameAppearance.Color, clWhite, 50);
    Canvas.RoundRect(R2.Left, R2.Top, R2.Right, R2.Bottom, 5, 5);

    //------- Left & Right Frames
    R2 := GetLeftFrameRect;
    Canvas.Brush.Color := LeftFrameColor;
    Canvas.FillRect(R2);
    {Canvas.Brush.Color := RightFrameColor;
    R2 := GetRightFrameRect;
    Canvas.FillRect(R2);}
    DrawRightFrame(False);
    
    //------- Frame Borders
    Canvas.Brush.Style := bsClear;
    Canvas.Pen.Color := BlendColor(FrameAppearance.Color, clWhite, 50);
    R2 := GetItemFramesRect;
    Canvas.Rectangle(R2.Left-2, R2.Top-2, R2.Right+2, R2.Bottom+2);
    Canvas.Rectangle(R2.Left, R2.Top, R2.Right, R2.Bottom);
    Canvas.MoveTo(R2.Left-2, R2.Top-3);
    Canvas.LineTo(R2.Right+2, R2.Top-3);
    Canvas.Pen.Color := FrameAppearance.BorderColor;
    Canvas.Rectangle(R2.Left-1, R2.Top-1, R2.Right+1, R2.Bottom+1);

    R2 := GetLeftFrameRect;
    Canvas.Pen.Color := clSilver;
    Canvas.MoveTo(R2.Right, R2.Top);
    Canvas.LineTo(R2.Right, R2.Bottom);
    {Canvas.Pen.Color := BlendColor(clSilver, clWhite, 20);
    Canvas.MoveTo(R2.Right-1, R2.Top);
    Canvas.LineTo(R2.Right-1, R2.Bottom); }
  end;

  if Assigned(AdvPreviewMenu.OnDrawButtonFrameTop) then
  begin
    AdvPreviewMenu.OnDrawButtonFrameTop(AdvPreviewMenu, Canvas, R3);
  end;

  DrawItems;
  DrawSubMenuItems;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.DrawItem(Index: Integer; RefreshItem: Boolean = false);
var
  ItemR, R, R2, BtnR, DwR: TRect;
  GradColor: TColor;
  GradColorTo: TColor;
  GradColorMirror: TColor;
  GradColorMirrorTo: TColor;
  PenColor: TColor;
  GradB, GradU: TGDIPGradient;
  TxtClr: TColor;
  Pic: TGDIPPicture;
  SplitBtn: Boolean;
  BtnPos: TButtonPosition;
begin
  if not Assigned(AdvPreviewMenu) or (Index < 0) or (Index >= FAdvPreviewMenu.MenuItems.Count)
     or (not AdvPreviewMenu.MenuItems.Items[Index].Visible and not FEditorCreated) then
    Exit;

  ItemR := GetItemRect(Index);
  R := ItemR;
  BtnR := R;
  if (AdvPreviewMenu.MenuItems.Items[Index].SubItems.Count > 0) and (AdvPreviewMenu.MenuItems.Items[Index].CanSelect) then
  begin
    DwR := Rect(BtnR.Right - MENUARROW_WIDTH, BtnR.Top, BtnR.Right, BtnR.Bottom);
    BtnR.Right := DwR.Left+1;
    SplitBtn := True;
    BtnPos := bpLeft;
  end
  else
  begin
    DwR := Rect(-1, -1, -1, -1);
    SplitBtn := False;
    BtnPos := bpStandalone;
  end;

  with AdvPreviewMenu.FCurrentStyler do
  begin
    if (AdvPreviewMenu.MenuItems.Items[Index].Separator) then
    begin
      Canvas.Pen.Color := RGB(197, 197, 197);
      Canvas.MoveTo(R.Left + (R.Right - R.left) div 3, R.Bottom-1);
      Canvas.LineTo(R.Right, R.Bottom-1);
      BtnR.Bottom := BtnR.Bottom-1;
    end;
    
    if not AdvPreviewMenu.MenuItems.Items[Index].Enabled and not FEditorCreated then
    begin
      if SplitBtn and false then
      begin
        GradColor := BlendColor(MenuItemAppearance.ColorDisabled, clWhite, 50);
        GradColorTo := BlendColor(MenuItemAppearance.ColorDisabledTo, clWhite, 50);
        GradColorMirror := BlendColor(MenuItemAppearance.ColorMirrorDisabled, clWhite, 50);
        GradColorMirrorTo := BlendColor(MenuItemAppearance.ColorMirrorDisabledTo, clWhite, 50);
      end
      else
      begin
        GradColor := MenuItemAppearance.ColorDisabled;
        GradColorTo := MenuItemAppearance.ColorDisabledTo;
        GradColorMirror := MenuItemAppearance.ColorMirrorDisabled;
        GradColorMirrorTo := MenuItemAppearance.ColorMirrorDisabledTo;
      end;
      PenColor := MenuItemAppearance.BorderColorDisabled;
      TxtClr := MenuItemAppearance.TextColorDisabled;
      GradB := MenuItemAppearance.GradientDisabled;
      GradU := MenuItemAppearance.GradientMirrorDisabled;

      if (GradColorTo <> clNone) then
      begin
        DrawVistaGradient(Canvas, BtnR, GradColor, GradColorTo, GradColorMirror, GradColorMirrorTo, PenColor,
            GradB, GradU, '', Canvas.Font, Enabled, False, aaClearType, MenuItemAppearance.Rounded, False, dwpTop, nil, BtnPos);

        if SplitBtn then
        begin
          DrawVistaGradient(Canvas, DwR, MenuItemAppearance.ColorDisabled, MenuItemAppearance.ColorDisabledTo, MenuItemAppearance.ColorMirrorDisabled, MenuItemAppearance.ColorMirrorDisabledTo, PenColor,
            GradB, GradU, '', Canvas.Font, Enabled, False, aaClearType, MenuItemAppearance.Rounded, False, dwpTop, nil, bpRight);

          Canvas.Pen.Color := PenColor;
          Canvas.MoveTo(DwR.Left, DwR.Top);
          Canvas.LineTo(DwR.Left, DwR.Bottom);
        end;
      end
      else if (GradColor <> clNone) then
      begin
        Canvas.Brush.Color := GradColor;
        Canvas.Pen.Color := GradColor;
        Canvas.Rectangle(BtnR.Left, BtnR.Top, BtnR.Right, BtnR.Bottom);
        if SplitBtn then
        begin
          Canvas.Brush.Color := MenuItemAppearance.ColorHot;
          Canvas.Pen.Color := MenuItemAppearance.ColorHot;
          Canvas.Rectangle(DwR.Left, DwR.Top, DwR.Right, DwR.Bottom);
        end;
      end;
    end
    else if ((Index = FItemDown) or ((Index = FItemHot) and (Index = FItemIndex))) and not FEditorCreated then
    begin
      if SplitBtn then
      begin
        GradColor := BlendColor(MenuItemAppearance.ColorDown, clWhite, 50);
        GradColorTo := BlendColor(MenuItemAppearance.ColorDownTo, clWhite, 50);
        GradColorMirror := BlendColor(MenuItemAppearance.ColorMirrorDown, clWhite, 50);
        GradColorMirrorTo := BlendColor(MenuItemAppearance.ColorMirrorDownTo, clWhite, 50);
      end
      else
      begin
        GradColor := MenuItemAppearance.ColorDown;
        GradColorTo := MenuItemAppearance.ColorDownTo;
        GradColorMirror := MenuItemAppearance.ColorMirrorDown;
        GradColorMirrorTo := MenuItemAppearance.ColorMirrorDownTo;
      end;
      PenColor := MenuItemAppearance.BorderColorDown;
      TxtClr := MenuItemAppearance.TextColorDown;
      GradB := MenuItemAppearance.GradientDown;
      GradU := MenuItemAppearance.GradientMirrorDown;

      if (GradColorTo <> clNone) then
      begin
        if not FButtonPartHot then
        begin
          DrawVistaGradient(Canvas, BtnR, GradColor, GradColorTo, GradColorMirror, GradColorMirrorTo, PenColor,
              GradB, GradU, '', Canvas.Font, Enabled, False, aaClearType, MenuItemAppearance.Rounded, False, dwpTop, nil, BtnPos);
        end
        else
        begin
          DrawVistaGradient(Canvas, BtnR, MenuItemAppearance.ColorHot, MenuItemAppearance.ColorHotTo, MenuItemAppearance.ColorMirrorHot, MenuItemAppearance.ColorMirrorHotTo, PenColor,
            GradB, GradU, '', Canvas.Font, Enabled, False, aaClearType, MenuItemAppearance.Rounded, False, dwpTop, nil, bpRight);
        end;

        if SplitBtn then
        begin
          if not FDropDownPartHot then
          begin
            DrawVistaGradient(Canvas, DwR, GradColor, GradColorTo, GradColorMirror, GradColorMirrorTo, PenColor,
                GradB, GradU, '', Canvas.Font, Enabled, False, aaClearType, MenuItemAppearance.Rounded, False, dwpTop, nil, BtnPos);
          end
          else
          begin
            DrawVistaGradient(Canvas, DwR, MenuItemAppearance.ColorHot, MenuItemAppearance.ColorHotTo, MenuItemAppearance.ColorMirrorHot, MenuItemAppearance.ColorMirrorHotTo, PenColor,
              GradB, GradU, '', Canvas.Font, Enabled, False, aaClearType, MenuItemAppearance.Rounded, False, dwpTop, nil, bpRight);
          end;

          Canvas.Pen.Color := PenColor;
          Canvas.MoveTo(DwR.Left, DwR.Top);
          Canvas.LineTo(DwR.Left, DwR.Bottom);
        end;
      end
      else if (GradColor <> clNone) then
      begin
        Canvas.Brush.Color := GradColor;
        Canvas.Pen.Color := GradColor;
        Canvas.Rectangle(BtnR.Left, BtnR.Top, BtnR.Right, BtnR.Bottom);
        if SplitBtn then
        begin
          Canvas.Brush.Color := MenuItemAppearance.ColorHot;
          Canvas.Pen.Color := MenuItemAppearance.ColorHot;
          Canvas.Rectangle(DwR.Left, DwR.Top, DwR.Right, DwR.Bottom);
        end;
      end;
    end
    else if (Index = FItemHot) and not FEditorCreated then
    begin
      if SplitBtn then
      begin
        GradColor := BlendColor(MenuItemAppearance.ColorHot, clWhite, 50); //BrightnessColor(MenuItemAppearance.ColorHot,-10);
        GradColorTo := BlendColor(MenuItemAppearance.ColorHotTo, clWhite, 50);
        GradColorMirror := BlendColor(MenuItemAppearance.ColorMirrorHot, clWhite, 50);
        GradColorMirrorTo := BlendColor(MenuItemAppearance.ColorMirrorHotTo, clWhite, 50);
      end
      else
      begin
        GradColor := MenuItemAppearance.ColorHot;
        GradColorTo := MenuItemAppearance.ColorHotTo;
        GradColorMirror := MenuItemAppearance.ColorMirrorHot;
        GradColorMirrorTo := MenuItemAppearance.ColorMirrorHotTo;
      end;
      PenColor := MenuItemAppearance.BorderColorHot;
      TxtClr := MenuItemAppearance.TextColorHot;
      GradB := MenuItemAppearance.GradientHot;
      GradU := MenuItemAppearance.GradientMirrorHot;

      if (GradColorTo <> clNone) then
      begin
        if not FButtonPartHot then
        begin
          DrawVistaGradient(Canvas, BtnR, GradColor, GradColorTo, GradColorMirror, GradColorMirrorTo, PenColor,
              GradB, GradU, '', Canvas.Font, Enabled, False, aaClearType, MenuItemAppearance.Rounded, False, dwpTop, nil, BtnPos);
        end
        else
        begin
          DrawVistaGradient(Canvas, BtnR, MenuItemAppearance.ColorHot, MenuItemAppearance.ColorHotTo, MenuItemAppearance.ColorMirrorHot, MenuItemAppearance.ColorMirrorHotTo, PenColor,
            GradB, GradU, '', Canvas.Font, Enabled, False, aaClearType, MenuItemAppearance.Rounded, False, dwpTop, nil, bpLeft);
        end;

        if SplitBtn then
        begin
          if not FDropDownPartHot then
          begin
            DrawVistaGradient(Canvas, DwR, GradColor, GradColorTo, GradColorMirror, GradColorMirrorTo, PenColor,
                GradB, GradU, '', Canvas.Font, Enabled, False, aaClearType, MenuItemAppearance.Rounded, False, dwpTop, nil, bpRight);
          end
          else
          begin
            DrawVistaGradient(Canvas, DwR, MenuItemAppearance.ColorHot, MenuItemAppearance.ColorHotTo, MenuItemAppearance.ColorMirrorHot, MenuItemAppearance.ColorMirrorHotTo, PenColor,
              GradB, GradU, '', Canvas.Font, Enabled, False, aaClearType, MenuItemAppearance.Rounded, False, dwpTop, nil, bpRight);
          end;

          Canvas.Pen.Color := PenColor;
          Canvas.MoveTo(DwR.Left, DwR.Top);
          Canvas.LineTo(DwR.Left, DwR.Bottom);
        end;
      end
      else if (GradColor <> clNone) then
      begin
        Canvas.Brush.Color := GradColor;
        Canvas.Pen.Color := GradColor;
        Canvas.Rectangle(BtnR.Left, BtnR.Top, BtnR.Right, BtnR.Bottom);
        if SplitBtn then
        begin
          Canvas.Brush.Color := MenuItemAppearance.ColorHot;
          Canvas.Pen.Color := MenuItemAppearance.ColorHot;
          Canvas.Rectangle(DwR.Left, DwR.Top, DwR.Right, DwR.Bottom);
        end;
      end;
    end
    else // Normal
    begin
      if RefreshItem then
      begin
  {$IFNDEF TMSDOTNET}
        InvalidateRect(Handle, @R, True);
  {$ENDIF}
  {$IFDEF TMSDOTNET}
        InvalidateRect(Handle, R, True);
  {$ENDIF}
        Exit;
      end;
      
      GradColor := MenuItemAppearance.Color;
      GradColorTo := MenuItemAppearance.ColorTo;
      GradColorMirror := MenuItemAppearance.ColorMirror;
      GradColorMirrorTo := MenuItemAppearance.ColorMirrorTo;
      PenColor := MenuItemAppearance.BorderColor;
      TxtClr := MenuItemAppearance.TextColor;
      GradB := MenuItemAppearance.Gradient;
      GradU := MenuItemAppearance.GradientMirror;


      if ((Index = FItemIndex) and not FEditorCreated) or (FEditorCreated and (Index = FSelectedItem)) then // Selected Item
      begin
        GradColor := MenuItemAppearance.ColorChecked;
        GradColorTo := MenuItemAppearance.ColorCheckedTo;
        GradColorMirror := MenuItemAppearance.ColorMirrorChecked;
        GradColorMirrorTo := MenuItemAppearance.ColorMirrorCheckedTo;
        PenColor := MenuItemAppearance.BorderColorChecked;
        TxtClr := MenuItemAppearance.TextColorChecked;
        GradB := MenuItemAppearance.GradientChecked;
        GradU := MenuItemAppearance.GradientMirrorChecked;
      end;
      if FEditorCreated and not AdvPreviewMenu.MenuItems.Items[Index].Enabled then
      begin
        PenColor := MenuItemAppearance.BorderColorDisabled;
        TxtClr := MenuItemAppearance.TextColorDisabled;
      end;

      if SplitBtn and (GradColor <> clNone) then
      begin
        GradColor := BlendColor(GradColor, clWhite, 50);
        GradColorTo := BlendColor(GradColorTo, clWhite, 50);
        GradColorMirror := BlendColor(GradColorMirror, clWhite, 50);
        GradColorMirrorTo := BlendColor(GradColorMirror, clWhite, 50);
      end;

      if (GradColorTo <> clNone) and (GradColorTo <> clNone) then
      begin
        DrawVistaGradient(Canvas, BtnR, GradColor, GradColorTo, GradColorMirror, GradColorMirrorTo, PenColor,
            GradB, GradU, '', Canvas.Font, Enabled, False, aaClearType, MenuItemAppearance.Rounded, False, dwpTop, nil, BtnPos);

        if SplitBtn then
        begin
          DrawVistaGradient(Canvas, DwR, MenuItemAppearance.Color, MenuItemAppearance.ColorTo, MenuItemAppearance.ColorMirror, MenuItemAppearance.ColorMirrorTo, PenColor,
            GradB, GradU, '', Canvas.Font, Enabled, False, aaClearType, MenuItemAppearance.Rounded, False, dwpTop, nil, bpRight);

          if (PenColor <> clNone) then
          begin
            Canvas.Pen.Color := PenColor;
            Canvas.MoveTo(DwR.Left, DwR.Top);
            Canvas.LineTo(DwR.Left, DwR.Bottom);
          end;
        end;
      end
      else if (GradColor <> clNone) then
      begin
        Canvas.Brush.Color := GradColor;
        Canvas.Pen.Color := GradColor;
        Canvas.Rectangle(BtnR.Left, BtnR.Top, BtnR.Right, BtnR.Bottom);
        if SplitBtn then
        begin
          Canvas.Brush.Color := MenuItemAppearance.Color;
          Canvas.Pen.Color := MenuItemAppearance.Color;
          Canvas.Rectangle(DwR.Left, DwR.Top, DwR.Right, DwR.Bottom);
        end;
      end;

    end;

    if Assigned(AdvPreviewMenu.OnMenuDrawItem) then
    begin
      AdvPreviewMenu.OnMenuDrawItem(AdvPreviewMenu, Canvas, Index, R);
    end
    else
    begin
      //------ Draw Image
      R2 := Rect(R.Left + AdvPreviewMenu.MenuSpacing, R.Top, R.Right - AdvPreviewMenu.MenuSpacing, R.Bottom);
      if not AdvPreviewMenu.MenuItems.Items[Index].Picture.Empty or (not AdvPreviewMenu.MenuItems.Items[Index].DisabledPicture.Empty and not AdvPreviewMenu.MenuItems.Items[Index].Enabled) then
      begin
        if AdvPreviewMenu.MenuItems.Items[Index].Enabled or AdvPreviewMenu.MenuItems.Items[Index].DisabledPicture.Empty then
          Pic := AdvPreviewMenu.MenuItems.Items[Index].Picture
        else
          Pic := AdvPreviewMenu.MenuItems.Items[Index].DisabledPicture;

        Pic.GetImageSizes;
        Canvas.Draw(R2.left, R2.Top + (R2.Bottom - R2.Top - Pic.Height) div 2, Pic);
        R2.Left := R2.left + Pic.Width + FImageSpace;
      end
      else if Assigned(AdvPreviewMenu.MenuImages) and (AdvPreviewMenu.MenuItems.Items[Index].ImageIndex >= 0) then
      begin
        AdvPreviewMenu.MenuImages.Draw(Canvas, R2.left, R.Top + (R2.Bottom - R2.Top - AdvPreviewMenu.MenuImages.Height) div 2, AdvPreviewMenu.MenuItems.Items[Index].ImageIndex, AdvPreviewMenu.MenuItems.Items[Index].Enabled);
        R2.Left := R2.left + AdvPreviewMenu.MenuImages.Width + FImageSpace;
      end;

      //------ Draw Text
      Canvas.Brush.Style := bsClear;
      if (AdvPreviewMenu.MenuItems.Items[Index].Caption <> '') then
      begin
        Canvas.Font.Assign(MenuItemAppearance.Font);
        Canvas.Font.Color := TxtClr;
  {$IFNDEF TMSDOTNET}
        DrawText(Canvas.Handle, PChar(AdvPreviewMenu.MenuItems.Items[Index].Caption), -1, R2, DT_SINGLELINE or DT_VCENTER or DT_LEFT);
  {$ENDIF}
  {$IFDEF TMSDOTNET}
        DrawText(Canvas.Handle, AdvPreviewMenu.MenuItems.Items[Index].Caption, -1, R2, DT_SINGLELINE or DT_VCENTER or DT_LEFT);
  {$ENDIF}
      end
      else if (AdvPreviewMenu.MenuItems.Items[Index].WideCaption <> '') then
      begin
        Canvas.Font.Assign(MenuItemAppearance.Font);
        Canvas.Font.Color := TxtClr;
  {$IFNDEF TMSDOTNET}
        DrawTextW(Canvas.Handle, PWideChar(AdvPreviewMenu.MenuItems.Items[Index].WideCaption), -1, R2, DT_SINGLELINE or DT_VCENTER or DT_LEFT);
  {$ENDIF}
  {$IFDEF TMSDOTNET}
        DrawTextW(Canvas.Handle, AdvPreviewMenu.MenuItems.Items[Index].WideCaption, -1, R2, DT_SINGLELINE or DT_VCENTER or DT_LEFT);
  {$ENDIF}
      end;
    end;

    if (AdvPreviewMenu.MenuItems.Items[Index].SubItems.Count > 0) then
      DrawRightArrow(Canvas, R.Right - MENUARROW_WIDTH + ((MENUARROW_WIDTH - 6) div 2), R.Top + (R.Bottom - R.Top - 6) div 2, 6, Canvas.Font.Color);

    if FShortCutItemHintShowing then
    begin
      if AdvPreviewMenu.MenuItems.Items[Index].ShortCutHintShowing then
        DrawItemShortCutHint(Index);
      if AdvPreviewMenu.MenuItems.Items[Index].ShortCutSubItemHintShowing then
        DrawItemSubItemShortCutHint(Index);
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.DrawItems;
var
  i: Integer;
begin
  if not Assigned(AdvPreviewMenu) then
    Exit;

  for i:= 0 to FAdvPreviewMenu.MenuItems.Count-1 do
  begin
    DrawItem(i);
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.DrawSubMenuItem(AIndex: Integer; RefreshItem: Boolean = false; ACanvas: TCanvas = nil);
var
  R, R2, R3, R4: TRect;
  GradColor: TColor;
  GradColorTo: TColor;
  GradColorMirror: TColor;
  GradColorMirrorTo: TColor;
  PenColor: TColor;
  GradB, GradU: TGDIPGradient;
  TxtClr: TColor;
  Pic: TGDIPPicture;
  i: Integer;
  DTSTYLE: dword;
  SubItems: TAdvPreviewSubMenuItems;
  SubMenuItemSpacing: Integer;
  SubMenuCaption: string;
  SubMenuItemIndex: Integer;
  CanvasClipped: Boolean;
  //rgn: HRGN;
  //ACanvas: TCanvas;
  bmp: TBitmap;
begin
  if not Assigned(AdvPreviewMenu) or (FSubMenuItem >= AdvPreviewMenu.MenuItems.Count)
     or (AIndex < 0){ or (FSubMenuScroller.Visible and ((AIndex < FTopSubMenuItem) or (AIndex > FTopSubMenuItem + FSubMenuVisibleItemCount)))} then
    Exit;

  if (FSubMenuItem >= 0) then
  begin
    SubItems := FAdvPreviewMenu.MenuItems.Items[FSubMenuItem].SubItems;
    SubMenuItemSpacing := FAdvPreviewMenu.MenuItems.Items[FSubMenuItem].SubmenuItemSpacing;
    SubMenuCaption := FAdvPreviewMenu.MenuItems.Items[FSubMenuItem].SubMenuCaption;
    SubMenuItemIndex := FAdvPreviewMenu.MenuItems.Items[FSubMenuItem].SubMenuItemIndex;
  end
  else
  begin
    SubItems := AdvPreviewMenu.SubMenuItems;
    SubMenuItemSpacing := FAdvPreviewMenu.SubMenuItemSpacing;
    SubMenuCaption := FAdvPreviewMenu.SubMenuCaption;
    SubMenuItemIndex := -1;
  end;

  if (AIndex >= SubItems.Count) or ((not SubItems.Items[AIndex].Visible) and not FEditorCreated) then
    Exit;

  R := GetSubMenuItemRect(AIndex);

  if (R.Top < 0) and (R.Bottom < 0) then
    Exit;

  if FEditorCreated then  // fix left border selection line after scrolling in editor
    R.Left := R.Left + 1;
    
  if (ACanvas = nil) then
    ACanvas := Canvas;

  CanvasClipped := False;
  bmp := nil;
  if FSubMenuScroller.Visible and not FSubMenuScrolling then
  begin
    if FSubMenuScroller.CanGoBack then
    begin
      R4 := GetUpScrollBtnRect;
      if (R.Top < R4.Bottom) and (R.Bottom > R4.Bottom) then
      begin
        CanvasClipped := True;
        //rgn := CreateRectRgn(R.Left, R4.Bottom, R.Right, R.Bottom);
        //SelectClipRgn(Canvas.Handle, rgn);
        R4 := Rect(R.Left, R4.Bottom, R.Right, R.Bottom);
        bmp := TBitmap.Create;
        bmp.Height := Self.Height; // R.Bottom - R4.Bottom;
        bmp.Width := Self.Width; // R.Right - R.Left;
        ACanvas := bmp.Canvas;
      end;
    end;

    if not CanvasClipped and FSubMenuScroller.CanGoForward then
    begin
      R4 := GetDownScrollBtnRect;
      if (R.Top < R4.Top) and (R.Bottom > R4.Top) then
      begin
        CanvasClipped := True;
        //rgn := CreateRectRgn(R.Left, R.Top, R.Right, R4.Top);
        //SelectClipRgn(Canvas.Handle, rgn);
        R4 := Rect(R.Left, R.Top, R.Right, R4.Top);
        bmp := TBitmap.Create;
        bmp.Height := Self.Height; // R4.Top - R.Top;
        bmp.Width := Self.Width; // R.Right - R.Left;
        ACanvas := bmp.Canvas;
      end;
    end;
  end;

  if not CanvasClipped then
    R4 := R;

  with AdvPreviewMenu.FCurrentStyler do
  begin
    if (SubItems.Items[AIndex].Separator) then
    begin
      ACanvas.Pen.Color := RGB(197, 197, 197);
      ACanvas.MoveTo(R.Left + (R.Right - R.left) div 3, R.Bottom-1);
      ACanvas.LineTo(R.Right, R.Bottom-1);
      R.Bottom := R.Bottom-1;
    end;

    if not SubItems.Items[AIndex].Enabled and not FEditorCreated then
    begin
      if (MenuItemAppearance.ColorDisabledTo <> clNone) then
      begin
        DrawVistaGradient(ACanvas, R, MenuItemAppearance.ColorDisabled, MenuItemAppearance.ColorDisabledTo, MenuItemAppearance.ColorMirrorDisabled, MenuItemAppearance.ColorMirrorDisabledTo, MenuItemAppearance.BorderColorDisabled,
            MenuItemAppearance.GradientDisabled, MenuItemAppearance.GradientMirrorDisabled, '', ACanvas.Font, Enabled, False, aaClearType, MenuItemAppearance.Rounded, False);
      end
      else if (MenuItemAppearance.ColorDisabled <> clNone) then
      begin
        ACanvas.Brush.Color := MenuItemAppearance.ColorDisabled;
        ACanvas.Pen.Color := MenuItemAppearance.ColorDisabled;
        ACanvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
      end;
      
      TxtClr := MenuItemAppearance.TextColorDisabled;
    end
    else if ((AIndex = FSubMenuItemDown) or ((AIndex = FSubMenuItemHot) and (AIndex = SubMenuItemIndex))) and not FEditorCreated then
    begin
      if (MenuItemAppearance.ColorDownTo <> clNone) then
      begin
        DrawVistaGradient(ACanvas, R, MenuItemAppearance.ColorDown, MenuItemAppearance.ColorDownTo, MenuItemAppearance.ColorMirrorDown, MenuItemAppearance.ColorMirrorDownTo, MenuItemAppearance.BorderColorDown,
            MenuItemAppearance.GradientDown, MenuItemAppearance.GradientMirrorDown, '', ACanvas.Font, Enabled, False, aaClearType, MenuItemAppearance.Rounded, False);
      end
      else if (MenuItemAppearance.ColorDown <> clNone) then
      begin
        ACanvas.Brush.Color := MenuItemAppearance.ColorDown;
        ACanvas.Pen.Color := MenuItemAppearance.ColorDown;
        ACanvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
      end;

      TxtClr := MenuItemAppearance.TextColorDown;
    end
    else if (AIndex = FSubMenuItemHot) and not FEditorCreated then
    begin
      if (MenuItemAppearance.ColorHotTo <> clNone) then
      begin
        DrawVistaGradient(ACanvas, R, MenuItemAppearance.ColorHot, MenuItemAppearance.ColorHotTo, MenuItemAppearance.ColorMirrorHot, MenuItemAppearance.ColorMirrorHotTo, MenuItemAppearance.BorderColorHot,
            MenuItemAppearance.GradientHot, MenuItemAppearance.GradientMirrorHot, '', ACanvas.Font, Enabled, False, aaClearType, MenuItemAppearance.Rounded, False);
      end
      else if (MenuItemAppearance.ColorHot <> clNone) then
      begin
        ACanvas.Brush.Color := MenuItemAppearance.ColorHot;
        ACanvas.Pen.Color := MenuItemAppearance.ColorHot;
        ACanvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
      end;

      TxtClr := MenuItemAppearance.TextColorHot;
    end
    else // Normal
    begin
      if RefreshItem then
      begin
  {$IFNDEF TMSDOTNET}
        InvalidateRect(Handle, @R4, True);
  {$ENDIF}
  {$IFDEF TMSDOTNET}
        InvalidateRect(Handle, R4, True);
  {$ENDIF}
        Exit;
      end;
      
      GradColor := MenuItemAppearance.Color;
      GradColorTo := MenuItemAppearance.ColorTo;
      GradColorMirror := MenuItemAppearance.ColorMirror;
      GradColorMirrorTo := MenuItemAppearance.ColorMirrorTo;
      PenColor := MenuItemAppearance.BorderColor;
      TxtClr := MenuItemAppearance.TextColor;
      GradB := MenuItemAppearance.Gradient;
      GradU := MenuItemAppearance.GradientMirror;


      if ((AIndex = SubMenuItemIndex) and not FEditorCreated) or (FEditorCreated and (AIndex = FSelectedSubItem))then // Selected Item
      begin
        GradColor := MenuItemAppearance.ColorChecked;
        GradColorTo := MenuItemAppearance.ColorCheckedTo;
        GradColorMirror := MenuItemAppearance.ColorMirrorChecked;
        GradColorMirrorTo := MenuItemAppearance.ColorMirrorCheckedTo;
        PenColor := MenuItemAppearance.BorderColorChecked;
        TxtClr := MenuItemAppearance.TextColorChecked;
        GradB := MenuItemAppearance.GradientChecked;
        GradU := MenuItemAppearance.GradientMirrorChecked;
      end;

      if FEditorCreated and not SubItems.Items[AIndex].Enabled then
      begin
        PenColor := MenuItemAppearance.BorderColorDisabled;
        TxtClr := MenuItemAppearance.TextColorDisabled;
      end;

      if (GradColor <> clNone) and (GradColorTo <> clNone) then
      begin
        DrawVistaGradient(ACanvas, R, GradColor, GradColorTo, GradColorMirror, GradColorMirrorTo, PenColor,
          GradB, GradU, '', ACanvas.Font, Enabled, False, aaClearType, MenuItemAppearance.Rounded, False, dwpTop, nil);
      end
      else if (GradColor <> clNone) then
      begin
        ACanvas.Brush.Color := GradColor;
        ACanvas.Pen.Color := GradColorTo;
        ACanvas.Rectangle(R.Left, R.Top, R.Right, R.Bottom);
      end;

    end;

    if Assigned(AdvPreviewMenu.OnSubMenuDrawItem) then
    begin
      AdvPreviewMenu.OnSubMenuDrawItem(AdvPreviewMenu, ACanvas, FSubMenuItem, AIndex, R);
    end
    else
    begin
      //------ Draw Image
      R2 := Rect(R.Left + SubMenuItemSpacing, R.Top, R.Right - SubMenuItemSpacing, R.Bottom);
      if not SubItems.Items[AIndex].Picture.Empty or (not SubItems.Items[AIndex].DisabledPicture.Empty and not SubItems.Items[AIndex].Enabled) then
      begin
        if SubItems.Items[AIndex].Enabled or SubItems.Items[AIndex].DisabledPicture.Empty then
          Pic := SubItems.Items[AIndex].Picture
        else
          Pic := SubItems.Items[AIndex].DisabledPicture;

        Pic.GetImageSizes;
        ACanvas.Draw(R2.left, R2.Top + (R2.Bottom - R2.Top - Pic.Height) div 2, Pic);
        R2.Left := R2.left + Pic.Width + FImageSpace;
      end
      else if Assigned(AdvPreviewMenu.SubMenuImages) and (SubItems.Items[AIndex].ImageIndex >= 0) then
      begin
        AdvPreviewMenu.SubMenuImages.Draw(ACanvas, R2.left, R.Top + (R2.Bottom - R2.Top - AdvPreviewMenu.SubMenuImages.Height) div 2, SubItems.Items[AIndex].ImageIndex, SubItems.Items[AIndex].Enabled);
        R2.Left := R2.left + AdvPreviewMenu.SubMenuImages.Width + FImageSpace;
      end;

      //R2.Top := R.Top + SubMenuItemSpacing;
      //------ Draw Text
      ACanvas.Brush.Style := bsClear;
      if (SubItems.Items[AIndex].Title <> '') or (SubItems.Items[AIndex].WideTitle <> '') then
      begin
        ACanvas.Font.Assign(MenuItemAppearance.SubItemTitleFont);
        ACanvas.Font.Color := TxtClr;
        if (SubItems.Items[AIndex].Notes.Count = 0) and (SubItems.Items[AIndex].WideNotes = '') then
          DTSTYLE := DT_SINGLELINE or DT_VCENTER or DT_LEFT
        else
          DTSTYLE := DT_SINGLELINE or DT_TOP or DT_LEFT;
        if (SubItems.Items[AIndex].Title <> '') then
        begin
    {$IFNDEF TMSDOTNET}
          DrawText(ACanvas.Handle, PChar(SubItems.Items[AIndex].Title), -1, R2, DTSTYLE);
    {$ENDIF}
    {$IFDEF TMSDOTNET}
          DrawText(ACanvas.Handle, SubItems.Items[AIndex].Title, -1, R2, DTSTYLE);
    {$ENDIF}
          R3 := Rect(0,0,1000,100);
          DrawText(ACanvas.Handle,PChar(SubItems.Items[AIndex].Title),Length(SubItems.Items[AIndex].Title), R3, DT_CALCRECT or DT_LEFT or DT_SINGlELINE);
          R2.Top := R2.Top + R3.Bottom + FLineSpace*2;
        end
        else
        begin
    {$IFNDEF TMSDOTNET}
          DrawTextW(ACanvas.Handle, PWideChar(SubItems.Items[AIndex].WideTitle), -1, R2, DTSTYLE);
    {$ENDIF}
    {$IFDEF TMSDOTNET}
          DrawTextW(ACanvas.Handle, SubItems.Items[AIndex].WideTitle, -1, R2, DTSTYLE);
    {$ENDIF}
          R3 := Rect(0,0,1000,100);
          DrawTextW(ACanvas.Handle,PWideChar(SubItems.Items[AIndex].WideTitle),Length(SubItems.Items[AIndex].WideTitle), R3, DT_CALCRECT or DT_LEFT or DT_SINGlELINE);
          R2.Top := R2.Top + R3.Bottom + FLineSpace*2;
        end;
      end;

      ACanvas.Font.Assign(MenuItemAppearance.SubItemFont);
      ACanvas.Font.Color := TxtClr;
      if (SubItems.Items[AIndex].Notes.Count > 0) then
      begin
        for i:= 0 to SubItems.Items[AIndex].Notes.Count-1 do
        begin
          if (SubItems.Items[AIndex].Notes[i] <> '') then
          begin
      {$IFNDEF TMSDOTNET}
            DrawText(ACanvas.Handle, PChar(SubItems.Items[AIndex].Notes[i]), -1, R2, DT_SINGLELINE or DT_TOP or DT_LEFT);
      {$ENDIF}
      {$IFDEF TMSDOTNET}
            DrawText(ACanvas.Handle, SubItems.Items[AIndex].Notes[i], -1, R2, DT_SINGLELINE or DT_TOP or DT_LEFT);
      {$ENDIF}

            R3 := Rect(0,0,1000,100);
            DrawText(ACanvas.Handle,PChar(SubItems.Items[AIndex].Notes[i]),Length(SubItems.Items[AIndex].Notes[i]), R3, DT_CALCRECT or DT_LEFT or DT_SINGlELINE);
            R2.Top := R2.Top + R3.Bottom + FLineSpace;
          end;
        end;
      end
      else if (SubItems.Items[AIndex].WideNotes <> '') then
      begin
  {$IFNDEF TMSDOTNET}
        DrawTextW(ACanvas.Handle, PWideChar(SubItems.Items[AIndex].WideNotes), -1, R2, DT_WORDBREAK or DT_TOP or DT_LEFT);
  {$ENDIF}
  {$IFDEF TMSDOTNET}
        DrawTextW(ACanvas.Handle, SubItems.Items[AIndex].WideNotes, -1, R2, DT_WORDBREAK or DT_TOP or DT_LEFT);
  {$ENDIF}

        R3 := Rect(0,0,1000,100);
        DrawTextW(ACanvas.Handle,PWideChar(SubItems.Items[AIndex].WideNotes),Length(SubItems.Items[AIndex].WideNotes), R3, DT_CALCRECT or DT_LEFT or DT_SINGlELINE);
        R2.Top := R2.Top + R3.Bottom + FLineSpace;
      end;
    end;
    
    if Assigned(SubItems.Items[AIndex].SubMenu) then
      DrawRightArrow(ACanvas, R.Right - MENUARROW_WIDTH + 4, R.Top + (R.Bottom - R.Top - 6) div 2, 6, ACanvas.Font.Color);

    if FShortCutSubMenuItemHintShowing and (SubItems.Items[AIndex].ShortCutHintShowing) then
      DrawSubMenuItemShortCutHint(AIndex);
  end;

  if CanvasClipped then
  begin
    //SelectClipRgn(Canvas.Handle, 0);
    //DeleteObject(rgn);
    Canvas.CopyMode := cmSrcCopy;
    Canvas.CopyRect(R4, bmp.Canvas, R4);
    bmp.Free;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.DrawSubMenuItems(ACanvas: TCanvas = nil);
var
  i: Integer;
  R: TRect;
  SubItems: TAdvPreviewSubMenuItems;
  SubMenuItemSpacing: Integer;
  SubMenuCaption: string;
  WideSubMenuCaption: widestring;
begin
  if not Assigned(AdvPreviewMenu) or (FSubMenuItem >= AdvPreviewMenu.MenuItems.Count) then
    Exit;

  if (ACanvas = nil) then
    ACanvas := Canvas;

  if (FSubMenuItem >= 0) then
  begin
    SubItems := FAdvPreviewMenu.MenuItems.Items[FSubMenuItem].SubItems;
    SubMenuItemSpacing := FAdvPreviewMenu.MenuItems.Items[FSubMenuItem].SubmenuItemSpacing;
    SubMenuCaption := FAdvPreviewMenu.MenuItems.Items[FSubMenuItem].SubMenuCaption;
    WideSubMenuCaption := FAdvPreviewMenu.MenuItems.Items[FSubMenuItem].WideSubMenuCaption;
  end
  else
  begin
    SubItems := AdvPreviewMenu.SubMenuItems;
    SubMenuItemSpacing := FAdvPreviewMenu.SubMenuItemSpacing;
    SubMenuCaption := FAdvPreviewMenu.SubMenuCaption;
    WideSubMenuCaption := FAdvPreviewMenu.WideSubMenuCaption;
  end;

  //----- Draw Caption
  if (SubMenuCaption <> '') or (WideSubMenuCaption <> '') then
  begin
    R := GetSubMenuCaptionRect;
    if (FSubMenuItem >= 0) then
    begin
      ACanvas.Brush.Color := AdvPreviewMenu.FCurrentStyler.FrameAppearance.CaptionBackground;
      ACanvas.FillRect(R);
    end;

    R.Left := R.Left + SubMenuItemSpacing;
    R.Bottom := R.Bottom - 3;
    ACanvas.Brush.Style := bsClear;
    ACanvas.Font.Assign(AdvPreviewMenu.FCurrentStyler.MenuItemAppearance.SubItemTitleFont);
    ACanvas.Font.Color := AdvPreviewMenu.FCurrentStyler.MenuItemAppearance.TextColor;
    if (SubMenuCaption <> '') then
    begin
  {$IFNDEF TMSDOTNET}
      DrawText(ACanvas.Handle, PChar(SubMenuCaption), -1, R, DT_SINGLELINE or DT_VCENTER or DT_LEFT);
  {$ENDIF}
  {$IFDEF TMSDOTNET}
      DrawText(ACanvas.Handle, SubMenuCaption, -1, R, DT_SINGLELINE or DT_VCENTER or DT_LEFT);
  {$ENDIF}
    end
    else
    begin
  {$IFNDEF TMSDOTNET}
      DrawTextW(ACanvas.Handle, PWideChar(WideSubMenuCaption), -1, R, DT_SINGLELINE or DT_VCENTER or DT_LEFT);
  {$ENDIF}
  {$IFDEF TMSDOTNET}
      DrawTextW(ACanvas.Handle, WideSubMenuCaption, -1, R, DT_SINGLELINE or DT_VCENTER or DT_LEFT);
  {$ENDIF}
    end;

    R := GetSubMenuCaptionRect;
    ACanvas.Pen.Color := RGB(197, 197, 197);
    ACanvas.MoveTo(R.Left, R.Bottom-2);
    ACanvas.LineTo(R.Right, R.Bottom-2);
    ACanvas.Pen.Color := BlendColor(AdvPreviewMenu.FCurrentStyler.RightFrameColor, clWhite, 30);
    ACanvas.MoveTo(R.Left, R.Bottom-1);
    ACanvas.LineTo(R.Right, R.Bottom-1);
  end;

  if (FSubMenuItem >= 0) then
  begin
    R := GetSubMenuCaptionRect;
    ACanvas.Pen.Color := clSilver;
    ACanvas.MoveTo(R.Left, R.Top);
    ACanvas.LineTo(R.Right, R.Top);
    R := GetRightFrameRect;
    ACanvas.MoveTo(R.Left+1, R.Top+2);
    ACanvas.LineTo(R.Left+1, R.Bottom-4);
  end;

  //----- Draw SubMenu Items
  for i:= 0 to SubItems.Count-1 do
  begin
    DrawSubMenuItem(i, false, ACanvas);
  end;

  if FSubMenuScroller.Visible then
  begin
    DrawUpScrollBtn;
    DrawDownScrollBtn;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.DrawRightFrame(WithItems: Boolean = True);
var
  R: TRect;
begin
  if not Assigned(AdvPreviewMenu) then
    Exit;

  if (FSubMenuItem >= 0) then
    Canvas.Brush.Color := AdvPreviewMenu.FCurrentStyler.LeftFrameColor
  else
    Canvas.Brush.Color := AdvPreviewMenu.FCurrentStyler.RightFrameColor;
  R := GetRightFrameRect;
  R := Rect(R.left+1, R.Top+1, R.Right-1, R.Bottom-1);
  Canvas.FillRect(R);

  if (FSubMenuItem >= 0) then
  begin
    R.Right := R.Right - SHADOW_WIDTH;
    R.Bottom := R.Bottom - SHADOW_WIDTH;

    Canvas.Pen.Color := AdvPreviewMenu.FCurrentStyler.FrameAppearance.BorderColor;
    Canvas.MoveTo(R.Right, R.Top);
    Canvas.LineTo(R.Right, R.Bottom);
    Canvas.MoveTo(R.Left-1, R.Bottom);
    Canvas.LineTo(R.Right+1, R.Bottom);
    //-- Draw Shadow
    Canvas.Pen.Color := AdvPreviewMenu.FCurrentStyler.RightFrameBorderColor;
    Canvas.MoveTo(R.Right+1, R.Top + 3);
    Canvas.LineTo(R.Right+1, R.Bottom+2);
    Canvas.MoveTo(R.Left + 3, R.Bottom+1);
    Canvas.LineTo(R.Right+4, R.Bottom+1);
    Canvas.Pen.Color := BlendColor(AdvPreviewMenu.FCurrentStyler.RightFrameBorderColor, clWhite, 70);
    Canvas.MoveTo(R.Right+2, R.Top + 4);
    Canvas.LineTo(R.Right+2, R.Bottom+2);
    Canvas.MoveTo(R.Left + 4, R.Bottom+2);
    Canvas.LineTo(R.Right+4, R.Bottom+2);
    Canvas.Pen.Color := BlendColor(AdvPreviewMenu.FCurrentStyler.RightFrameBorderColor, clWhite, 50);
    Canvas.MoveTo(R.Right+3, R.Top + 5);
    Canvas.LineTo(R.Right+3, R.Bottom+2);
    Canvas.MoveTo(R.Left + 5, R.Bottom+3);
    Canvas.LineTo(R.Right+4, R.Bottom+3);
  end;

  if WithItems then
    DrawSubMenuItems;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.InitializeAndUpdate;
var
  h, lw, rw, Ih, Iw, bw, i, j, w, sIw, sIh: Integer;
  R: TRect;
  AdvGlowBtn: TAdvGlowButton;
begin
  if not Assigned(AdvPreviewMenu) then
    Exit;

  FTopSubMenuItem := 0;
  ShowHint := AdvPreviewMenu.ShowHint;
  FShortCutItemHintShowing := False;
  FShortCutSubMenuItemHintShowing := False;
  FShortCutChars := '';  
  FButtonPartHot := False;
  FDropDownPartHot := False;
  FItemIndex := -1;
  FItemHot := -1;
  FItemDown := -1;
  FSubMenuItem := -1;
  FSubMenuItemHot := -1;
  FSubMenuItemDown := -1;

  //---- Left Frame Size Calculation
  GetMaxItemSize(Ih, Iw);
  h := Max(140, (VisibleItemsCount{AdvPreviewMenu.MenuItems.Count} * Ih)+2 {+AdvPreviewMenu.TopFrameHeight + AdvPreviewMenu.BottomFrameHeight});
  lw := Max(100, Iw);

  //---- Right Frame Size Calculation
  FSubMenuItem := -1;
  rw := 0;
  for i:= 0 to AdvPreviewMenu.MenuItems.Count-1 do
  begin
    if (not AdvPreviewMenu.MenuItems.Items[i].Visible) and not FEditorCreated then
      Continue;

    GetSubMenuMaxItemSize(i, sIh, sIw);
    sIh := (VisibleSubItemCount(i){AdvPreviewMenu.MenuItems.Items[i].SubItems.Count} * sIh + 2 + FSubMenuCaptionHeight);
    //h2 := Max(h2, sIh);
    rw := Max(rw, sIw);
    {if (FSubMenuItem < 0) and (AdvPreviewMenu.MenuItems.Items[i].SubItems.Count > 0) then
    begin
      FSubMenuItem := i;
      CalculateSubMenuItemSize;
    end;}
  end;
  //-- consider AdvPreviewMenu.SubMenuItems
  GetSubMenuMaxItemSize(-1, sIh, sIw, AdvPreviewMenu.SubMenuItems);
  sIh := (AdvPreviewMenu.SubMenuItems.Count * sIh + 2 + FSubMenuCaptionHeight);
  //h2 := Max(h2, sIh) + SHADOW_WIDTH + 1;
  rw := Max(rw, sIw) + SHADOW_WIDTH + 1;

  CalculateSubMenuItemSize;   // to recalculate FSubMenuCaptionHeight
  rw := Max(110, rw);

  //---- Button Size
  bw := AdvPreviewMenu.OffSetX*2;
  for i := 0  to AdvPreviewMenu.Buttons.Count-1 do
  begin
    if AdvPreviewMenu.Buttons.Items[i].Visible then
    begin
      bw := bw + AdvPreviewMenu.Buttons.Items[i].Width;
    end;
  end;

  if (AdvPreviewMenu.SubMenuWidth > 0) then
    rw := AdvPreviewMenu.SubMenuWidth;

  if (advPreviewMenu.MenuWidth > 0) then
    lw := advPreviewMenu.MenuWidth;
    
  w := AdvPreviewMenu.OffSetX*2 + lw + rw;
  bw := bw + (AdvPreviewMenu.Buttons.Count-1) * AdvPreviewMenu.ButtonSpacing;
  if (bw > w) then
  begin
    rw := rw + (w - bw);
    w := bw;
  end;


  //---- Setting Height & Width and public variables
  FItemHeight := ih;
  R := ClientRect;
  FLeftFrameRect := Rect(R.Left + AdvPreviewMenu.OffSetX, R.Top + AdvPreviewMenu.TopFrameHeight, R.Left + AdvPreviewMenu.OffSetX + lw, R.Top + AdvPreviewMenu.TopFrameHeight + h);
  FRightFrameRect := Rect(FLeftFrameRect.Right, R.Top + AdvPreviewMenu.TopFrameHeight, FLeftFrameRect.Right + rw, R.Top + AdvPreviewMenu.TopFrameHeight + h);

  Height := AdvPreviewMenu.TopFrameHeight + h + AdvPreviewMenu.BottomFrameHeight;
  Width := w;

  InitializeScroller;
  
  //---- Creating Buttons
  for i:= 0 to FButtonList.Count-1 do
  begin
    TAdvGlowButton(FButtonList.Items[i]).Free;
  end;
  FButtonList.Clear;

  if (FButtonlist.Count = 0) then
  begin
    for i := 0  to AdvPreviewMenu.Buttons.Count-1 do
    begin
      AdvGlowBtn := TAdvGlowButton.Create(Self);
      AdvGlowBtn.AntiAlias := aaClearType;
      FButtonList.Add(AdvGlowBtn);
      AdvGlowBtn.Parent := Self;
    end;
  end;

  //---- Setting Buttons properties
  j := Width - AdvPreviewMenu.OffSetX;
  for i:= 0 to FButtonList.Count-1 do
  begin
    if (i < AdvPreviewMenu.Buttons.Count) then
    begin
      AdvGlowBtn := TAdvGlowButton(FButtonList.Items[i]);
      AdvGlowBtn.Width := AdvPreviewMenu.Buttons.Items[i].Width;
      AdvGlowBtn.Height := AdvPreviewMenu.ButtonHeight;
      if not AdvPreviewMenu.Buttons.Items[i].Picture.Empty then
        AdvGlowBtn.Picture.Assign(AdvPreviewMenu.Buttons.Items[i].Picture);
      if not AdvPreviewMenu.Buttons.Items[i].DisabledPicture.Empty then
        AdvGlowBtn.DisabledPicture.Assign(AdvPreviewMenu.Buttons.Items[i].DisabledPicture);
      AdvGlowBtn.OfficeHint.Assign(AdvPreviewMenu.Buttons.Items[i].OfficeHint);
      AdvGlowBtn.ShowHint := ShowHint;
      AdvGlowBtn.Enabled := AdvPreviewMenu.Buttons.Items[i].Enabled;
      AdvGlowBtn.Font.Assign(AdvPreviewMenu.Buttons.Items[i].Font);
      AdvGlowBtn.Caption := AdvPreviewMenu.Buttons.Items[i].Caption;
      AdvGlowBtn.ShowCaption := (AdvGlowBtn.Caption <> '');
      AdvGlowBtn.Images := AdvPreviewMenu.ButtonImages;
      AdvGlowBtn.ImageIndex := AdvPreviewMenu.Buttons.Items[i].ImageIndex;
      AdvGlowBtn.Appearance.Assign(AdvPreviewMenu.FCurrentStyler.ButtonAppearance);
      AdvGlowBtn.Visible := AdvPreviewMenu.Buttons.Items[i].Visible;
      if AdvGlowBtn.Visible then
      begin
        AdvGlowBtn.Top := FRightFrameRect.Bottom + 4;
        AdvGlowBtn.Left := j - AdvGlowBtn.Width;
        AdvGlowBtn.OnClick := OnButtonClick;
        AdvGlowBtn.Action := AdvPreviewMenu.Buttons.Items[i].Action;
        AdvGlowBtn.Caption := AdvPreviewMenu.Buttons.Items[i].Caption;
        j := AdvGlowBtn.Left - AdvPreviewMenu.ButtonSpacing;
      end;
    end;
  end;
  
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.GetItemHeight: Integer;
begin
  Result := FItemHeight;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.RealIndexToVisItemIndex(Index: Integer): Integer;
var
  i: Integer;
begin
  Result := -1;
  if not Assigned(FAdvPreviewMenu) or (Index < 0) or (Index >= FAdvPreviewMenu.MenuItems.Count)
     or (not FAdvPreviewMenu.MenuItems.Items[Index].Visible and not FEditorCreated) then
    Exit;

  Result := 0;
  for i := 0 to Index-1 do
  begin
    if (FAdvPreviewMenu.MenuItems.Items[i].Visible or FEditorCreated) then
      Result := Result + 1;
  end;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.VisIndexToRealItemIndex(Index: Integer): Integer;
var
  i, j: Integer;
begin
  Result := -1;
  if not Assigned(FAdvPreviewMenu) or (Index < 0) or (Index >= FAdvPreviewMenu.MenuItems.Count) then
    Exit;

  j := -1;
  for i := 0 to FAdvPreviewMenu.MenuItems.Count-1 do
  begin
    if FAdvPreviewMenu.MenuItems.Items[i].Visible or FEditorCreated then
    begin
      Inc(j);
    end;

    if (j = Index) then
    begin
      Result := i;
      Break;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.VisibleItemsCount: Integer;
var
  i: Integer;
begin
  Result := 0;
  if not Assigned(FAdvPreviewMenu) then
    Exit;

  for i := 0 to FAdvPreviewMenu.MenuItems.Count-1 do
  begin
    if FAdvPreviewMenu.MenuItems.Items[i].Visible or FEditorCreated then
      Result := Result + 1;
  end;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.GetItemRect(Index: Integer): TRect;
begin
  Result := Rect(-1, -1, -1, -1);
  Index := RealIndexToVisItemIndex(Index);
  if not Assigned(FAdvPreviewMenu) or (Index < 0) or (Index >= FAdvPreviewMenu.MenuItems.Count) then
    Exit;

  Result := GetLeftFrameRect;
  Result := Rect(Result.Left+1, Result.Top+1, Result.Right-1, Result.Bottom-1);
  Result.Top := Result.Top + Index * FItemHeight;
  Result.Bottom := Result.Top + FItemHeight;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.GetItemDropDownRect(Index: Integer): TRect;
begin
  Result := GetItemRect(Index);
  if Assigned(AdvPreviewMenu) and (Index >= 0) and (Index < AdvPreviewMenu.MenuItems.Count) then
  begin
    Result := Rect(Result.Right - MENUARROW_WIDTH, Result.Top, Result.Right, Result.Bottom);
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.GetMaxItemSize(var AHeight, AWidth: Integer);
var
  i, w, h, iw, ih, tw, th, j: Integer;
  R: TRect;
begin
  if not Assigned(FAdvPreviewMenu) then
    Exit;

  w := 0;
  h := 0;
  for i:= 0 to FAdvPreviewMenu.MenuItems.Count-1 do
  begin
    if not FAdvPreviewMenu.MenuItems.Items[i].Visible and not FEditorCreated then
      Continue;
    j := 0;
    iw := 0;
    ih := 0;
    if not FAdvPreviewMenu.MenuItems.Items[i].Picture.Empty or (not FAdvPreviewMenu.MenuItems.Items[i].DisabledPicture.Empty and not FAdvPreviewMenu.MenuItems.Items[i].Enabled) then
    begin
      if not FAdvPreviewMenu.MenuItems.Items[i].Picture.Empty then
      begin
        FAdvPreviewMenu.MenuItems.Items[i].Picture.GetImageSizes;
        iw := FAdvPreviewMenu.MenuItems.Items[i].Picture.Width + FImageSpace;
        ih := FAdvPreviewMenu.MenuItems.Items[i].Picture.Height;
      end
      else
      begin
        FAdvPreviewMenu.MenuItems.Items[i].DisabledPicture.GetImageSizes;
        iw := FAdvPreviewMenu.MenuItems.Items[i].DisabledPicture.Width + FImageSpace;
        ih := FAdvPreviewMenu.MenuItems.Items[i].DisabledPicture.Height;
      end;
    end
    else if Assigned(FAdvPreviewMenu.MenuImages) and (FAdvPreviewMenu.MenuItems.Items[i].ImageIndex >= 0) then
    begin
      iw := FAdvPreviewMenu.MenuImages.Width + FImageSpace;
      ih := FAdvPreviewMenu.MenuImages.Height;
    end;

    if (FAdvPreviewMenu.MenuItems.Items[i].SubItems.Count > 0) then
      j := MENUARROW_WIDTH;

    if (FAdvPreviewMenu.MenuItems.Items[i].Caption <> '') then
    begin
      Canvas.Font.Assign(AdvPreviewMenu.FCurrentStyler.MenuItemAppearance.Font);
      R := Rect(0,0,1000,100);
      DrawText(Canvas.Handle,PChar(FAdvPreviewMenu.MenuItems.Items[i].Caption),Length(FAdvPreviewMenu.MenuItems.Items[i].Caption), R, DT_CALCRECT or DT_LEFT or DT_SINGlELINE);
      tw := R.Right + j;
      th := R.Bottom;
    end
    else if (FAdvPreviewMenu.MenuItems.Items[i].WideCaption <> '') then
    begin
      Canvas.Font.Assign(AdvPreviewMenu.FCurrentStyler.MenuItemAppearance.Font);
      R := Rect(0,0,1000,100);
      DrawTextW(Canvas.Handle,PWideChar(FAdvPreviewMenu.MenuItems.Items[i].WideCaption),Length(FAdvPreviewMenu.MenuItems.Items[i].WideCaption), R, DT_CALCRECT or DT_LEFT or DT_SINGlELINE);
      tw := R.Right + j;
      th := R.Bottom;
    end
    else
    begin
      tw := 0;
      th := 0;
    end;

    w := Max(w, iw + tw);
    h := Max(Max(h, ih), th);
  end;

  w := w + FAdvPreviewMenu.MenuSpacing*2+2;
  h := h + FAdvPreviewMenu.MenuSpacing;
  AWidth := w;
  AHeight := h;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.ItemAtPos(X, Y: Integer): Integer;
var
  i: Integer;
  R: TRect;
begin
  Result := -1;
  if PtInRect(FLeftFrameRect, Point(X, Y)) then
  begin
    for i:= 0 to AdvPreviewMenu.MenuItems.Count-1 do
    begin
      R := GetItemRect(i);
      if PtInRect(R, Point(X, Y)) then
      begin
        Result := i;
        Break;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.SelectItem(Index: Integer);
begin
  if FEditorCreated then
  begin
    if (FItemIndex <> Index) then
    begin
      SetSelectedItem(Index);
      Exit;
    end;
  end;

  if not Assigned(AdvPreviewMenu) or (Index < 0) or (Index >= FAdvPreviewMenu.MenuItems.Count) then
    Exit;

  if ((AdvPreviewMenu.MenuItems.Items[Index].SubItems.Count = 0) or (AdvPreviewMenu.MenuItems.Items[Index].CanSelect)) and AdvPreviewMenu.MenuItems.Items[Index].Enabled then
  begin
    if not FEditorCreated then
      AdvPreviewMenu.HideMenu;

    FItemIndex := Index;
    if not FEditorCreated then
      AdvPreviewMenu.MenuItems.Items[Index].Click;
    //if Assigned(AdvPreviewMenu.MenuItems.Items[Index].OnClick) then
      //AdvPreviewMenu.MenuItems.Items[Index].FOnClick(AdvPreviewMenu{, AdvPreviewMenu.MenuItems.Items[Index]});

    if Assigned(AdvPreviewMenu.OnMenuItemClick) then
      AdvPreviewMenu.OnMenuItemClick(AdvPreviewMenu, Index);
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.SetItemHot(const Value: Integer);
var
  i: Integer;
begin
  if not Assigned(AdvPreviewMenu) then
    Exit;

  if (FItemHot >= 0) and (Value <> FItemHot) then
  begin
    i := FItemHot;
    FItemHot := -1;
    DrawItem(i, true);
  end;

  if (Value >= 0) and (Value < AdvPreviewMenu.MenuItems.Count) and (AdvPreviewMenu.MenuItems.Items[Value].Enabled) then
  begin
    FItemHot := Value;
    DrawItem(FItemHot);
    if (AdvPreviewMenu.MenuItems.Items[FItemHot].SubItems.Count > 0) then
    begin
      if FMouseSetHot and not FEditorCreated then
      begin
        FMouseItemHot := FItemHot;
        FMouseTimer.Enabled := True;
      end
      else
        SubMenuItem := FItemHot;
    end
    else
    begin
      if FMouseSetHot and not FEditorCreated then
      begin
        FMouseItemHot := -1;
        FMouseTimer.Enabled := True;
      end
      else
        SubMenuItem := -1;  // means AdvPreviewMenu.SubMenuItems
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.OnMouseTimer(Sender: TObject);
var
  CurP: TPoint;
  i: Integer;
begin
  FMouseTimer.Enabled := False;
  GetCursorPos(CurP);
  CurP := ScreenToClient(CurP);
  i := ItemAtPos(CurP.X, CurP.Y);
  if {(FMouseItemHot >= 0) and} (FMouseItemHot < AdvPreviewMenu.MenuItems.Count) then
  begin
    if (i = FMouseItemHot) then
    begin
      SubMenuItem := FMouseItemHot;
    end
    else
    begin
      ItemHot := i;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.GetSubMenuItemHeight: Integer;
begin
  Result := FSubMenuItemHeight;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.GetSubMenuCaptionRect: TRect;
var
  sw: Integer;
begin
  Result := Rect(-1, -1, -1, -1);
  if not Assigned(AdvPreviewMenu) or (FSubMenuItem >= AdvPreviewMenu.MenuItems.Count) then
    Exit;

  if (FSubMenuItem >= 0) then
  begin
    sw := SHADOW_WIDTH;
  end
  else
  begin
    sw := 0;
  end;

  Result := GetRightFrameRect;
  Result := Rect(Result.Left+1, Result.Top+1, Result.Right-1-sw, Result.Bottom-1);
  Result.Bottom := Result.Top + FSubMenuCaptionHeight;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.GetSubMenuItemRect(Index: Integer): TRect;
var
  SubItems: TAdvPreviewSubMenuItems;
  sw: Integer;
  R: TRect;
begin
  Result := Rect(-1, -1, -1, -1);
  Index := RealIndexToVisSubItemIndex(Index);
  if not Assigned(AdvPreviewMenu) or (FSubMenuItem >= AdvPreviewMenu.MenuItems.Count)
     or (Index < 0) or (FSubMenuScroller.Visible and not FSubMenuScrolling and ((Index < FTopSubMenuItem) or (Index > FTopSubMenuItem + FSubMenuVisibleItemCount))) then
    Exit;

  if (FSubMenuItem >= 0) then
  begin
    SubItems := FAdvPreviewMenu.MenuItems.Items[FSubMenuItem].SubItems;
    sw := SHADOW_WIDTH;
  end
  else
  begin
    SubItems := AdvPreviewMenu.SubMenuItems;
    sw := 0;
  end;

  if (Index >= SubItems.Count) then
    Exit;

  Result := GetRightFrameRect;
  Result := Rect(Result.Left+2, Result.Top+2, Result.Right-1 - sw, Result.Bottom-1);
  Result.Top := Result.Top + FSubMenuCaptionHeight + abs(Index - FTopSubMenuItem) * FSubMenuItemHeight;
  Result.Bottom := Result.Top + FSubMenuItemHeight;

  if FSubMenuScroller.Visible and not FSubMenuScrolling then
  begin
    if FSubMenuScroller.CanGoForward then
    begin
      R := GetDownScrollBtnRect;
      if (Result.Top > (R.Top - 2)) then
      begin
        Result := Rect(-1, -1, -1, -1);
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.RealIndexToVisSubItemIndex(Index: Integer): Integer;
var
  i: Integer;
  SubItems: TAdvPreviewSubMenuItems;
begin
  Result := -1;
  SubItems := GetSubMenuItems;
  if not Assigned(FAdvPreviewMenu) or (SubItems = nil) or (Index < 0) or (Index >= SubItems.Count)
     or (not SubItems.Items[Index].Visible and not FEditorCreated) then
    Exit;

  Result := 0;
  for i := 0 to Index-1 do
  begin
    if SubItems.Items[i].Visible or FEditorCreated then
      Result := Result + 1;
  end;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.VisIndexToRealSubItemIndex(Index: Integer): Integer;
var
  i, j: Integer;
  SubItems: TAdvPreviewSubMenuItems;
begin
  Result := -1;
  SubItems := GetSubMenuItems;
  if not Assigned(FAdvPreviewMenu) or (SubItems = nil) or (Index < 0) or (Index >= SubItems.Count) then
    Exit;

  j := -1;
  for i := 0 to SubItems.Count-1 do
  begin
    if SubItems.Items[i].Visible or FEditorCreated then
    begin
      Inc(j);
    end;

    if (j = Index) then
    begin
      Result := i;
      Break;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.VisibleSubItemCount(ItemIndex: Integer): Integer;
var
  SubItems: TAdvPreviewSubMenuItems;
  i: Integer;
begin
  Result := 0;
  if not Assigned(FAdvPreviewMenu) or (ItemIndex > AdvPreviewMenu.MenuItems.Count) then
    Exit;

  if (ItemIndex >= 0) then
    SubItems := AdvPreviewMenu.MenuItems.Items[ItemIndex].SubItems
  else
    SubItems := AdvPreviewMenu.SubMenuItems;

  for i := 0 to SubItems.Count-1 do
  begin
    if SubItems.Items[i].Visible or FEditorCreated then
      Result := Result + 1;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.CalculateSubMenuItemSize;
var
  h, w: Integer;
begin
  GetSubMenuMaxItemSize(h, w);
  FSubMenuItemHeight := Max(MINITEM_HEIGHT, h);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.GetSubMenuMaxItemSize(var AHeight,
  AWidth: Integer);
begin
  GetSubMenuMaxItemSize(FSubMenuItem, AHeight, AWidth, FAdvPreviewMenu.SubMenuItems);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.GetSubMenuMaxItemSize(Index: Integer; var AHeight,
  AWidth: Integer; SubMenuItems: TAdvPreviewSubMenuItems = nil);
var
  i, w, h, iw, ih, tw, th, j, n: Integer;
  R: TRect;
  SubItems: TAdvPreviewSubMenuItems;
  SubMenuItemSpacing: Integer;
  SubMenuCaption: string;
  WideSubMenuCaption: widestring;
begin
  if not Assigned(AdvPreviewMenu) or (Index >= AdvPreviewMenu.MenuItems.Count) then
    Exit;

  if (Index >= 0) then
  begin
    SubItems := FAdvPreviewMenu.MenuItems.Items[Index].SubItems;
    SubMenuItemSpacing := FAdvPreviewMenu.MenuItems.Items[Index].SubmenuItemSpacing;
    SubMenuCaption := FAdvPreviewMenu.MenuItems.Items[Index].SubMenuCaption;
    WideSubMenuCaption := FAdvPreviewMenu.MenuItems.Items[Index].WideSubMenuCaption;
  end
  else if (Index < 0) and Assigned(SubMenuItems) then
  begin
    SubItems := SubMenuItems;
    SubMenuItemSpacing := FAdvPreviewMenu.SubMenuItemSpacing;
    SubMenuCaption := FAdvPreviewMenu.SubMenuCaption;
    WideSubMenuCaption := FAdvPreviewMenu.WideSubMenuCaption;
  end
  else
  begin
    Exit;
  end;

  //with FAdvPreviewMenu.MenuItems.Items[Index] do
  w := 0;
  h := 0;
    
  if (SubMenuCaption <> '') then
  begin
    Canvas.Font.Assign(AdvPreviewMenu.FCurrentStyler.MenuItemAppearance.SubItemTitleFont);
    R := Rect(0,0,1000,100);
    DrawText(Canvas.Handle,PChar(SubMenuCaption),Length(SubMenuCaption), R, DT_CALCRECT or DT_LEFT or DT_SINGlELINE);
    w := R.Right;
    h := R.Bottom;
    FSubMenuCaptionHeight := h + SubmenuItemSpacing + 4;
  end
  else if (WideSubMenuCaption <> '') then
  begin
    Canvas.Font.Assign(AdvPreviewMenu.FCurrentStyler.MenuItemAppearance.SubItemTitleFont);
    R := Rect(0,0,1000,100);
    DrawTextW(Canvas.Handle,PWideChar(WideSubMenuCaption),Length(WideSubMenuCaption), R, DT_CALCRECT or DT_LEFT or DT_SINGlELINE);
    w := R.Right;
    h := R.Bottom;
    FSubMenuCaptionHeight := h + SubmenuItemSpacing + 4;
  end
  else
  begin
    FSubMenuCaptionHeight := 0;
  end;

  for i:= 0 to SubItems.Count-1 do
  begin
    if not SubItems.Items[i].Visible and not FEditorCreated then
      Continue;
      
    j := 0;
    iw := 0;
    ih := 0;
    if not SubItems.Items[i].Picture.Empty or (not SubItems.Items[i].DisabledPicture.Empty and not SubItems.Items[i].Enabled) then
    begin
      if not SubItems.Items[i].Picture.Empty then
      begin
        SubItems.Items[i].Picture.GetImageSizes;
        iw := SubItems.Items[i].Picture.Width + FImageSpace;
        ih := SubItems.Items[i].Picture.Height;
      end
      else
      begin
        SubItems[i].DisabledPicture.GetImageSizes;
        iw := SubItems[i].DisabledPicture.Width + FImageSpace;
        ih := SubItems[i].DisabledPicture.Height;
      end;
    end
    else if Assigned(FAdvPreviewMenu.SubMenuImages) and (SubItems[i].ImageIndex >= 0) then
    begin
      iw := FAdvPreviewMenu.SubMenuImages.Width + FImageSpace;
      ih := FAdvPreviewMenu.SubMenuImages.Height;
    end;

    if Assigned(SubItems.Items[i].SubMenu) then
      j := MENUARROW_WIDTH;

    if (SubItems.Items[i].Title <> '') then
    begin
      Canvas.Font.Assign(AdvPreviewMenu.FCurrentStyler.MenuItemAppearance.SubItemTitleFont);
      R := Rect(0,0,1000,100);
      DrawText(Canvas.Handle,PChar(SubItems.Items[i].Title),Length(SubItems.Items[i].Title), R, DT_CALCRECT or DT_LEFT or DT_SINGlELINE);
      tw := R.Right + j;
      th := R.Bottom + FLineSpace;
    end
    else if (SubItems.Items[i].WideTitle <> '') then
    begin
      Canvas.Font.Assign(AdvPreviewMenu.FCurrentStyler.MenuItemAppearance.SubItemTitleFont);
      R := Rect(0,0,1000,100);
      DrawTextW(Canvas.Handle,PWideChar(SubItems.Items[i].WideTitle),Length(SubItems.Items[i].WideTitle), R, DT_CALCRECT or DT_LEFT or DT_SINGlELINE);
      tw := R.Right + j;
      th := R.Bottom + FLineSpace;
    end
    else
    begin
      tw := 0;
      th := 0;
    end;

    Canvas.Font.Assign(AdvPreviewMenu.FCurrentStyler.MenuItemAppearance.SubItemFont);
    if (SubItems.Items[i].Notes.Count > 0) then
    begin
      for n := 0 to SubItems.Items[i].Notes.Count-1 do
      begin
        if (SubItems.Items[i].Notes[n] <> '') then
        begin
          R := Rect(0,0,1000,100);
          DrawText(Canvas.Handle,PChar(SubItems.Items[i].Notes[n]),Length(SubItems.Items[i].Notes[n]), R, DT_CALCRECT or DT_LEFT or DT_SINGlELINE);
          tw := Max(tw, R.Right + j);
          th := th + FLineSpace + R.Bottom;
        end;
      end;
    end
    else if (SubItems.Items[i].WideNotes <> '') then
    begin
      R := Rect(0,0,1000,100);
      if (FAdvPreviewMenu.SubMenuWidth > 0) then
        R.Right := FAdvPreviewMenu.SubMenuWidth;
      DrawTextW(Canvas.Handle,PWideChar(SubItems.Items[i].WideNotes),Length(SubItems.Items[i].WideNotes), R, DT_CALCRECT or DT_LEFT or DT_WORDBREAK);
      tw := Max(tw, R.Right + j);
      th := th + (FLineSpace * max(1, R.Bottom div Canvas.TextHeight('gh')))+ 4 + R.Bottom;
    end;

    w := Max(w, iw + tw);
    h := Max(Max(h, ih), th);
  end;

  w := w + SubmenuItemSpacing*2 + 2;
  h := h + SubmenuItemSpacing*2;
  AWidth := w;
  AHeight := h;
end;


//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.SelectSubMenuItem(Index: Integer);
var
  SubItems: TAdvPreviewSubMenuItems;
begin
  SubItems := GetSubMenuItems;
  if not Assigned(AdvPreviewMenu) or (FSubMenuItem >= AdvPreviewMenu.MenuItems.Count)
     or (Index < 0) or (Index >= SubItems.Count) then
    Exit;

  if FEditorCreated then
  begin
    SetSelectedSubItem(Index);
    Exit;
  end;

  if not Assigned(SubItems.Items[Index].SubMenu) and SubItems.Items[Index].Enabled then
  begin
    AdvPreviewMenu.HideMenu;

    SubItems.Items[Index].Click;
    //if Assigned(SubItems.Items[Index].OnClick) then
      //SubItems.Items[Index].FOnClick(AdvPreviewMenu{, SubItems.Items[Index]});

    if Assigned(AdvPreviewMenu.OnSubMenuItemClick) then
      AdvPreviewMenu.OnSubMenuItemClick(AdvPreviewMenu, FSubMenuItem, Index);
  end;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.SubMenuItemAtPos(X, Y: Integer): Integer;
var
  SubItem: TAdvPreviewSubMenuItem;
begin
  SubItem := nil;
  Result := SubMenuItemAtPos(X, Y, SubItem);
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.SubMenuItemAtPos(X, Y: Integer; var SubItem: TAdvPreviewSubMenuItem): Integer;
var
  i: Integer;
  R, R1: TRect;
  SubItems: TAdvPreviewSubMenuItems;
begin
  Result := -1;
  if not Assigned(AdvPreviewMenu) or (FSubMenuItem >= AdvPreviewMenu.MenuItems.Count) then
    Exit;

  if (FSubMenuItem >= 0) then
  begin
    SubItems := FAdvPreviewMenu.MenuItems.Items[FSubMenuItem].SubItems;
  end
  else
  begin
    SubItems := AdvPreviewMenu.SubMenuItems;
  end;

  if PtInRect(FRightFrameRect, Point(X, Y)) then
  begin
    for i:= 0 to SubItems.Count-1 do
    begin
      R := GetSubMenuItemRect(i);

      if FSubMenuScroller.Visible then
      begin
        if FSubMenuScroller.CanGoBack then
        begin
          R1 := GetUpScrollBtnRect;
          if (R.Top < R1.Bottom) and (R.Bottom > R1.Bottom) then
          begin
            R := Rect(R.Left, R1.Bottom, R.Right, R.Bottom);
          end;
        end;
        if FSubMenuScroller.CanGoForward then
        begin
          R1 := GetDownScrollBtnRect;
          if (R.Top < R1.Top) and (R.Bottom > R1.Top) then
          begin
            R := Rect(R.Left, R.Top, R.Right, R1.Top);
          end;
        end;
      end;

      if PtInRect(R, Point(X, Y)) then
      begin
        Result := i;
        SubItem := SubItems.Items[i];
        Break;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.CheckKeyPress(Key: Word);
begin
  if (Key = VK_LEFT) then
  begin
    HideSubMenuPopup;
  end;  
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.InternalClickSubItem(SubIndex: Integer);
begin
  FInternalClick := True;
  mouse_event( MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0 );
  mouse_event( MOUSEEVENTF_LEFTUP, 0, 0, 0, 0 );
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.CheckMouseMove(X, Y: Integer);
var
  P: TPoint;
  i: Integer;
  SubItems: TAdvPreviewSubMenuItems;
begin
  if not Assigned(AdvPreviewMenu) then
    Exit;

  P := Point(X, Y);
  P := ScreenToClient(P);
  if PtInRect(FLeftFrameRect, p) then
  begin
    i := ItemAtPos(P.X, P.Y);
    if (i >= 0) and (i <> FItemHot) then
    begin
      HideSubMenuPopup;
      ItemHot := i;
    end;
  end
  else if PtInRect(FRightFrameRect, p) then
  begin
    i := SubMenuItemAtPos(P.X, P.Y);
    if (i <> FSubMenuItemHot) and (i >= 0) then
    begin
      //HideSubMenuPopup;
      //SubMenuItemHot := i;
      SubItems := GetSubMenuItems;
      if Assigned(SubItems) and Assigned(SubItems.Items[i].SubMenu) then
        InternalClickSubItem(i)
      else
      begin
        HideSubMenuPopup;
        SubMenuItemHot := i;
      end;
    end
    else
    begin
      if FSubMenuScroller.Visible and Assigned(FSubMenuPopup) then
      begin
        if PtInRect(GetUpScrollBtnRect, Point(P.X, P.Y)) or PtInRect(GetDownScrollBtnRect, Point(P.X, P.Y)) then
        begin
          HideSubMenuPopup;
          SubMenuItemHot := -1;
        end;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.HideSubMenuPopup;
var
  p: TPoint;
begin
  if Assigned(FSubMenuPopup) then
  begin
    P := Point(0, 1);
    P := ClientToScreen(P);
    FInternalHideSubMenuPopup := True;
    FIgnoreMouseMove := True;
    //keybd_event( VK_ESCAPE, Mapvirtualkey( VK_ESCAPE, 0 ), 0, 0);
    //keybd_event( VK_ESCAPE, Mapvirtualkey( VK_ESCAPE, 0 ), KEYEVENTF_KEYUP, 0);
    PostMessage(Handle, WM_LBUTTONDOWN, MK_LBUTTON, Longint(PointToSmallPoint(ScreenToClient(P))));
    PostMessage(Handle, WM_LBUTTONUP, MK_LBUTTON, Longint(PointToSmallPoint(ScreenToClient(P))));
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.ShowSubMenuPopup(AIndex: Integer);
var
  R: TRect;
  pt: TPoint;
  SubItems: TAdvPreviewSubMenuItems;
begin
  if not Assigned(AdvPreviewMenu) then
    Exit;

  if Assigned(FSubMenuPopup) then
    HideSubMenuPopup;

  SubItems := GetSubMenuItems;
    
  if (FSubMenuItem < AdvPreviewMenu.MenuItems.Count) and (AIndex >= 0) and (AIndex < SubItems.Count)
      and Assigned(SubItems.Items[FSubMenuItemHot].SubMenu) then
  begin
    try
      SubMItemIndex :=  AIndex;
      PreviewMenuPanel := Self;
      FSubMenuPopup := SubItems.Items[FSubMenuItemHot].SubMenu;
      InitPreviewMenuHooks;

      R := GetSubMenuItemRect(AIndex);
      pt := Point(R.Right, R.Top);
      pt := ClientToScreen(pt);
      SubItems.Items[FSubMenuItemHot].SubMenu.Popup(pt.X, pt.y);
    finally
      ReleasePreviewMenuHooks;
      FSubMenuPopup := nil;
      if FInternalHideSubMenuPopup then
        FInternalHideSubMenuPopup := False
      else
      begin
        if not FInternalClick then
          Self.HideMenuWindow;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.HideMenuWindow;
begin
  if not Assigned(AdvPreviewMenu) then
    Exit;
    
  AdvPreviewMenu.HideMenu;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.SetSubMenuItemHot(const Value: integer);
var
  i: Integer;
  SubItems: TAdvPreviewSubMenuItems;
begin
  if not Assigned(AdvPreviewMenu) then
    Exit;

  if (FSubMenuItemHot >= 0) then
  begin
    i := FSubMenuItemHot;
    FSubMenuItemHot := -1;
    DrawSubMenuItem(i, true);
  end;

  SubItems := GetSubMenuItems;
  if (FSubMenuItem < AdvPreviewMenu.MenuItems.Count) and (Value >= 0) and (Value < SubItems.Count)
     and (SubItems.Items[Value].Enabled) then
  begin
    FSubMenuItemHot := Value;
    DrawSubMenuItem(FSubMenuItemHot);
    if Assigned(SubItems.Items[FSubMenuItemHot].SubMenu) then
    begin
      ShowSubMenuPopup(FSubMenuItemHot);
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.SetSubMenuItem(const Value: Integer);
begin
  if not Assigned(AdvPreviewMenu) or (FSubMenuItem >= AdvPreviewMenu.MenuItems.Count) then
    Exit;

  if (FSubMenuItem <> Value) then
  begin
    FSubMenuItem := Value;
    CalculateSubMenuItemSize;
    InitializeScroller;
    DrawRightFrame;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.InvalidateTopFrame;
var
  R: TRect;
begin
  R := GetTopFrameRect;
  InvalidateRect(Handle, @R, True);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.InvalidateLeftFrame;
var
  R: TRect;
begin
  R := GetLeftFrameRect;
  InvalidateRect(Handle, @R, True);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.InvalidateRightFrame;
var
  R: TRect;
begin
  R := GetRightFrameRect;
  InvalidateRect(Handle, @R, True);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.OnButtonClick(Sender: TObject);
var
  i: Integer;
begin
  if not Assigned(AdvPreviewMenu) then
    Exit;

  HideMenuWindow;
    
  i := FButtonList.IndexOf(Sender);
  if (i >= 0) and (i < AdvPreviewMenu.Buttons.Count) then
  begin
    if Assigned(AdvPreviewMenu.Buttons.Items[i].OnClick) then
    begin
      AdvPreviewMenu.Buttons.Items[i].FOnClick(AdvPreviewMenu, AdvPreviewMenu.Buttons.Items[i]);
    end;

    if Assigned(AdvPreviewMenu) and Assigned(AdvPreviewMenu.FOnButtonClick) then
    begin
      AdvPreviewMenu.FOnButtonClick(AdvPreviewMenu, FButtonList.IndexOf(Sender));
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.SetOfficeHint(const Value: TAdvHintInfo);
begin
  FOfficeHint.Assign(Value);
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.GetSubMenuItems: TAdvPreviewSubMenuItems;
begin
  Result := nil;
  if not Assigned(AdvPreviewMenu) or (FSubMenuItem >= AdvPreviewMenu.MenuItems.Count) then
    Exit;

  if (FSubMenuItem >= 0) then
  begin
    Result := FAdvPreviewMenu.MenuItems.Items[FSubMenuItem].SubItems;
  end
  else
  begin
    Result := AdvPreviewMenu.SubMenuItems;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.CMDialogChar(var Message: TCMDialogChar);
var
  i: Integer;
  SubItems: TAdvPreviewSubMenuItems;
begin
  inherited;
  if not Assigned(AdvPreviewMenu) then
    Exit;

  SubItems := GetSubMenuItems;  
  if (FSubMenuItemHot >= 0) and (FSubMenuItemHot < SubItems.Count) then
  begin
    for i:= 0 to SubItems.Count-1 do
    begin
      if IsAccel(Message.CharCode, SubItems.Items[i].Title) then
      begin
        if SubItems.Items[i].Enabled then
        begin
          Message.Result := 1;
          SelectSubMenuItem(i);
        end;
        Break;
      end;
    end;
  end
  else
  begin
    for i:= 0 to AdvPreviewMenu.MenuItems.Count-1 do
    begin
      if IsAccel(Message.CharCode, AdvPreviewMenu.MenuItems.Items[i].Caption) then
      begin
        if AdvPreviewMenu.MenuItems.Items[i].Enabled then
        begin
          Message.Result := 1;
          if ((AdvPreviewMenu.MenuItems.Items[i].SubItems.Count = 0) or (AdvPreviewMenu.MenuItems.Items[i].CanSelect)) then
            SelectItem(i)
          else
            ItemHot := i;  
        end;
        Break;
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.HideAllItemsShortCutHint;
var
  i: Integer;
begin
  if not Assigned(AdvPreviewMenu) then
    Exit;

  for i:= 0 to AdvPreviewMenu.MenuItems.Count-1 do
  begin
    HideItemShortCutHint(i);
    HideItemSubItemShortCutHint(i);
  end;

  if FShortCutItemHintShowing then
    FShortCutItemHintShowing := False;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.ShowAllItemsShortCutHint;
var
  i: Integer;
begin
  if not Assigned(AdvPreviewMenu) then
    Exit;

  for i:= 0 to AdvPreviewMenu.MenuItems.Count-1 do
  begin
    ShowItemShortCutHint(i);
    ShowItemSubItemShortCutHint(i);
  end;

  FShortCutItemHintShowing := (AdvPreviewMenu.MenuItems.Count > 0);
  FShortCutChars := '';
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.DrawItemSubItemShortCutHint(Index: Integer);
var
  pt: TPoint;
  R: TRect;
  h, w: Integer;
begin
  if not Assigned(FAdvPreviewMenu) or (Index < 0) or (Index >= FAdvPreviewMenu.MenuItems.Count) then
    Exit;

  if (FAdvPreviewMenu.MenuItems.Items[Index].ShortCutSubItemsHint <> '') and (FAdvPreviewMenu.MenuItems.Items[Index].ShortCutSubItemHintShowing) then
  begin
    Canvas.Font.Assign(Self.Font);
    R := GetItemRect(Index);
    GetShortCutHintSize(Canvas, FAdvPreviewMenu.MenuItems.Items[Index].ShortCutSubItemsHint, h, w);
    pt.X := R.Right - w - 3;
    pt.Y := R.Bottom - FAdvPreviewMenu.MenuSpacing - h;
    DrawShortCutHint(Canvas, FAdvPreviewMenu.MenuItems.Items[Index].ShortCutSubItemsHint, pt, True);
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.DrawItemShortCutHint(Index: Integer);
var
  pt: TPoint;
  R: TRect;
  h, w: Integer;
  shCut: string;
begin
  if not Assigned(FAdvPreviewMenu) or (Index < 0) or (Index >= FAdvPreviewMenu.MenuItems.Count) then
    Exit;

  if (FAdvPreviewMenu.MenuItems.Items[Index].ShortCutHint <> '') then
    shCut := FAdvPreviewMenu.MenuItems.Items[Index].ShortCutHint
  else
    shCut := GetHotkey(FAdvPreviewMenu.MenuItems.Items[Index].Caption);
      
  if (shCut <> '') and (FAdvPreviewMenu.MenuItems.Items[Index].ShortCutHintShowing) then
  begin
    Canvas.Font.Assign(Self.Font);
    R := GetItemRect(Index);
    GetShortCutHintSize(Canvas, shCut, h, w);
    pt.X := R.Left + 4 + FAdvPreviewMenu.MenuSpacing * 2; //(R.Left + (R.Right - R.left) div 3) - w;
    pt.Y := R.Bottom - FAdvPreviewMenu.MenuSpacing - h + 2;
    DrawShortCutHint(Canvas, shCut, pt, True);
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.ShowItemShortCutHint(Index: Integer);
begin
  if not Assigned(FAdvPreviewMenu) or (Index < 0) or (Index >= FAdvPreviewMenu.MenuItems.Count) then
    Exit;

  if ((FAdvPreviewMenu.MenuItems.Items[Index].ShortCutHint <> '') or (GetHotkey(FAdvPreviewMenu.MenuItems.Items[Index].Caption) <> ''))
     and ((FAdvPreviewMenu.MenuItems.Items[Index].SubItems.Count = 0) or FAdvPreviewMenu.MenuItems.Items[Index].CanSelect) then
  begin
    FAdvPreviewMenu.MenuItems.Items[Index].ShortCutHintShowing := True;
    DrawItemShortCutHint(Index);
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.HideItemShortCutHint(Index: Integer);
begin
  if not Assigned(FAdvPreviewMenu) or (Index < 0) or (Index >= FAdvPreviewMenu.MenuItems.Count) then
    Exit;

  if (FAdvPreviewMenu.MenuItems.Items[Index].ShortCutHintShowing) then
  begin
    FAdvPreviewMenu.MenuItems.Items[Index].ShortCutHintShowing := False;
    DrawItem(Index, True);
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.HideItemSubItemShortCutHint(Index: Integer);
begin
  if not Assigned(FAdvPreviewMenu) or (Index < 0) or (Index >= FAdvPreviewMenu.MenuItems.Count) then
    Exit;

  if (FAdvPreviewMenu.MenuItems.Items[Index].ShortCutSubItemsHint <> '') and (FAdvPreviewMenu.MenuItems.Items[Index].ShortCutSubItemHintShowing) then
  begin
    FAdvPreviewMenu.MenuItems.Items[Index].ShortCutSubItemHintShowing := False;
    DrawItemSubItemShortCutHint(Index);
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.ShowItemSubItemShortCutHint(Index: Integer);
begin
  if not Assigned(FAdvPreviewMenu) or (Index < 0) or (Index >= FAdvPreviewMenu.MenuItems.Count) then
    Exit;

  if ((FAdvPreviewMenu.MenuItems.Items[Index].SubItems.Count > 0) or FAdvPreviewMenu.MenuItems.Items[Index].CanSelect)
    and (FAdvPreviewMenu.MenuItems.Items[Index].ShortCutSubItemsHint <> '') then
  begin
    FAdvPreviewMenu.MenuItems.Items[Index].ShortCutSubItemHintShowing := True;
    DrawItemSubItemShortCutHint(Index);
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.HideAllSubMenuItemsShortCutHint;
var
  i: Integer;
  SubItems: TAdvPreviewSubMenuItems;
begin
  if not Assigned(AdvPreviewMenu) then
    Exit;

  if FShortCutSubMenuItemHintShowing then
  begin
    FShortCutSubMenuItemHintShowing := False;

    SubItems := GetSubMenuItems;
    if Assigned(SubItems) then
    begin
      for i:= 0 to SubItems.Count-1 do
      begin
        HideSubMenuItemShortCutHint(i);
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.ShowAllSubMenuItemsShortCutHint;
var
  i: Integer;
  SubItems: TAdvPreviewSubMenuItems;
begin
  if not Assigned(AdvPreviewMenu) then
    Exit;

  SubItems := GetSubMenuItems;
  if Assigned(SubItems) then
  begin
    for i:= 0 to SubItems.Count-1 do
    begin
      ShowSubMenuItemShortCutHint(i);
    end;
  end;

  FShortCutSubMenuItemHintShowing := (SubItems.Count > 0);
  FShortCutChars := '';
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.HideSubMenuItemShortCutHint(Index: Integer);
var
  SubItems: TAdvPreviewSubMenuItems;
begin
  SubItems := GetSubMenuItems;
  if not Assigned(SubItems) or not Assigned(FAdvPreviewMenu) or (Index < 0) or (Index >= SubItems.Count) then
    Exit;

  if (SubItems.Items[Index].ShortCutHintShowing) then
  begin
    SubItems.Items[Index].ShortCutHintShowing := False;
    DrawSubMenuItemShortCutHint(Index);
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.ShowSubMenuItemShortCutHint(Index: Integer);
var
  SubItems: TAdvPreviewSubMenuItems;
  shCut: string;
begin
  SubItems := GetSubMenuItems;
  if not Assigned(SubItems) or not Assigned(FAdvPreviewMenu) or (Index < 0) or (Index >= SubItems.Count) then
    Exit;

  if (SubItems.Items[Index].ShortCutHint <> '') then
    shCut := SubItems.Items[Index].ShortCutHint
  else
    shCut := GetHotkey(SubItems.Items[Index].Title);
  if (shCut <> '') then
  begin
    SubItems.Items[Index].ShortCutHintShowing := True;
    DrawSubMenuItemShortCutHint(Index);
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.DrawSubMenuItemShortCutHint(Index: Integer);
var
  SubItems: TAdvPreviewSubMenuItems;
  pt: TPoint;
  R: TRect;
  h, w: Integer;
  shCut: string;
begin
  SubItems := GetSubMenuItems;
  if not Assigned(SubItems) or not Assigned(FAdvPreviewMenu) or (Index < 0) or (Index >= SubItems.Count) then
    Exit;

  if (SubItems.Items[Index].ShortCutHint <> '') then
    shCut := SubItems.Items[Index].ShortCutHint
  else
    shCut := GetHotkey(SubItems.Items[Index].Title);

  if (shCut <> '') and (SubItems.Items[Index].ShortCutHintShowing) then
  begin
    Canvas.Font.Assign(Self.Font);
    R := GetSubMenuItemRect(Index);
    GetShortCutHintSize(Canvas, shCut, h, w);
    pt.X := R.Left + FAdvPreviewMenu.MenuSpacing * 2;
    pt.Y := R.Bottom - FAdvPreviewMenu.MenuSpacing - h;
    DrawShortCutHint(Canvas, shCut, pt, True);
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.DrawDownScrollBtn;
var
  R: TRect;
  BrClr, Clr: TColor;
  x, y: Integer;
begin
  if FSubMenuScroller.CanGoForward and Assigned(AdvPreviewMenu) then
  begin
    R := GetDownScrollBtnRect;
    if FSubMenuScollDownDown then
    begin
      BrClr := AdvPreviewMenu.FCurrentStyler.ButtonAppearance.BorderColorDown;
      Clr := AdvPreviewMenu.FCurrentStyler.ButtonAppearance.ColorDown;
    end
    else if FSubMenuScollDownHot then
    begin
      BrClr := AdvPreviewMenu.FCurrentStyler.ButtonAppearance.BorderColorHot;
      Clr := AdvPreviewMenu.FCurrentStyler.ButtonAppearance.ColorHotTo;
    end
    else
    begin
      BrClr := AdvPreviewMenu.FCurrentStyler.ButtonAppearance.BorderColor;
      Clr := AdvPreviewMenu.FCurrentStyler.ButtonAppearance.Color;
    end;
    Canvas.Brush.Color := Clr;
    Canvas.Pen.Color := BrClr;
    Canvas.RoundRect(R.Left, R.Top, R.Right, R.Bottom, 1, 1);

    x := R.Left + ((R.Right - R.Left) div 2);
    y := R.Top + 1 + (R.Bottom - R.Top) div 2;
    Canvas.Pen.Color := BlendColor(clBlack, BrClr, 50);
    Canvas.MoveTo(X - 2, Y-2);
    Canvas.LineTo(X + 3, Y-2);
    Canvas.MoveTo(X - 1, Y-1);
    Canvas.LineTo(X + 2, Y-1);
    Canvas.Pixels[X, Y] := Canvas.Pen.Color;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.DrawUpScrollBtn;
var
  R: TRect;
  BrClr, Clr: TColor;
  x, y: Integer;
begin
  if FSubMenuScroller.CanGoBack then
  begin
    R := GetUpScrollBtnRect;
    if FSubMenuScollUpDown then
    begin
      BrClr := AdvPreviewMenu.FCurrentStyler.ButtonAppearance.BorderColorDown;
      Clr := AdvPreviewMenu.FCurrentStyler.ButtonAppearance.ColorDown;
    end
    else if FSubMenuScollUpHot then
    begin
      BrClr := AdvPreviewMenu.FCurrentStyler.ButtonAppearance.BorderColorHot;
      Clr := AdvPreviewMenu.FCurrentStyler.ButtonAppearance.ColorHotTo;
    end
    else
    begin
      BrClr := AdvPreviewMenu.FCurrentStyler.ButtonAppearance.BorderColor;
      Clr := AdvPreviewMenu.FCurrentStyler.ButtonAppearance.Color;
    end;
    Canvas.Brush.Color := Clr;
    Canvas.Pen.Color := BrClr;
    Canvas.RoundRect(R.Left, R.Top, R.Right, R.Bottom, 1, 1);

    x := R.Left + ((R.Right - R.Left) div 2);
    y := R.Top - 1 + (R.Bottom - R.Top) div 2;
    Canvas.Pen.Color := BlendColor(clBlack, BrClr, 50);
    Canvas.MoveTo(X - 2, Y+2);
    Canvas.LineTo(X + 3, Y+2);
    Canvas.MoveTo(X - 1, Y+1);
    Canvas.LineTo(X + 2, Y+1);
    Canvas.Pixels[X, Y] := Canvas.Pen.Color;
  end;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.GetDownScrollBtnRect: TRect;
begin
  Result := Rect(-1, -1, -1, -1);
  if FSubMenuScroller.CanGoForward then
  begin
    Result := GetRightFrameRect;
    Result := Rect(Result.Left + 3, Result.Bottom - SCROLL_HEIGHT-2, Result.Right-2, Result.Bottom-2);
    if (FSubMenuItem >= 0) then
    begin
      Result.Right := Result.Right - SHADOW_WIDTH;
      Result.Bottom := Result.Bottom - SHADOW_WIDTH;
      Result.Top := Result.Top - SHADOW_WIDTH;
    end;
  end;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.GetUpScrollBtnRect: TRect;
begin
  Result := Rect(-1, -1, -1, -1);
  if FSubMenuScroller.CanGoBack then
  begin
    Result := GetSubMenuCaptionRect;
    if (Result.Top < 0) and (Result.Bottom < 0) then
    begin
      Result := GetRightFrameRect;
      Result := Rect(Result.Left + 3, Result.Top + 1, Result.Right-2, Result.Top + SCROLL_HEIGHT + 1);
      if (FSubMenuItem >= 0) then
        Result.Right := Result.Right - SHADOW_WIDTH;
    end
    else
    begin
      Result := Rect(Result.Left + 2, Result.Bottom, Result.Right-1, Result.Bottom + SCROLL_HEIGHT+1);
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.UpdateScroller;
var
  i: Integer;
begin
  FSubMenuVisibleItemCount := (GetRightFrameRect.Bottom - GetRightFrameRect.Top - FSubMenuCaptionHeight) div FSubMenuItemHeight; // available SubMenuItem space
  i := VisibleSubItemCount(FSubMenuItem);
  if (i > FSubMenuVisibleItemCount) then
  begin
    FSubMenuScroller.Max := i div FSubMenuVisibleItemCount;
    //FSubMenuScroller.Max := FSubMenuScroller.Max + (FSubMenuVisibleItemCount mod i);
  end
  else
  begin
    FSubMenuScroller.Max := 0;
  end;
  
  FSubMenuScroller.Position := Min(FSubMenuScroller.Position, FSubMenuScroller.Max);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.InitializeScroller;
begin
  FTopSubMenuItem := 0;
  FSubMenuScroller.Min := 0;
  FSubMenuScroller.Max := 0;
  FSubMenuScroller.Position := 0;
  UpdateScroller;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.SubMenuScrollInView(Index: Integer);
var
  SubItems: TAdvPreviewSubMenuItems;
  VisIndex: Integer;
begin
  SubItems := GetSubMenuItems;
  if not Assigned(SubItems) or not FSubMenuScroller.Visible or FSubMenuScrolling or (Index < 0) or (Index >= SubItems.Count) then
    Exit;


  VisIndex := RealIndexToVisSubItemIndex(Index);
  if (VisIndex < FTopSubMenuItem) then
  begin
    ScrollSubMenu(-1);
  end
  else if (VisIndex > FTopSubMenuItem + FSubMenuVisibleItemCount) then
  begin
    ScrollSubMenu(1);
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.ChangeTopSubMenuItemTo(Value: Integer);
var
  SubItems: TAdvPreviewSubMenuItems;
  bmp: TBitmap;
  R, R1: TRect;
  i, h, j, sw: Integer;
begin
  SubItems := GetSubMenuItems;
  if not Assigned(SubItems) then
    Exit;

  j := 5;
  if (Value > FTopSubMenuItem) and (Value < SubItems.Count) then
  begin
    bmp := TBitmap.Create;
    bmp.Height := Max(Self.Height, (SubItems.Count+3) * FSubMenuItemHeight);
    bmp.Width := Self.Width;
    FSubMenuScrolling := True;
    i := FTopSubMenuItem;
    FTopSubMenuItem := 0;
    DrawSubMenuItems(bmp.Canvas);
    FTopSubMenuItem := i;
    FSubMenuScrolling := False;

    if (FSubMenuItem >= 0) then
      sw := SHADOW_WIDTH
    else
      sw := 0;
    R1 := GetRightFrameRect;
    R1 := Rect(R1.Left + 3, {getsubmenuItemRect(FTopSubMenuItem).Top}GetSubMenuCaptionRect.Bottom, R1.Right - sw-1, R1.Bottom-sw-1);
    R := R1;

    if (FTopSubMenuItem > 0) then
    begin
      for i:= 0 to FTopSubMenuItem-1 do
      begin
        R.Top := R.Top + FSubMenuItemHeight;
        R.Bottom := R.Bottom + FSubMenuItemHeight;
      end;
    end;

    h := (Value - FTopSubMenuItem) * FSubMenuItemHeight;
    i := j;
    Canvas.CopyMode := cmSrcCopy;
    while (i < h) do
    begin
      R := Rect(R.Left, R.Top+j, R.Right, R.Bottom+j);
      Canvas.CopyRect(R1, bmp.Canvas, R);
      i := i + j;
      //sleep(100);
    end;

    i := i - j;
    i := abs(i - h);
    if (i > 0) then
    begin
      R := Rect(R.Left, R.Top+i, R.Right, R.Bottom+i);
      Canvas.CopyRect(R1, bmp.Canvas, R);
    end;

    FTopSubMenuItem := Value;
    bmp.Free;
    //DrawRightFrame(True);
  end
  else if (Value < FTopSubMenuItem) and (Value >= 0) then
  begin
    bmp := TBitmap.Create;
    bmp.Height := Max(Self.Height, (SubItems.Count+3) * FSubMenuItemHeight);
    bmp.Width := Self.Width;
    FSubMenuScrolling := True;
    h := FTopSubMenuItem;
    FTopSubMenuItem := 0;
    DrawSubMenuItems(bmp.Canvas);
    FTopSubMenuItem := h;
    FSubMenuScrolling := False;

    if (FSubMenuItem >= 0) then
      sw := SHADOW_WIDTH
    else
      sw := 0;
    R1 := GetRightFrameRect;
    R1 := Rect(R1.Left + 3, GetSubMenuCaptionRect.Bottom, R1.Right - sw-1, R1.Bottom-sw-2);
    R := R1;
    R := Rect(R.Left, R.Top + FTopSubMenuItem * FSubMenuItemHeight, R.Right, R.Bottom + FTopSubMenuItem * FSubMenuItemHeight);

    h := (FTopSubMenuItem - Value) * FSubMenuItemHeight;
    i := j;
    Canvas.CopyMode := cmSrcCopy;
    while (i < h) do
    begin
      R := Rect(R.Left, R.Top-j, R.Right, R.Bottom-j);
      Canvas.CopyRect(R1, bmp.Canvas, R);
      i := i + j;
    end;

    i := i - j;
    i := abs(i - h);
    if (i <> 0) then
    begin
      R := Rect(R.Left, R.Top-i, R.Right, R.Bottom-i);
      Canvas.CopyRect(R1, bmp.Canvas, R);
    end;

    FTopSubMenuItem := Value;
    bmp.Free;
    //DrawRightFrame(True);
  end;
end;

//------------------------------------------------------------------------------

function TAdvPreviewMenuPanel.ScrollSubMenu(Value: Integer): Integer;
var
  i, j, k: Integer;
  SubItems: TAdvPreviewSubMenuItems;
begin
  Result := 0;
  if (Value > 0) then
  begin
    Result := Min(Value, FSubMenuScroller.Max - FSubMenuScroller.Position);
    if FSubMenuScroller.CanGoForward and (Result > 0) then
    begin
      SubItems := GetSubMenuItems;
      FSubMenuScroller.Position := FSubMenuScroller.Position + Result;
      //j := 0;
      //k := VisIndexToRealItemIndex(FTopSubMenuItem + FSubMenuVisibleItemCount);
      j := Min(VisibleSubItemCount(FSubMenuItem)-1, FTopSubMenuItem + FSubMenuVisibleItemCount);
      k := VisIndexToRealSubItemIndex(j); // FTopSubMenuItem + FSubMenuVisibleItemCount
      j := 0;

      for i := k to SubItems.Count -1 do
      begin
        if SubItems.Items[i].Visible or FEditorCreated then
          j := j + 1;
        if (j >= (FSubMenuVisibleItemCount * Result)) then
          Break;
      end;

      ChangeTopSubMenuItemTo(FTopSubMenuItem + j);
      InvalidateSubMenuScroller;
      //InvalidateRightFrame;
    end;
  end
  else if (Value < 0) then
  begin
    Result := -Min(Abs(Value), FSubMenuScroller.Position - FSubMenuScroller.Min);
    if FSubMenuScroller.CanGoBack and (Result < 0) then
    begin
      SubItems := GetSubMenuItems;
      FSubMenuScroller.Position := FSubMenuScroller.Position + Result;
      //FTopSubMenuItem := FTopSubMenuItem + (FSubMenuVisibleItemCount * Result);
      j := 0;
      k := VisIndexToRealSubItemIndex(FTopSubMenuItem); //VisIndexToRealItemIndex(FTopSubMenuItem);
      for i := k downto 0 do
      begin
        if SubItems.Items[i].Visible or FEditorCreated then
          j := j + 1;
        if (j >= abs(FSubMenuVisibleItemCount * Result)) or (j >= FTopSubMenuItem) then
          Break;
      end;

      ChangeTopSubMenuItemTo(FTopSubMenuItem - j);
      InvalidateSubMenuScroller;
      //InvalidateRightFrame;
    end;
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.InvalidateSubMenuScroller;
var
  R: TRect;
begin
  R := GetUpScrollBtnRect;
  InvalidateRect(Handle, @R, True);
  R := GetDownScrollBtnRect;
  InvalidateRect(Handle, @R, True);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.SubMenuScrollDownClick;
begin
  ScrollSubMenu(1);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.SubMenuScrollUpClick;
begin
  ScrollSubMenu(-1);
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.SetSelectedItem(Index: Integer);
var
  i: Integer;
begin
  if (FSelectedItem <> Index) then
  begin
    if Assigned(AdvPreviewMenu.OnMenuItemClick) then
      AdvPreviewMenu.OnMenuItemClick(AdvPreviewMenu, Index);

    i := FSelectedItem;
    FSelectedItem := Index;
    if (i >= 0) then
      DrawItem(i, True);
    DrawItem(FSelectedItem);
    SetSelectedSubItem(0);
  end;
end;

//------------------------------------------------------------------------------

procedure TAdvPreviewMenuPanel.SetSelectedSubItem(Index: Integer);
var
  i: Integer;
  SubItems: TAdvPreviewSubMenuItems;
begin
  SubItems := GetSubMenuItems;
  if (Index < SubItems.Count) then
  begin
    if Assigned(AdvPreviewMenu.OnSubMenuItemClick) then
      AdvPreviewMenu.OnSubMenuItemClick(AdvPreviewMenu, FSubMenuItem, Index);

    i := FSelectedSubItem;
    FSelectedSubItem := Index;
    if (i >= 0) then
      DrawSubMenuItem(i, True);
    DrawSubMenuItem(FSelectedSubItem);
  end;
end;

//------------------------------------------------------------------------------

{ TItemActionLink }

procedure TItemActionLink.AssignClient(AClient: TObject);
begin
  FClient := AClient as TAdvPreviewMenuItem;
end;

//------------------------------------------------------------------------------

function TItemActionLink.IsCaptionLinked: Boolean;
begin
  Result := inherited IsCaptionLinked and
            AnsiSameCaption(FClient.Caption, (Action as TCustomAction).Caption);
end;

//------------------------------------------------------------------------------

function TItemActionLink.IsCheckedLinked: Boolean;
begin
  Result := False; {inherited IsCheckedLinked and
    (FClient.Checked = (Action as TCustomAction).Checked);}
end;

//------------------------------------------------------------------------------

function TItemActionLink.IsEnabledLinked: Boolean;
begin
  Result := inherited IsEnabledLinked and
    (FClient.Enabled = (Action as TCustomAction).Enabled);
end;

//------------------------------------------------------------------------------

function TItemActionLink.IsHelpContextLinked: Boolean;
begin
  Result := False; {inherited IsHelpContextLinked and
    (FClient.HelpContext = (Action as TCustomAction).HelpContext);}
end;

//------------------------------------------------------------------------------

function TItemActionLink.IsHintLinked: Boolean;
begin
  Result := False; {inherited IsHintLinked and
    (FClient.Hint = (Action as TCustomAction).Hint);}
end;

//------------------------------------------------------------------------------

{$IFDEF DELPHI6_LVL}
function TItemActionLink.IsGroupIndexLinked: Boolean;
begin
  Result := False; {FClient.RadioItem and inherited IsGroupIndexLinked and
    (FClient.GroupIndex = (Action as TCustomAction).GroupIndex);}
end;
{$ENDIF}

//------------------------------------------------------------------------------

function TItemActionLink.IsImageIndexLinked: Boolean;
begin
  Result := inherited IsImageIndexLinked and
    (FClient.ImageIndex = (Action as TCustomAction).ImageIndex);
end;

//------------------------------------------------------------------------------

function TItemActionLink.IsShortCutLinked: Boolean;
begin
  Result := False; {inherited IsShortCutLinked and
    (FClient.ShortCut = (Action as TCustomAction).ShortCut);}
end;

//------------------------------------------------------------------------------

function TItemActionLink.IsVisibleLinked: Boolean;
begin
  Result := inherited IsVisibleLinked and
    (FClient.Visible = (Action as TCustomAction).Visible);
end;

//------------------------------------------------------------------------------

function TItemActionLink.IsOnExecuteLinked: Boolean;
begin
  Result := inherited IsOnExecuteLinked and
    (@FClient.OnClick = @Action.OnExecute);
end;

//------------------------------------------------------------------------------

procedure TItemActionLink.SetCaption(const Value: string);
begin
  if IsCaptionLinked then FClient.Caption := Value;
end;

//------------------------------------------------------------------------------

procedure TItemActionLink.SetEnabled(Value: Boolean);
begin
  if IsEnabledLinked then FClient.Enabled := Value;
end;

//------------------------------------------------------------------------------

procedure TItemActionLink.SetImageIndex(Value: Integer);
begin
  if IsImageIndexLinked then FClient.ImageIndex := Value;
end;

//------------------------------------------------------------------------------

procedure TItemActionLink.SetVisible(Value: Boolean);
begin
  if IsVisibleLinked then FClient.Visible := Value;
end;

//------------------------------------------------------------------------------

procedure TItemActionLink.SetOnExecute(Value: TNotifyEvent);
begin
  if IsOnExecuteLinked then FClient.OnClick := Value;
end;

//------------------------------------------------------------------------------

{ TSubItemActionLink }

procedure TSubItemActionLink.AssignClient(AClient: TObject);
begin
  FClient := AClient as TAdvPreviewSubMenuItem;
end;

//------------------------------------------------------------------------------

function TSubItemActionLink.IsCaptionLinked: Boolean;
begin
  Result := inherited IsCaptionLinked and
            AnsiSameCaption(FClient.Title, (Action as TCustomAction).Caption);
end;

//------------------------------------------------------------------------------

function TSubItemActionLink.IsCheckedLinked: Boolean;
begin
  Result := False; {inherited IsCheckedLinked and
    (FClient.Checked = (Action as TCustomAction).Checked);}
end;

//------------------------------------------------------------------------------

function TSubItemActionLink.IsEnabledLinked: Boolean;
begin
  Result := inherited IsEnabledLinked and
    (FClient.Enabled = (Action as TCustomAction).Enabled);
end;

//------------------------------------------------------------------------------

function TSubItemActionLink.IsHelpContextLinked: Boolean;
begin
  Result := False; {inherited IsHelpContextLinked and
    (FClient.HelpContext = (Action as TCustomAction).HelpContext);}
end;

//------------------------------------------------------------------------------

function TSubItemActionLink.IsHintLinked: Boolean;
begin
  Result := False; {inherited IsHintLinked and
    (FClient.Hint = (Action as TCustomAction).Hint);}
end;

//------------------------------------------------------------------------------

{$IFDEF DELPHI6_LVL}
function TSubItemActionLink.IsGroupIndexLinked: Boolean;
begin
  Result := False; {FClient.RadioItem and inherited IsGroupIndexLinked and
    (FClient.GroupIndex = (Action as TCustomAction).GroupIndex);}
end;
{$ENDIF}
//------------------------------------------------------------------------------

function TSubItemActionLink.IsImageIndexLinked: Boolean;
begin
  Result := inherited IsImageIndexLinked and
    (FClient.ImageIndex = (Action as TCustomAction).ImageIndex);
end;

//------------------------------------------------------------------------------

function TSubItemActionLink.IsShortCutLinked: Boolean;
begin
  Result := False; {inherited IsShortCutLinked and
    (FClient.ShortCut = (Action as TCustomAction).ShortCut);}
end;

//------------------------------------------------------------------------------

function TSubItemActionLink.IsVisibleLinked: Boolean;
begin
  Result := inherited IsVisibleLinked and
    (FClient.Visible = (Action as TCustomAction).Visible);
end;

//------------------------------------------------------------------------------

function TSubItemActionLink.IsOnExecuteLinked: Boolean;
begin
  Result := inherited IsOnExecuteLinked and
    (@FClient.OnClick = @Action.OnExecute);
end;

//------------------------------------------------------------------------------

procedure TSubItemActionLink.SetCaption(const Value: string);
begin
  if IsCaptionLinked then FClient.Title := Value;
end;

//------------------------------------------------------------------------------

procedure TSubItemActionLink.SetEnabled(Value: Boolean);
begin
  if IsEnabledLinked then
  begin
    if not ForceEnableAction or (Assigned(TAdvPreviewSubMenuItems(FClient.Collection).FPreviewMenu) and not TAdvPreviewSubMenuItems(FClient.Collection).FPreviewMenu.FMenuShowing) then
      FClient.Enabled := Value;
  end;
end;

//------------------------------------------------------------------------------

procedure TSubItemActionLink.SetImageIndex(Value: Integer);
begin
  if IsImageIndexLinked then FClient.ImageIndex := Value;
end;

//------------------------------------------------------------------------------

procedure TSubItemActionLink.SetVisible(Value: Boolean);
begin
  if IsVisibleLinked then FClient.Visible := Value;
end;

//------------------------------------------------------------------------------

procedure TSubItemActionLink.SetOnExecute(Value: TNotifyEvent);
begin
  if IsOnExecuteLinked then FClient.OnClick := Value;
end;

//------------------------------------------------------------------------------

{ TMenuItemScroller }

constructor TMenuItemScroller.Create;
begin
  inherited;
  FMin := 0;
  FMax := 0;
  FPosition := 0;
end;

//------------------------------------------------------------------------------

function TMenuItemScroller.CanGoBack: Boolean;
begin
  Result := Position > Min;
end;

//------------------------------------------------------------------------------

function TMenuItemScroller.CanGoForward: Boolean;
begin
  Result := Position < Max;
end;

//------------------------------------------------------------------------------

procedure TMenuItemScroller.SetMax(const Value: integer);
begin
  if Value >= FMin then FMax := Value;
end;

//------------------------------------------------------------------------------

procedure TMenuItemScroller.SetMin(const Value: integer);
begin
  if Value <= FMax then FMin := Value;
end;

//------------------------------------------------------------------------------

procedure TMenuItemScroller.SetPosition(const Value: integer);
begin
  FPosition := Value;
end;

//------------------------------------------------------------------------------

function TMenuItemScroller.GetVisible: Boolean;
begin
  Result := CanGoForward or CanGoBack;
end;

//------------------------------------------------------------------------------

{ TButtonItemActionLink }

procedure TButtonItemActionLink.AssignClient(AClient: TObject);
begin
  FClient := AClient as TButtonCollectionItem;
end;

//------------------------------------------------------------------------------

function TButtonItemActionLink.IsCaptionLinked: Boolean;
begin
  Result := inherited IsCaptionLinked and
            AnsiSameCaption(FClient.Caption, (Action as TCustomAction).Caption);
end;

//------------------------------------------------------------------------------

function TButtonItemActionLink.IsCheckedLinked: Boolean;
begin
  Result := False; {inherited IsCheckedLinked and
    (FClient.Checked = (Action as TCustomAction).Checked);}
end;

//------------------------------------------------------------------------------

function TButtonItemActionLink.IsEnabledLinked: Boolean;
begin
  Result := inherited IsEnabledLinked and
    (FClient.Enabled = (Action as TCustomAction).Enabled);
end;

//------------------------------------------------------------------------------

function TButtonItemActionLink.IsHelpContextLinked: Boolean;
begin
  Result := False; {inherited IsHelpContextLinked and
    (FClient.HelpContext = (Action as TCustomAction).HelpContext);}
end;

//------------------------------------------------------------------------------

function TButtonItemActionLink.IsHintLinked: Boolean;
begin
  Result := False; {inherited IsHintLinked and
    (FClient.Hint = (Action as TCustomAction).Hint);}
end;

//------------------------------------------------------------------------------

{$IFDEF DELPHI6_LVL}
function TButtonItemActionLink.IsGroupIndexLinked: Boolean;
begin
  Result := False; {FClient.RadioItem and inherited IsGroupIndexLinked and
    (FClient.GroupIndex = (Action as TCustomAction).GroupIndex);}
end;
{$ENDIF}
//------------------------------------------------------------------------------

function TButtonItemActionLink.IsImageIndexLinked: Boolean;
begin
  Result := inherited IsImageIndexLinked and
    (FClient.ImageIndex = (Action as TCustomAction).ImageIndex);
end;

//------------------------------------------------------------------------------

function TButtonItemActionLink.IsShortCutLinked: Boolean;
begin
  Result := False; {inherited IsShortCutLinked and
    (FClient.ShortCut = (Action as TCustomAction).ShortCut);}
end;

//------------------------------------------------------------------------------

function TButtonItemActionLink.IsVisibleLinked: Boolean;
begin
  Result := inherited IsVisibleLinked and
    (FClient.Visible = (Action as TCustomAction).Visible);
end;

//------------------------------------------------------------------------------

function TButtonItemActionLink.IsOnExecuteLinked: Boolean;
begin
  Result := inherited IsOnExecuteLinked and
    (@FClient.OnClick = @Action.OnExecute);
end;

//------------------------------------------------------------------------------

procedure TButtonItemActionLink.SetCaption(const Value: string);
begin
  if IsCaptionLinked then FClient.Caption := Value;
end;

//------------------------------------------------------------------------------

procedure TButtonItemActionLink.SetEnabled(Value: Boolean);
begin
  if IsEnabledLinked then
  begin
    //if not ForceEnableAction or (Assigned(TAdvPreviewSubMenuItems(FClient.Collection).FPreviewMenu) and not TAdvPreviewSubMenuItems(FClient.Collection).FPreviewMenu.FMenuShowing) then
      //FClient.Enabled := Value;
  end;
end;

//------------------------------------------------------------------------------

procedure TButtonItemActionLink.SetImageIndex(Value: Integer);
begin
  if IsImageIndexLinked then FClient.ImageIndex := Value;
end;

//------------------------------------------------------------------------------

procedure TButtonItemActionLink.SetVisible(Value: Boolean);
begin
  if IsVisibleLinked then FClient.Visible := Value;
end;

//------------------------------------------------------------------------------

procedure TButtonItemActionLink.SetOnExecute(Value: TNotifyEvent);
begin
  //if IsOnExecuteLinked then FClient.OnClick := Value;
end;

//------------------------------------------------------------------------------

{ TPreviewMenuControl }

constructor TPreviewMenuControl.Create(AOwner: TComponent);
begin
  inherited;
  FOwner := AOwner;
  CreatePreviewMenu;
end;

//------------------------------------------------------------------------------

destructor TPreviewMenuControl.Destroy;
begin
  DestroyPreviewMenu;
  inherited;
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuControl.CreatePreviewMenu;
begin
  if (FAdvPreviewMenu = nil) then
  begin
    FAdvPreviewMenu := TAdvPreviewMenu.Create(Self);
    FAdvPreviewMenu.FEditorCreated := True;
  end;

  if (FAdvPreviewMenuPanel = nil) then
  begin
    FAdvPreviewMenuPanel := TAdvPreviewMenuPanel.Create(Self);
    FAdvPreviewMenuPanel.Parent := Self;
    FAdvPreviewMenuPanel.OnResize := OnPreviewPanelResize;
    FAdvPreviewMenuPanel.Visible := True;
    FAdvPreviewMenuPanel.FEditorCreated := True;
  end;
  FAdvPreviewMenu.FAdvPreviewMenuPanel := FAdvPreviewMenuPanel;
  FAdvPreviewMenuPanel.AdvPreviewMenu := FAdvPreviewMenu;
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuControl.DestroyPreviewMenu;
begin
  if (FAdvPreviewMenu <> nil) then
  begin
    FAdvPreviewMenu.FAdvPreviewMenuPanel := nil;
    FAdvPreviewMenu.Free;
  end;
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuControl.Paint;
begin
  inherited;
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuControl.Resize;
begin
  inherited;

end;

//------------------------------------------------------------------------------

procedure TPreviewMenuControl.SetBounds(ALeft, ATop, AWidth,
  AHeight: Integer);
begin
  inherited;
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuControl.AssignMenu(PreviewMenu: TAdvPreviewMenu);
begin
  if Assigned(AdvPreviewMenu) then
  begin
    FAdvPreviewMenu.MenuItems.Clear;
    FAdvPreviewMenu.MenuItems.Assign(PreviewMenu.MenuItems);
    FAdvPreviewMenu.SubMenuItems.Assign(PreviewMenu.SubMenuItems);
    FAdvPreviewMenu.MenuImages := PreviewMenu.MenuImages;
    FAdvPreviewMenu.SubMenuImages := PreviewMenu.SubMenuImages;
    FAdvPreviewMenu.Styler := PreviewMenu.Styler;
    FAdvPreviewMenu.SubMenuCaption := PreviewMenu.SubMenuCaption;
    Self.ShowHint := PreviewMenu.ShowHint;
    FAdvPreviewMenu.ShowHint := PreviewMenu.ShowHint;
    FAdvPreviewMenuPanel.InitializeAndUpdate;
  end;
end;

//------------------------------------------------------------------------------

procedure TPreviewMenuControl.OnPreviewPanelResize(Sender: TObject);
begin
  Width := FAdvPreviewMenuPanel.Width;
  Height := FAdvPreviewMenuPanel.Height;
end;

end.
