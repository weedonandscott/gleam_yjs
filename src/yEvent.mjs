import { List } from "./gleam.mjs";

import { NumberSection, StringSection } from "./ygleam/y_event.mjs";
import { toYType } from "./utils.mjs";

export function target(anyEvent) {
  return toYType(anyEvent.event.target);
}

export function currentTarget(anyEvent) {
  return toYType(anyEvent.event.currentTarget);
}

export function transaction(anyEvent) {
  return anyEvent.event.transaction;
}

export function path(anyEvent) {
  List.fromArray(
    anyEvent.event.path.map((section) =>
      typeof section === "number"
        ? new NumberSection(section)
        : new StringSection(section),
    ),
  );
}

// YMapEvent and YTextEvent ONLY (typed in Gleam)
export function keysChanged(yMapOrTextEvent) {
  return List.fromArray([...yMapOrTextEvent.keysChanged]);
}

// YXmlEvent ONLY (typed in Gleam)
export function attributesChanged(yXmlEvent) {
  return List.fromArray([...yXmlEvent.attributesChanged]);
}
