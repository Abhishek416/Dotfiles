#include <X11/XF86keysym.h>
#define PrintScreenDWM 0x0000ff61

#define F2 XF86XK_MonBrightnessDown
#define F3 XF86XK_MonBrightnessUp

#define F6 XF86XK_AudioMute
#define F7 XF86XK_AudioLowerVolume
#define F8 XF86XK_AudioRaiseVolume

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int gappx     = 10;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "Monospace:size=9:antialias=true:autohint=true",
                                        "Hack Regular Nerd Font:size=9:antialias=true:autohint=true"
};
static const char dmenufont[]       = { "monospace:size=9" };

//static const char col_gray1[]       = "#2C323E";
static const char col_gray1[]       = "#222222";

static const char col_gray2[]       = "#444444";

static const char col_gray3[]       = "#9899a0";
//static const char col_gray3[]       = "#bbbbbb";

//static const char col_gray4[]       = "#2C323E";
static const char col_gray4[]       = "#eeeeee";

static const char col_cyan[]        = "#BF616A";
//static const char col_cyan[]        = "#005577";

static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray4, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-p", "RUN: ", "-g",  "5", "-l", "5",  "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };

static const char *stcmd[]    = { "st", NULL };
static const char *alacrittycmd[]  = { "alacritty", NULL };

static const char *rangercmd[]     = {"alacritty", "-e", "ranger", NULL};

static const char *brupcmd[]    = {"sudo", "xbacklight", "-inc", "3", NULL};
static const char *brdowncmd[]  = {"sudo", "xbacklight", "-dec", "3", NULL};

static const char *mutecmd[]  = {"amixer", "-q", "set", "Master", "toggle", NULL};
static const char *volupcmd[] = {"amixer", "-q", "set", "Master", "5%+", "unmute", NULL};
static const char *voldowncmd[] = {"amixer", "-q", "set", "Master", "5%-",    "unmute", NULL};

static const char *printscreencmd[] = { "scrot", "--select", "--quality", "100", "-e", "mv $f ~/pics/shots/ && notify-send Screenshot Captured -t 300 -i $f", NULL};

static const char *lock[] = { "slock", NULL};
static const char *logout[] = { "dm-logout", NULL };
static const char *mount[] = { "dm-mount", NULL };
static const char *umount[] = { "dm-umount", NULL };
static const char *menus[] = { "dm-menus", NULL };
static const char *notes[] = { "dm-notes", NULL };
static const char *confs[] = { "dm-conf", NULL };
static const char *pcmanf[] = { "dm-pcmanfm", NULL };
static const char *websearch[] = { "dm-websearch", NULL };
static const char *ssgen[] = { "dm-ssgen", NULL };
static const char *killprocess[] = { "dm-kill-process", NULL };
static const char *mansearch[] = { "dm-mansearch", NULL };
static const char *openfiles[] = { "dm-open-file", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
  {0,                 PrintScreenDWM,        spawn,          {.v = printscreencmd } },

  // Volume Buttons
  {0,                             F6,        spawn,          {.v = mutecmd } },
  {0,                             F7,        spawn,          {.v = voldowncmd } },
  {0,                             F8,        spawn,          {.v = volupcmd } },

  // Brightness Buttons
  {0,                             XK_F2,        spawn,          {.v = brdowncmd } },
  {0,                             XK_F3,        spawn,          {.v = brupcmd } },

  // Function Key Mappings
  { MODKEY,                       XK_F1,     spawn,          {.v = menus } },
  { MODKEY,                       XK_F2,     spawn,          {.v = confs } },
  { MODKEY,                       XK_F3,     spawn,          {.v = openfiles } },
  { MODKEY,                       XK_F4,     spawn,          {.v = pcmanf } },
  { MODKEY,                       XK_F9,     spawn,          {.v = ssgen } },
  { MODKEY,                       XK_F11,    spawn,          {.v = websearch } },
  { MODKEY,                       XK_F10,    spawn,          {.v = mount } },
  { MODKEY|ShiftMask,             XK_F10,    spawn,          {.v = umount } },
  { MODKEY,                       XK_F12,    spawn,          {.v = logout } },
	{ MODKEY|ShiftMask,             XK_x,      spawn,          {.v = lock } },

	{ MODKEY,                       XK_comma,  spawn,          {.v = notes } },
	{ MODKEY,                       XK_period, spawn,          {.v = killprocess } },
	{ MODKEY,                       XK_slash,  spawn,          {.v = mansearch } },

	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = stcmd } },
  { MODKEY|ShiftMask,             XK_r,      spawn,          {.v = rangercmd} },

  // Change Focus To Window
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },

  // Change to Horizontal and Vertical Alignment 
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_o,      incnmaster,     {.i = -1 } },

  // Set Width Of A Window
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },

	{ Mod1Mask,                     XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },

  // Layout Keys
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },

	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },

  // Gaps Setting
	{ MODKEY,                       XK_minus,  setgaps,        {.i = -1 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = 0  } },

  // Tag Keys
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = alacrittycmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

