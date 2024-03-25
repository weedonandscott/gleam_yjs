import gleam/dict.{type Dict}
import gleam/option.{type Option}
import ygleam/y.{type BaseType, type Transaction, type YDoc}

pub type Awareness

pub type AwarenessLocalState =
  List(#(String, BaseType))

pub type AwarenessStates =
  Dict(Float, AwarenessLocalState)

@external(javascript, "../awareness.mjs", "do_new")
pub fn new(ydoc: YDoc) -> Awareness

@external(javascript, "../awareness.mjs", "destroy")
pub fn destroy(awareness: Awareness) -> Nil

@external(javascript, "../awareness.mjs", "getLocalState")
pub fn get_local_state(awareness: Awareness) -> Option(AwarenessLocalState)

@external(javascript, "../awareness.mjs", "setLocalState")
pub fn set_local_state(
  awareness: Awareness,
  state: Option(AwarenessLocalState),
) -> Nil

@external(javascript, "../awareness.mjs", "setLocalStateField")
pub fn set_local_state_field(
  awareness: Awareness,
  field: String,
  value: BaseType,
) -> Nil

@external(javascript, "../awareness.mjs", "getStates")
pub fn get_states(awareness: Awareness) -> AwarenessStates

@external(javascript, "../awareness.mjs", "on_change")
pub fn on_change(
  awareness: Awareness,
  cb: fn(List(Int), List(Int), List(Int), Option(Transaction)) -> Nil,
) -> Nil

@external(javascript, "../awareness.mjs", "on_update")
pub fn on_update(
  awareness: Awareness,
  cb: fn(List(Int), List(Int), List(Int), Option(Transaction)) -> Nil,
) -> Nil

@external(javascript, "../awareness.mjs", "removeAwarenessStates")
pub fn remove_awareness_states(
  awareness: Awareness,
  clients: List(Int),
  origin: a,
) -> Nil

@external(javascript, "../awareness.mjs", "encodeAwarenessUpdate")
pub fn encode_awareness_update(
  awareness: Awareness,
  clients: List(Int),
) -> BitArray

@external(javascript, "../awareness.mjs", "modifyAwarenessUpdate")
pub fn modify_awareness_update(update: BitArray, modify: fn(a) -> b) -> BitArray

@external(javascript, "../awareness.mjs", "applyAwarenessUpdate")
pub fn apply_awareness_update(
  awareness: Awareness,
  update: BitArray,
  origin: a,
) -> Nil
