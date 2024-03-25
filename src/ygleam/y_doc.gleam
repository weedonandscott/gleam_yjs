import ygleam/y.{
  type Transaction, type YArray, type YDoc, type YMap, type YText,
  type YXmlElement, type YXmlFragment,
}

@external(javascript, "../yDoc.mjs", "do_new")
pub fn new() -> YDoc

@external(javascript, "../yDoc.mjs", "clientID")
pub fn client_id(y_doc: YDoc) -> String

@external(javascript, "../yDoc.mjs", "gc")
pub fn gc(y_doc: YDoc) -> Bool

@external(javascript, "../yDoc.mjs", "transact")
pub fn transact(y_doc: YDoc, cb: fn() -> Nil, origin: a) -> Nil

@external(javascript, "../yDoc.mjs", "getArray")
pub fn get_array(y_doc: YDoc, name: String) -> YArray

@external(javascript, "../yDoc.mjs", "getMap")
pub fn get_map(y_doc: YDoc, name: String) -> YMap

@external(javascript, "../yDoc.mjs", "getText")
pub fn get_text(y_doc: YDoc, name: String) -> YText

@external(javascript, "../yDoc.mjs", "getXmlElement")
pub fn get_xml_element(y_doc: YDoc, name: String) -> YXmlElement

@external(javascript, "../yDoc.mjs", "getXmlFragment")
pub fn get_xml_fragment(y_doc: YDoc, name: String) -> YXmlFragment

@external(javascript, "../yDoc.mjs", "destroy")
pub fn destroy(y_doc: YDoc) -> Nil

@external(javascript, "../yDoc.mjs", "onBeforeTransaction")
pub fn on_before_transaction(
  y_doc: YDoc,
  cb: fn(Transaction, YDoc) -> Nil,
) -> Nil

@external(javascript, "../yDoc.mjs", "onBeforeObserverCalls")
pub fn on_before_observer_calls(
  y_doc: YDoc,
  cb: fn(Transaction, YDoc) -> Nil,
) -> Nil

@external(javascript, "../yDoc.mjs", "onAfterTransaction")
pub fn on_after_transaction(
  y_doc: YDoc,
  cb: fn(Transaction, YDoc) -> Nil,
) -> Nil

@external(javascript, "../yDoc.mjs", "onUpdate")
pub fn on_update(
  y_doc: YDoc,
  cb: fn(BitArray, a, YDoc, Transaction) -> Nil,
) -> Nil

@external(javascript, "../yDoc.mjs", "onUpdateV2")
pub fn on_update_v2(
  y_doc: YDoc,
  cb: fn(BitArray, a, YDoc, Transaction) -> Nil,
) -> Nil

@external(javascript, "../yDoc.mjs", "onSubdocs")
pub fn on_subdocs(
  y_doc: YDoc,
  cb: fn(List(YDoc), List(YDoc), List(YDoc)) -> Nil,
) -> Nil

@external(javascript, "../yDoc.mjs", "onDestroy")
pub fn on_destroy(y_doc: YDoc, cb: fn(YDoc) -> Nil) -> Nil
