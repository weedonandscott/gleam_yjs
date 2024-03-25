import * as Y from "yjs";

import * as YGleamUndoManager from "./ygleam/y_undo_manager.mjs";

export function do_new(scope) {
  return new Y.UndoManager(scope);
}

export function undo(yUndoManager) {
  return yUndoManager.undo();
}

export function redo(yUndoManager) {
  return yUndoManager.redo();
}

export function stopCapturing(yUndoManager) {
  return yUndoManager.stopCapturing();
}

export function onStackItemAdded(yUndoManager, cb) {
  return yUndoManager.on("stack-item-added", (event) => {
    const type =
      event.type == "undo"
        ? new YGleamUndoManager.Undo()
        : new YGleamUndoManager.Redo();

    return cb(event.stackItem, type);
  });
}

export function onStackItemUpdated(yUndoManager, cb) {
  return yUndoManager.on("stack-item-updated", (event) => {
    const type =
      event.type == "undo"
        ? new YGleamUndoManager.Undo()
        : new YGleamUndoManager.Redo();

    return cb(event.stackItem, type);
  });
}

export function onStackItemPopped(yUndoManager, cb) {
  return yUndoManager.on("stack-item-popped", (event) => {
    const type =
      event.type == "undo"
        ? new YGleamUndoManager.Undo()
        : new YGleamUndoManager.Redo();

    return cb(event.stackItem, type);
  });
}

export function onStackCleared(yUndoManager, cb) {
  return yUndoManager.on("stack-cleared", (event) => {
    const undoStackCleared = event?.undoStackCleared ?? false;
    const redoStackCleared = event?.redoStackCleared ?? false;

    return cb(undoStackCleared, redoStackCleared);
  });
}
