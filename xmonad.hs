import Control.Monad
import Data.Bool
import Data.Foldable
import Data.Traversable
import System.IO
import XMonad
import XMonad.Layout
import XMonad.Layout.ThreeColumns
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig

import qualified XMonad.StackSet as W

main :: IO ()
main = do
  xmonad $ def
         { layoutHook = smartBorders $
           ThreeCol 1 (3/100) (1/4) ||| noBorders Full ||| Tall 1 (3/100) (1/2)
         , focusFollowsMouse = False
         , startupHook = spawn "sh ~/.scripts/startup.sh"
         } `additionalKeysP` myKeys

myKeys :: [(String, X ())]
myKeys = [ ("M1-M4-S-C-a", grabApp "anki" "Anki")
         , ("M1-M4-S-C-c", grabApp "brave" "Brave-browser")
         , ("M1-M4-S-C-e", grabApp "cmacs" "Emacs")
         , ("M1-M4-S-C-f", grabApp "firefox" "Firefox")
         -- , ("M1-M4-S-C-g", grabApp "signal-desktop" "Signal")
         , ("M1-M4-S-C-g", grabApp "telegram-desktop" "TelegramDesktop")
         , ("M1-M4-S-C-k", grabApp "slack" "Slack")
         , ("M1-M4-S-C-s", grabApp "spotify" "Spotify")
         , ("M1-M4-S-C-t", grabApp "xterm" "XTerm")
         , ("M1-M4-S-C-v", grabApp "vlc" "vlc")
         , ("M1-c",        spawn   "sh ~/.scripts/check-time.sh")
         , ("M1-d",        spawn   "disper -d eDP-1,DP-3 -r auto --cycle-stages=\"-s:-c:-e\" --cycle -t right")
         , ("M1-b",        spawn   "sh ~/.scripts/check-battery.sh")
         , ("M1-S-l",      spawn   "slock")
         , ("M1-m",        spawn   "sh ~/.scripts/pomodoro.sh")
         , ("M1-s",        spawn   "bash ~/.scripts/cycle-sound.sh")
         , ("C-<Space>",   spawn   "sh ~/.scripts/switch-keymap.sh")
         , ( "<XF86MonBrightnessUp>"
           , spawn "sh ~/.scripts/brightness.sh +2"
           )
         , ( "<XF86MonBrightnessDown>"
           , spawn "sh ~/.scripts/brightness.sh -2"
           )
         , ( "<XF86AudioRaiseVolume>"
           , spawn "pactl set-sink-volume @DEFAULT_SINK@ +1000"
           )
         , ( "<XF86AudioLowerVolume>"
           , spawn "pactl set-sink-volume @DEFAULT_SINK@ -1000"
           )
         , ( "<XF86AudioMute>"
           , spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle"
           )
         , ( "<XF86AudioPlay>" -- default to spotify until intelligent process stuff
           , spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"
           )
         , ( "<XF86AudioPrev>" -- default to spotify until intelligent process stuff
           , spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous"
           )
         , ( "<XF86AudioNext>" -- default to spotify until intelligent process stuff
           , spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"
           )
         ]

findAppWindows :: String -> X [Window]
findAppWindows queriedName = withWindowSet filterQueried
  where
    filterQueried windowSet
      = filterM (hasWindowName queriedName)
      $ W.allWindows windowSet

hasWindowName :: String -> Window -> X Bool
hasWindowName queriedName window
  =   (== queriedName)
  <$> runQuery className window

grabApp :: String -> String -> X ()
grabApp spawnName matchName = do
  winV <- findAppWindows matchName
  case winV of
    (headWin:_) -> windows . W.focusWindow $ head winV
    _           -> spawn spawnName