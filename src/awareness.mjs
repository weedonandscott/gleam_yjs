import * as awarenessProtocol from "y-protocols/awareness.js";

import { List, BitArray } from "./gleam.mjs";
import { Dict } from "../gleam_stdlib/dict.mjs";
import { unwrap, None, Some } from "../gleam_stdlib/gleam/option.mjs";

export function do_new(ydoc) {
  return new awarenessProtocol.Awareness(ydoc);
}

export function destroy(awareness) {
  return awareness.destroy();
}

export function getLocalState(awareness) {
  const localState = awareness.getLocalState();
  return localState ? Some(Object.entries(localState)) : None;
}

export function setLocalState(awareness, state) {
  const unwrapped = unwrap(state, null);
  return awareness.setLocalState(
    unwrapped ? Object.fromEntries(unwrapped) : null,
  );
}

export function setLocalStateField(awareness, field, value) {
  return awareness.setLocalStateField(field, value);
}

export function getStates(awareness) {
  const states = awareness.getStates();

  let dict = Dict.new();
  states.forEach((value, key) => {
    dict = dict.set(key, Object.entries(value));
  });
  return dict;
}

export function on_change(awareness, cb) {
  return awareness.on("change", (event, tr) => {
    const addedArray = event?.added ?? [];
    const updatedArray = event?.updated ?? [];
    const removedArray = event?.removed ?? [];

    return cb(
      List.fromArray(addedArray),
      List.fromArray(updatedArray),
      List.fromArray(removedArray),
      tr ? Some(tr) : None,
    );
  });
}

export function on_update(awareness, cb) {
  return awareness.on("change", (event, tr) => {
    const addedArray = event?.added ?? [];
    const updatedArray = event?.updated ?? [];
    const removedArray = event?.removed ?? [];

    return cb(
      List.fromArray(addedArray),
      List.fromArray(updatedArray),
      List.fromArray(removedArray),
      tr ? Some(tr) : None,
    );
  });
}

export function removeAwarenessStates(awareness, clients, origin) {
  return awarenessProtocol.removeAwarenessStates(
    awareness,
    clients.toArray(),
    origin,
  );
}

export function encodeAwarenessUpdate(awareness, clients) {
  return new BitArray(
    awarenessProtocol.removeAwarenessStates(awareness, clients.toArray()),
  );
}

export function modifyAwarenessUpdate(update, modify) {
  return new BitArray(
    awarenessProtocol.removeAwarenessStates(update.buffer, modify),
  );
}

export function applyAwarenessUpdate(awareness, update, origin) {
  return awarenessProtocol.removeAwarenessStates(
    awareness,
    update.buffer,
    origin,
  );
}
