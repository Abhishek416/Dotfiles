-- Base
import XMonad
import System.Exit

-- Actions
import XMonad.Actions.CycleWS ( toggleWS )
import XMonad.Actions.Minimize
import XMonad.Actions.WithAll (sinkAll, killAll)

-- Data
import Data.Monoid
import Data.Maybe (fromJust)
import qualified Data.Map        as M

-- Hooks
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

-- Layout
import XMonad.Layout.Fullscreen
import XMonad.Layout.Minimize
import XMonad.Layout.Tabbed

-- Layouts modifiers 
import XMonad.Layout.LayoutModifier
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, FULL, MIRROR, NOBORDERS))
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import qualified XMonad.Layout.BoringWindows as BW
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))

-- Utilities
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Util.Font
import qualified XMonad.StackSet as W
import Graphics.X11.ExtraTypes.XF86

myTerminal :: String
myTerminal = "alacritty"

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

myClickJustFocuses :: Bool
myClickJustFocuses = False

myBorderWidth  = 1

myModMask  = mod4Mask

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset


-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
myWorkspaces    = ["1 ","2 ","3 ","4 ","5 ","6 ","7 ","8 ","9 "]
myWorkspaceIndices = M.fromList $ zipWith (,) myWorkspaces [1..] -- (,) == \x y -> (x,y)


--myNormalBorderColor  = "#dddddd"
--myNormalBorderColor = "#282c34"
myNormalBorderColor = "#222222"

myFocusedBorderColor = "#46d9ff"
--myFocusedBorderColor = "#5c5c5c"
--myFocusedBorderColor = "#cd8b00"

------------------------------------------------------------------------

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf) ]
    ++

    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


myAdditionalKeys :: [(String, X ())]
myAdditionalKeys =
-- XMonad
        [ ("M-C-r", spawn "xmonad --recompile") -- Recompiles xmonad 
        , ("M-C-q", spawn "xmonad --restart") -- Restarts xmonad
        , ("M-S-q", io exitSuccess) -- Quits xmonad

-- Run Dmenu
        , ("M-d", spawn "dmenu_run") -- Dmenu

-- Useful programs to have a keybinding for launch 
        , ("M-S-<Return>", spawn (myTerminal))
        , ("M-S-r", spawn ("st -e ranger"))
        , ("M-S-i", spawn (myTerminal ++ " -e htop"))

-- Kill windows
        , ("M-S-c", kill) -- Kill the currently focused client
        , ("M-S-a", killAll) -- Kill all windows on current workspace 

-- Window navigation 
        , ("M-j", windows W.focusDown) -- Move focus to the next window
        , ("M-k", windows W.focusUp) -- Move focus to the prev window 
        , ("M-<Return>", windows W.swapMaster) -- Swap the focused window and the master
        , ("M-S-j", windows W.swapDown) -- swap focused window with next window
        , ("M-S-k", windows W.swapUp) -- swap focused window with prev window 	
        , ("M-<Tab>", toggleWS ) -- toggle workspace

-- Window resizing 
        , ("M-h", sendMessage Shrink) -- Shrink horiz window width 
        , ("M-l", sendMessage Expand) -- Expand horiz window with
        , ("M-i", sendMessage MirrorShrink) --Shrink vertically
        , ("M-o", sendMessage MirrorExpand) --Expand vertically

-- Layouts
        , ("M-b", sendMessage ToggleStruts) -- Toggle the status bar gap
        , ("M-<Space>", sendMessage NextLayout) -- Switch to next layout
        , ("M-t", withFocused $ windows . W.sink)
	      , ("M-m", withFocused minimizeWindow )
	      , ("M-S-m", withLastMinimized maximizeWindow)
        , ("M-,", sendMessage (IncMasterN 1)) -- Increase # of clients master
        , ("M-.",sendMessage (IncMasterN (-1))) -- Decrease # of clients master

-- Multimedia Keys 
        , ("<XF86PowerDown>",         spawn "sudo pm-suspend")
        , ("<XF86AudioRaiseVolume>",  spawn "amixer set Master 10%+")
        , ("<XF86AudioLowerVolume>",  spawn "amixer set Master 10%-")
        , ("<XF86AudioMute>",         spawn "amixer set Master toggle")
        , ("<XF86MonBrightnessUp>",   spawn "brightnessctl set +6%")
        , ("<XF86MonBrightnessDown>", spawn "brightnessctl set 6%-")
        , ("<Print>",                 spawn "scrot -s -e 'mv $f ~/Pictures/screenshots/'")
        ] 
------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]

-----------------------------------------------------------------------
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a 
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

mySpacing' :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing' i = spacingRaw True (Border i i i i) True (Border i i i i) True

-- Layouts:
myLayout = avoidStruts (smartSpacing 5 $ ResizableTall 1 (3/100) (1/2) []  ||| Mirror tiled)
  where
     tiled   = Tall nmaster delta ratio
     nmaster = 1
     ratio   = 1/2
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:

myManageHook = composeAll
    [ fullscreenManageHook
    , manageDocks
    , isFullscreen                  --> doFullFloat
    , className =? "vlc"            --> doFloat
    , className =? "confirm"        --> doFloat
    , className =? "file_progress"  --> doFloat
    , className =? "download"       --> doFloat
    , className =? "dialog"         --> doFloat
    , className =? "error"          --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "notification"   --> doFloat
    , className =? "toolbar"        --> doFloat
    , title =? "Mozilla Firefox"    --> doShift ( myWorkspaces !! 1)
    , title =? "pcmanfm"            --> doShift ( myWorkspaces  !! 2)
    , className =? "ranger"         --> doShift ( myWorkspaces !! 2) ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
-- myEventHook = do 

-----------------------------------------------------------------------
-- Startup hook
myStartupHook :: X () 
myStartupHook = do
        spawnOnce "nitrogen --restore &"
        spawnOnce "picom --experimental-backend"

------------------------------------------------------------------------
main = do
   xmproc0 <- spawnPipe "xmobar -x 0 /home/abhishek/.config/xmobar/xmobarrc"
   xmonad $ fullscreenSupport $ docks def
       {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         =  minimize . BW.boringWindows $ myLayout,
        manageHook         =  myManageHook, 
        handleEventHook    = fullscreenEventHook,
        startupHook        = myStartupHook,
        logHook            = dynamicLogWithPP $ xmobarPP
	    { ppOutput = \x -> hPutStrLn xmproc0 x
	    , ppCurrent = xmobarColor "#98be65" "" . wrap "[" "]"
	    , ppVisible = xmobarColor "#98be65" "" 
	    , ppHidden = xmobarColor "#82AAFF" "" . wrap " *" "" 
--	    , ppHiddenNoWindows = xmobarColor "#c792ea" "" 
	    , ppTitle = xmobarColor "#b3afc2" "" . shorten 40
	    , ppSep = "<fc=#666666> <fn=1>|</fn> </fc>"
	    , ppUrgent = xmobarColor "#c45500" "" . wrap "!" "!"
	    , ppExtras = [windowCount]
	    , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
	    }
	}  `additionalKeysP` myAdditionalKeys



-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]

