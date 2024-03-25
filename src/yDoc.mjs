import * as Y from "yjs";

import { List, BitArray } from "./gleam.mjs";
import { unwrap } from "../gleam_stdlib/gleam/option.mjs";

export function do_new() {
  return new Y.Doc();
}

export function clientID(yDoc) {
  return yDoc.clientID;
}

export function gc(yDoc) {
  return yDoc.gc;
}

export function transact(yDoc, cb, origin) {
  const unwrappedOrigin = unwrap(origin, undefined);
  return yDoc.transact(cb, unwrappedOrigin);
}

export function getArray(yDoc, name) {
  return yDoc.getArray(name);
}

export function getMap(yDoc, name) {
  return yDoc.getMap(name);
}

export function getText(yDoc, name) {
  return yDoc.getText(name);
}

export function getXmlElement(yDoc, name) {
  return yDoc.getXmlElement(name);
}

export function getXmlFragment(yDoc, name) {
  return yDoc.getXmlFragment(name);
}

export function destroy(yDoc) {
  return yDoc.destroy();
}

export function onBeforeTransaction(yDoc, cb) {
  yDoc.on("beforeTransaction", cb);
}

export function onBeforeObserverCalls(yDoc, cb) {
  yDoc.on("beforeObserverCalls", cb);
}

export function onAfterTransaction(yDoc, cb) {
  yDoc.on("afterTransaction", cb);
}

export function onUpdate(yDoc, cb) {
  yDoc.on("update", (updateMessage, origin, yDoc, transaction) => {
    return cb(BitArray(updateMessage), origin, yDoc, transaction);
  });
}

export function onUpdateV2(yDoc, cb) {
  yDoc.on("updateV2", (updateMessage, origin, yDoc, transaction) => {
    return cb(BitArray(updateMessage), origin, yDoc, transaction);
  });
}

export function onSubdocs(yDoc, cb) {
  yDoc.on("subdocs", (event) => {
    const loadedSet = event?.loaded ?? new Set();
    const addedSet = event?.added ?? new Set();
    const removedSet = event?.removed ?? new Set();

    return cb(
      List.fromArray([...loadedSet]),
      List.fromArray([...addedSet]),
      List.fromArray([...removedSet]),
    );
  });
}

export function onDestroy(yDoc, cb) {
  yDoc.on("destroy", cb);
}
