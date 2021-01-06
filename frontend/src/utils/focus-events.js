// Use to determine what is the current user's input method (mouse or keyboard)
function onMouseEvent() {
  document.body.classList.add("using-mouse");
}

function onKeyboardEvent(event) {
  const TAB_KEY = 9;
  if (event.keyCode === TAB_KEY) {
    document.body.classList.remove("using-mouse");
  }
}

export function addFocusHandlers() {
  document.body.addEventListener("mousedown", onMouseEvent);
  // Re-enable focus styling when "tab" key is pressed
  document.body.addEventListener("keydown", (event) => onKeyboardEvent(event));
}

export function removeFocusHandlers() {
  document.body.removeEventListener("mousedown", onMouseEvent);
  document.body.removeEventListener("keydown", onKeyboardEvent);
}
