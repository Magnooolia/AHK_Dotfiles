; --- 1. 鼠标滚轮反转 ---
WheelUp::Send("{WheelDown}")
WheelDown::Send("{WheelUp}")

; AutoHotkey v2 语法
; 使用 #InputLevel 改变钩子优先级
#Requires AutoHotkey v2.0

; 提高输入层级，可能绕过某些应用的拦截
#InputLevel 1

~LButton & a:: {
    SendInput "{LButton Up}"
    Sleep 15
    SendInput "^a"
}

~LButton & c:: {
    SendInput "{LButton Up}"
    Sleep 15
    SendInput "^c"
}

~LButton & d:: {
    SendInput "{LButton Up}"
    Sleep 15
    SendInput "{Delete}"
}

~LButton & s:: {
    SendInput "{LButton Up}"
    Sleep 15
    SendInput "^s"
}

~LButton & v:: {
    SendInput "{LButton Up}"
    Sleep 15
    SendInput "^v"
}

~LButton & x:: {
    SendInput "{LButton Up}"
    Sleep 15
    SendInput "^x"
}

;3.CapsLock+

#Requires AutoHotkey v2.0

; ── 状态变量 ──────────────────────────────
global _capsUsed := false
global _capsTime := 0

; ── CapsLock 按下：记录时间，抑制原生行为 ──
*CapsLock:: {
    global _capsUsed, _capsTime
    _capsUsed := false
    _capsTime := A_TickCount
}

; ── CapsLock 释放：短按且未被用作修饰键时切换大小写 ──
*CapsLock Up:: {
    global _capsUsed, _capsTime
    if (!_capsUsed && A_TickCount - _capsTime < 300)
        SetCapsLockState !GetKeyState("CapsLock", "T")
}

; ── CapsLock + ESDF 方向键 ──────────────────
CapsLock & e:: {
    global _capsUsed
    _capsUsed := true
    Send "{Up}"
}
CapsLock & s:: {
    global _capsUsed
    _capsUsed := true
    Send "{Left}"
}
CapsLock & d:: {
    global _capsUsed
    _capsUsed := true
    Send "{Down}"
}
CapsLock & f:: {
    global _capsUsed
    _capsUsed := true
    Send "{Right}"
}

; ── CapsLock + P/; 行首/行尾 ────────────────
CapsLock & p:: {
    global _capsUsed
    _capsUsed := true
    Send "{Home}"
}
CapsLock & `;:: {
    global _capsUsed
    _capsUsed := true
    Send "{End}"
}