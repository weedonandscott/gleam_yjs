import * as Y from "yjs";

import { List } from "./gleam.mjs";
import { None, Some } from "../gleam_stdlib/gleam/option.mjs";

import * as YGleamEvent from "./ygleam/y_event.mjs";

import { classifyKnownYValue, toYType } from "./utils.mjs";

export function doc(yAbstractType) {
  const doc = yAbstractType.doc;
  return doc ? Some(doc) : None;
}

export function parent(yAbstractType) {
  const parent = yAbstractType.parent;

  if (!parent) {
    return None;
  } else {
    return Some(toYType(parent));
  }
}

function changesKeys(yEvent) {
  return List.fromArray(
    [...yEvent.changes.keys.entries()].map(([key, { action, oldValue }]) => [
      key,
      action,
      oldValue ? new Some(classifyKnownYValue(oldValue)) : new None(),
    ]),
  );
}

const _observeHandlersMap = new Map();

export function observe(yAbstractType, cb) {
  const newHandler = (evt, t) => {
    cb(evt, changesKeys(evt), t);
  };

  _observeDeepHandlersMap.set(cb, newHandler);
  yAbstractType.observe(newHandler);
  return () => yAbstractType.unobserve(_observeHandlersMap.get(cb));
}

const _observeDeepHandlersMap = new Map();

export function observeDeep(yAbstractType, cb) {
  const newHandler = (events, tr) =>
    cb(
      List.fromArray(
        events.map((event) => {
          if (event instanceof Y.YArrayEvent) {
            return new YGleamEvent.ArrayEvent(event, changesKeys(event));
          } else if (event instanceof Y.YMapEvent) {
            return new YGleamEvent.MapEvent(event, changesKeys(event));
          } else if (event instanceof Y.YTextEvent) {
            return new YGleamEvent.TextEvent(event, changesKeys(event));
          } else if (event instanceof Y.YXmlEvent) {
            return new YGleamEvent.XmlEvent(event, changesKeys(event));
          } else {
            return new YGleamEvent.BaseEvent(event, changesKeys(event));
          }
        }),
      ),
      tr,
    );
  _observeDeepHandlersMap.set(cb, newHandler);
  yAbstractType.observeDeep(newHandler);

  return () => yAbstractType.unobserveDeep(_observeDeepHandlersMap.get(cb));
}
