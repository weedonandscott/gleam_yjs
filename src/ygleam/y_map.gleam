import gleam/dynamic
import gleam/iterator.{type Iterator}
import gleam/option.{type Option}
import ygleam/y.{
  type BaseType, type Transaction, type YDoc, type YMap, type YType, type YValue,
}
import ygleam/y_event.{type AnyYEvent, type ChangesKeys, type YMapEvent}

@external(javascript, "../yMap.mjs", "do_new")
pub fn new() -> YMap

@external(javascript, "../yMap.mjs", "doc")
pub fn doc(y_map: YMap) -> Option(YDoc)

@external(javascript, "../yMap.mjs", "parent")
pub fn parent(y_map: YMap) -> Option(YType)

@external(javascript, "../yMap.mjs", "set")
pub fn set(y_map: YMap, key: String, value: YValue) -> YMap

@external(javascript, "../yMap.mjs", "setDynamic")
pub fn set_dynamic(y_map: YMap, key: String, value: dynamic.Dynamic) -> YMap

@external(javascript, "../yMap.mjs", "get")
pub fn get(y_map: YMap, key: String) -> YValue

@external(javascript, "../yMap.mjs", "getDynamic")
pub fn get_dynamic(y_map: YMap, key: String) -> dynamic.Dynamic

@external(javascript, "../yMap.mjs", "deleteKey")
pub fn delete(y_map: YMap, key: String) -> YMap

@external(javascript, "../yMap.mjs", "has")
pub fn has(y_map: YMap, key: String) -> Bool

@external(javascript, "../yMap.mjs", "toJSON")
pub fn to_json(y_map: YMap) -> BaseType

@external(javascript, "../yMap.mjs", "size")
pub fn size(y_map: YMap) -> Int

@external(javascript, "../yMap.mjs", "forEach")
pub fn for_each(y_map: YMap, cb: fn(YValue, String, YMap) -> Nil) -> YMap

@external(javascript, "../yMap.mjs", "entries")
pub fn entries(y_map: YMap) -> Iterator(#(String, YValue))

@external(javascript, "../yMap.mjs", "values")
pub fn values(y_map: YMap) -> Iterator(YValue)

@external(javascript, "../yMap.mjs", "keys")
pub fn keys(y_map: YMap) -> Iterator(String)

@external(javascript, "../yMap.mjs", "clone")
pub fn clone(y_map: YMap) -> YMap

@external(javascript, "../yMap.mjs", "observe")
pub fn observe(
  y_map: YMap,
  cb: fn(YMapEvent, ChangesKeys, Transaction) -> Nil,
) -> fn() -> Nil

@external(javascript, "../yMap.mjs", "observeDeep")
pub fn observe_deep(
  y_map: YMap,
  cb: fn(List(AnyYEvent), Transaction) -> Nil,
) -> fn() -> Nil
