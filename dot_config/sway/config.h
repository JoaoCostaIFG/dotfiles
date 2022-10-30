/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;  // border pixel of windows
static const int gappx              = 5;  // gaps between windows
static const unsigned int snap      = 32; // snap pixel
static const int showbar            = 1;  // 0 means no bar
static const int topbar             = 1;  // 0 means bottom- bar
static const int horizpadbar        = 2;  // horizontal padding for statusbar
static const int vertpadbar         = 0;  // vertical padding for statusbar
/* font */
static char font[]                  = "monospace:weight=Bold:pixelsize=12";
static const char dmenufont[]       = "monospace:weight=Bold:pixelsize=12";
static const char *fonts[]          = { font, "Symbola:pixelsize=12" };
/* colors */
static char normbgcolor[]           = "#222222";
static char normbordercolor[]       = "#444444";
static char normfgcolor[]           = "#bbbbbb";
static char selfgcolor[]            = "#eeeeee";
static char selbordercolor[]        = "#005577";
static char selbgcolor[]            = "#005577";
static char *colors[][3] = {
       /*               fg           bg           border   */
       [SchemeNorm] = { normfgcolor, normbgcolor, normbordercolor },
       [SchemeSel]  = { selfgcolor,  selbgcolor,  selbordercolor  },
};
/* tranparency */
static const unsigned int baralpha = 0xbf;
static const unsigned int borderalpha = OPAQUE;
static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};

/*
 * Xresources preferences to load at startup
 */
ResourcePref resources[] = {
		{ "font",             STRING,  &font            },
		{ "normbgcolor",      STRING,  &normbgcolor     },
		{ "normbordercolor",  STRING,  &normbordercolor },
		{ "normfgcolor",      STRING,  &normfgcolor     },
		{ "selbgcolor",       STRING,  &selbgcolor      },
		{ "selbordercolor",   STRING,  &selbordercolor  },
		{ "selfgcolor",       STRING,  &selfgcolor      },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class          instance        title       tags mask     isfloating    monitor */
  { "firefox",      NULL,           NULL,       1 << 8,       0,            -1 },
  { "librewolf",    NULL,           NULL,       1 << 8,       0,            -1 },
  { "discord",      NULL,           NULL,       1 << 7,       0,            -1 },
  { "Steam",        NULL,           NULL,       1 << 6,       0,            -1 },
  { "St",           "st-float",     NULL,       ~0,           1,            -1 },
  { "stalonetray",  "stalonetray",  NULL,       0,            1,            -1 },
  { "Pinentry-gtk-2", NULL,         NULL,       0,            1,            -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 2;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 0; /* 1 will force focus on the fullscreen window */

#include "fibonacci.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
  { "[@]",      spiral  },  // first entry is default
  { "[|]",      tile  },
  { "@[]",      dwindle },
  { "fff",      NULL  },  // no layout function means floating behavior
  { "[M]",      monocle },
  { NULL,       NULL  },
};

/* key definitions */
#define MODKEY Mod4Mask
#define LAltMask Mod1Mask  // Left alt as mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
/* spawning commands in st */
#define STCMD(...) { .v = (const char*[]){ "st", "-e", __VA_ARGS__, NULL } }
/* helper for spawning applications */
#define XACMD(...) { .v = (const char*[]){ __VA_ARGS__, NULL } }

/*
 * commands
 * some commands are initialized in an array for being too long
 */
#include "movestack.c"

static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "mdmenu_run", "-m", dmenumon, "-h", "8", "-i", NULL }; // uses my dmenu_run script

/* commands spawned when clicking statusbar, the mouse button pressed is exported as BUTTON */
static char *statuscmds[] = { "notify-send Mouse$BUTTON" };
static char *statuscmd[] = { "/bin/sh", "-c", NULL, NULL };

static Key keys[] = {
  /* modifier   key   function    argument */

  /* DWM control */
  { MODKEY,                       XK_b,   togglebar,  {0}                                   },
  { MODKEY,                       XK_F11, spawn,      SHCMD("dunst_toggle")                 },  // Toggle dunst notifications
  { MODKEY|ControlMask,           XK_backslash, spawn, SHCMD("dunstctl close")              },
  { MODKEY|ControlMask|ShiftMask, XK_backslash, spawn, SHCMD("dunstctl close-all")          },
  { MODKEY|ControlMask,           XK_space,     spawn, SHCMD("dunstctl history-pop")        },
  { MODKEY,                       XK_F12, spawn,      SHCMD("xset s activate")              },  // Lockscreen

  /* media keys */
  { MODKEY,             XK_F5,    spawn,  SHCMD("mpc toggle")                       },  // mpc pause/play
  { MODKEY|ShiftMask,   XK_F5,    spawn,  SHCMD("mpc seek 0")                       },  // mpc repeat current track
  { MODKEY,             XK_F6,    spawn,  SHCMD("mpc prev")                         },  // mpc prev song
  { MODKEY|ShiftMask,   XK_F6,    spawn,  SHCMD("mpc volume -5")                    },  // mpc volume down
  { MODKEY,             XK_F7,    spawn,  SHCMD("mpc next")                         },  // mpc next song
  { MODKEY|ShiftMask,   XK_F7,    spawn,  SHCMD("mpc volume +5")                    },  // mpc volume up
  { MODKEY|ControlMask, XK_F5,    spawn,  SHCMD("notify-send -u low 'Current song' \"$(mpc current)\" &") },
  { MODKEY|ShiftMask,   XK_F8,    spawn,  SHCMD("amixer set Capture toggle; dwmblocks -s2") },  // mic mute
  { MODKEY|ControlMask, XK_F8,    spawn,  SHCMD("next_sink; dwmblocks -s2")         },  // use next pulse sink in list
  { MODKEY,   XK_F8,    spawn,    SHCMD("amixer set Master toggle; dwmblocks -s2")  },  // volume mute
  { MODKEY,   XK_F9,    spawn,    SHCMD("amixer set Master 5%-; dwmblocks -s2")     },  // volume down
  { MODKEY,   XK_F10,   spawn,    SHCMD("amixer set Master 5%+; dwmblocks -s2")     },  // volume up

  /* masters settings*/
  { MODKEY|ShiftMask,   XK_h,   incnmaster,   {.i = -1 }    },
  { MODKEY|ShiftMask,   XK_l,   incnmaster,   {.i = +1 }    },
  { MODKEY,             XK_h,   setmfact,     {.f = -0.05}  },
  { MODKEY,             XK_l,   setmfact,     {.f = +0.05}  },

  /* layout settings */
  { MODKEY,             XK_comma,   focusmon,     {.i = -1 }  },
  { MODKEY,             XK_period,  focusmon,     {.i = +1 }  },
  { MODKEY|ShiftMask,   XK_comma,   tagmon,       {.i = -1 }  },
  { MODKEY|ShiftMask,   XK_period,  tagmon,       {.i = +1 }  },
  { MODKEY,             XK_period,  focusmon,     {.i = +1 }  },
  { MODKEY,             XK_Left,    cyclelayout,  {.i = -1 }  },
  { MODKEY,             XK_Right,   cyclelayout,  {.i = +1 }  },
  { MODKEY,             XK_0,       view,         {.ui = ~0 } },
  { MODKEY|ShiftMask,   XK_0,       tag,          {.ui = ~0 } },
  // { MODKEY|ShiftMask,    XK_equal,   setgaps,      {.i = gappx } },
};

/* button definitions */
#define DWMBLOCKS_ENV "DWMBLOCKS_BUTTON"
#define DWMBLOCKS_PIDFILEPATH "/tmp/dwmblocks.pid"

/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
  /* click event    mask        button    function        argument */
  { ClkLtSymbol,    0,          Button1,  setlayout,      {0}                 },
  { ClkWinTitle,    0,          Button2,  zoom,           {0}                 },
  { ClkLtSymbol,    0,          Button3,  setlayout,      {.v = &layouts[3]}  },
	{ ClkStatusText,  0,          Button1,  sigdwmblocks,   {.i = 1}            },
	{ ClkStatusText,  0,          Button2,  sigdwmblocks,   {.i = 2}            },
	{ ClkStatusText,  0,          Button3,  sigdwmblocks,   {.i = 3}            },
	{ ClkStatusText,  ShiftMask,  Button1,  sigdwmblocks,   {.i = 4}            },
	{ ClkStatusText,  ShiftMask,  Button2,  sigdwmblocks,   {.i = 5}            },
	{ ClkStatusText,  ShiftMask,  Button3,  sigdwmblocks,   {.i = 6}            },
  { ClkClientWin,   MODKEY,     Button1,  movemouse,      {0}                 },
  { ClkClientWin,   MODKEY,     Button2,  togglefloating, {0}                 },
  { ClkClientWin,   MODKEY,     Button3,  resizemouse,    {0}                 },
  { ClkTagBar,      0,          Button1,  view,           {0}                 },
  { ClkTagBar,      0,          Button3,  toggleview,     {0}                 },
  { ClkTagBar,      MODKEY,     Button1,  tag,            {0}                 },
  { ClkTagBar,      MODKEY,     Button3,  toggletag,      {0}                 },
};

