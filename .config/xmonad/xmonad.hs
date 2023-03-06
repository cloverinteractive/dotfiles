import           XMonad
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.EwmhDesktops
import           XMonad.Hooks.ManageDocks     (ToggleStruts (..), avoidStruts)
import           XMonad.Hooks.StatusBar
import           XMonad.Hooks.StatusBar.PP
import           XMonad.Layout.Magnifier
import           XMonad.Layout.NoBorders
import           XMonad.Layout.Spacing
import           XMonad.Layout.ThreeColumns
import qualified XMonad.StackSet              as W
import           XMonad.Util.EZConfig
import           XMonad.Util.Loggers
import           XMonad.Util.Ungrab

import           Data.List.Split              (splitOn)
import qualified Data.Map                     as M
import           Data.Maybe                   (fromJust)
import           Graphics.X11.ExtraTypes.XF86
import           System.Exit

myTerminal :: String
myTerminal = "urxvt"

myWorkspaces :: [WorkspaceId]
myWorkspaces = ["一", "二", "三", "四", "五", "六", "七", "八", "九"]

myNormalBorderColor :: String
myNormalBorderColor = "#ff79c6"

myFocusedBorderColor :: String
myFocusedBorderColor = "#8be9fd"

myWorkspaceIndices :: M.Map WorkspaceId Integer
myWorkspaceIndices = M.fromList $ zip myWorkspaces [1 ..]

clickable :: String -> String
clickable ws =
  "<action=xdotool key super+" ++ show i ++ ">" ++ ws ++ "</action>"
  where
    i = fromJust $ M.lookup ws myWorkspaceIndices

-- Xmobar color helpers
blue, gray, magenta, purple, red, violet, white :: String -> String
blue = xmobarColor myFocusedBorderColor ""

magenta = xmobarColor myNormalBorderColor ""

purple = xmobarColor "#caa9fa" ""

violet = xmobarColor "#bd39f9" ""

white = xmobarColor "#f8f8f2" ""

red = xmobarColor "#ff5555" ""

gray = xmobarColor "#4d4d4d" ""

-- | Windows should have *some* title, which should not exceed a
-- sane lenght, also make sure that the app name appears before the
-- title for app's such as FireFox
ppWindow :: String -> String
ppWindow = xmobarRaw . concat . appName . splitOn " — "
  where
    appName str@(s:ss)
      | not (null ss) = last ss : [" - ", shorten 50 s]
      | otherwise = str

myXmobarPP :: PP
myXmobarPP =
  def
    { ppSep = magenta "  •  "
    , ppTitle = ppWindow
    , ppTitleSanitize = xmobarStrip
    , ppCurrent = purple . clickable
    , ppVisible = violet . wrap "!" "!" . clickable
    , ppHidden = magenta . wrap " " " " . clickable
    , ppHiddenNoWindows = gray . wrap " " " " . clickable
    , ppUrgent = red . wrap "!" "!"
    , ppOrder = \(ws:_l:fw:_) -> [ws, fw]
    }

myLayout =
  smartBorders $ spacing 16 $ tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled = Tall nmaster delta ratio
    nmaster = 1 -- Default number of windows in the master pane
    ratio = 1 / 2 -- Default proportion of screen occupied by master pane
    delta = 3 / 100 -- Percent of screen to increment by when resizing panes

-------------------------------------------------------------------------------
-- Key bindings
--
myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@XConfig {XMonad.modMask = modm} =
  M.fromList $
  -- launch a terminal
  [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
  --
  -- volume keys
  , ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
  , ( (0, xF86XK_AudioLowerVolume)
    , spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%")
  , ( (0, xF86XK_AudioRaiseVolume)
    , spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%")
  --
  -- brightness keys
  , ((0, xF86XK_MonBrightnessUp), spawn "brightness up")
  , ((0, xF86XK_MonBrightnessDown), spawn "brightness down")
  --
  -- close focused window
  , ((modm .|. shiftMask, xK_c), kill)
  -- rotate through the available layouts
  , ((modm, xK_space), sendMessage NextLayout)
  -- reset the layouts on the current workspace to default
  , ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)
  -- resize viewed windows to the correct size
  , ((modm, xK_n), refresh)
  -- move focus to the next window
  , ((modm, xK_Tab), windows W.focusDown)
  -- move focus to the next window
  , ((modm, xK_j), windows W.focusDown)
  -- move focus to the previous window
  , ((modm, xK_k), windows W.focusUp)
  -- move focus to the master window
  , ((modm, xK_m), windows W.focusMaster)
  -- swap the focus window to the master window
  , ((modm, xK_Return), windows W.swapMaster)
  -- swap the focused window with the next window
  , ((modm .|. shiftMask, xK_j), windows W.swapDown)
  -- swap the focused window with the previous window
  , ((modm .|. shiftMask, xK_k), windows W.swapUp)
  -- shrink the master area
  , ((modm, xK_h), sendMessage Shrink)
  -- expand the master area
  , ((modm, xK_l), sendMessage Expand)
  -- push down back to tiling
  , ((modm, xK_t), withFocused $ windows . W.sink)
  -- increment the number of windows in the master area
  , ((modm, xK_comma), sendMessage (IncMasterN 1))
  -- decrement the number of windows in the master ara
  , ((modm, xK_period), sendMessage (IncMasterN (-1)))
  -- toggle bar
  , ((modm, xK_b), sendMessage ToggleStruts)
  --
  -- quit xmonad
  , ((modm .|. shiftMask, xK_q), io exitSuccess)
  -- restart xmonad
  , ((modm, xK_q), spawn "xmonad --recompile; xmonad --restart")
  ] ++
  --
  -- mod-[1..9], switch to workspace N
  -- mod-shift-[1..9], move client to workspace N
  [ ((m .|. modm, k), windows $ f i)
  | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
  , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
  ] ++
  -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2 or 3
  -- mode-shift-{w,e,r}, move client to screen 1, 2, 3
  [ ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
  | (key, sc) <- zip [xK_w, xK_e, xK_r] [0 ..]
  , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
  ] ++
  --
  -- spawn programs
  -- launch betterlockscreen
  [ ((modm, xK_z), spawn "betterlockscreen -l dim")
  -- launch rofi
  , ( (modm .|. shiftMask, xK_d)
    , spawn
        "rofi -dpi 200.26 -show run -lines 3 -width 80 -padding 20px -separator-style none -font \"Fira Code 18\" -bw 0")
  ]

-------------------------------------------------------------------------------
-- Mouse bindings: defaults actions bound to mouse events
--
myMouseBindings XConfig {XMonad.modMask = modm} =
  M.fromList
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ( (modm, button1)
      , \w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster)
    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), \w -> focus w >> windows W.shiftMaster)
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ( (modm, button3)
      , \w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster)
    ]

myConfig =
  def
    { borderWidth = 0
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , modMask = mod4Mask -- Rebind Mod to Super key
    , terminal = myTerminal
    , workspaces = myWorkspaces
    -- key bindings
    , keys = myKeys
    , mouseBindings = myMouseBindings
    -- hooks
    , layoutHook = avoidStruts myLayout -- Use custom layouts
    }

main :: IO ()
main =
  xmonad .
  ewmhFullscreen .
  ewmh .
  withEasySB (statusBarProp "xmobar" (pure myXmobarPP)) defToggleStrutsKey $
  myConfig
