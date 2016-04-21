import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
-- import XMonad.Actions.Volume

main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/ds/.xmobarrc"
    xmonad $ defaultConfig 
            {
--             terminal = "urxvt"
             manageHook = manageDocks <+> manageHook defaultConfig
            , layoutHook = avoidStruts $ layoutHook defaultConfig
            , logHook = dynamicLogWithPP xmobarPP
                        {   ppOutput = hPutStrLn xmproc
                          , ppTitle = xmobarColor "green" "" . shorten 50
                        }
            , modMask = mod4Mask
--            , ((modMask x, xK_F11 ), lowerVolume 3 >> return ())
--            , ((modMask x, xK_F12 ), raiseVolume 3 >> return ())
--            , ((modMask x, xK_F10 ), toggleMute    >> return ())
--            , normalBorderColor = "green"
              , focusedBorderColor = "green"
           } `additionalKeys`
           [  ((controlMask , xK_F12), spawn "pactl set-sink-volume 0 +5%")
           ,  ((controlMask , xK_F11), spawn "pactl set-sink-volume 0 -- -5%")
           ,  ((controlMask , xK_F10), spawn "pactl set-sink-mute 0 toggle")
           ,  ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
           , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
           , ((0, xK_Print), spawn "scrot")
           ]
--
