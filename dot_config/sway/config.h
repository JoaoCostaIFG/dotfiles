
static Key keys[] = {
  /* modifier   key   function    argument */

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
};
